module qv.web;

//import qv.tivs;
import vibe.d;
//import qv.schemas;
import qv.schemas: UserSchema, UserSessionSchema;

final class QvApp
{
	SessionVar!(UserSessionSchema, "user_session") userSession;

	this()
	{
		UserSessionSchema sessionInit;
		sessionInit.userID = 0;
		sessionInit.signedIn = false;
		this.userSession = sessionInit;
	}


	/***************************************************************
		Error handling and Authentication
	****************************************************************/
	private enum handleError = errorDisplay!errorHandler;
	void errorHandler(string _error, HTTPServerResponse res)
	{
		//res.writeBody(_error); // replace with error page
		//res.writeBody("Error page handle"); // replace with error page
		string message = _error;
		render!("not_found.dt", message);
	}

	private enum auth = before!ensureAuth("_userAuth");
	private int ensureAuth(HTTPServerRequest req, HTTPServerResponse res)
	{
		if (!this.isSignedIn()) {
			// check if cookie is set and validate cookies, 
			// login with cookie and update session token for cookies
			redirect("/signin");
		}

		return this.userSession.userID;
	}
	mixin PrivateAccessProxy;

	@noRoute
	private void sessionSignIn(int userID, bool rememberSession=false)
	{
		UserSessionSchema sessionInit;
		sessionInit.userID = userID;
		sessionInit.signedIn = true;
		this.userSession = sessionInit;
	}

	private bool isSignedIn()
	{
		return this.userSession.signedIn ? true : false;
		//res.cookies[string]
	}




	/*******************************************************************
		Various Pages (Tivs, Explore, Notificatios, etc.)
	********************************************************************/
	@handleError 
	void index(string _error)
	{
		redirect("/tivs/1");
	}

	@handleError 
	@path("/tivs/:currentPage")
	void getTivs(string _error, int _currentPage)
	{
		import qv.tivs: Tivs;
		import qv.schemas: TivSchema;
		
		int currentPage = _currentPage ? _currentPage : 1;
		// FIX: Count all tivs considering filtering and feeds
		int tivsTotalCount = Tivs.countAll(userSession.userID);

		import qv.enums: SettingsType;
		import qv.settings: settings;
		import qv.pagination: Pagination;

		int tivsPerPage = settings(SettingsType.tivsPerPageHome);
		auto pagination = Pagination(currentPage, tivsPerPage, tivsTotalCount);
		TivSchema[] tivs;
    
		tivs = Tivs.findAll(userSession.userID, pagination.offset(), tivsPerPage);

		if (tivs.length < 0) tivs = []; // is this line neccessary?? (fix in Tivs class)		
		render!("tivs.dt", tivs, pagination);
	}


	@handleError
	@path("/tiv_view/:tivID")
	void getTiv(string _error, int _tivID, HTTPServerRequest req, HTTPServerResponse res)
	{
		import qv.tivs: Tivs;
		import qv.schemas: TivSchema;
		TivSchema tiv = Tivs.findByID(_tivID);
		//FIX: exception for results not found (maybe in diet template??)
		render!("tiv_view.dt", tiv);
	}

	@handleError 
	void getDiscover(string _error, HTTPServerRequest req, HTTPServerResponse res)
	{
		import qv.tivs: Tivs;
		import qv.schemas: CategorySchema;
		CategorySchema[] categories = Tivs.findAllCategories();
		render!("discover.dt", categories);
	}

	/****************************************************************
		User Routes
	****************************************************************/
	//@auth
	/*
	* Redirects user with pagination page 
	*/
	@handleError
	@path("/users/:userID")
	void getUserProfile(string _error, int _userID) {
		import std.conv: to;
		redirect("/users/" ~ to!string(_userID) ~ "/1");
	}

	@handleError
	//@auth
	@path("/users/:userID/:currentPage")
	void getUserProfile(string _error, /*int _userAuth,*/ int _userID, int _currentPage, HTTPServerRequest req, HTTPServerResponse res)
	{
		import qv.users: Users;
		import qv.schemas: UserSchema, TivSchema;
		import qv.tivs: Tivs;
		UserSchema user = Users.findByID(_userID);

		if(user == UserSchema.init) 
		{
			string message = "No user of specified ID found.";
			render!("not_found.dt", message);
		}
		else
		{
			// Fetch tivs too if its a valid user
			int currentPage = _currentPage ? _currentPage : 1;
			int tivsTotalCount = Tivs.countAllByUserID(_userID);
			import qv.enums: SettingsType;
			import qv.settings: settings;
			import qv.pagination: Pagination;

			int tivsPerPage = settings(SettingsType.tivsPerPageHome);
			auto pagination = Pagination(currentPage, tivsPerPage, tivsTotalCount);
			TivSchema[] tivs;
        
			//if (tivsTotalCount < 0) tivs = []; // is this line neccessary?? (fix in Tivs class)
			//else
			//{
				
			//}
			tivs = Tivs.findAllByUser(_userID, pagination.offset(), tivsPerPage);

			render!("user.dt", user, tivs, pagination);
		}
	}

	@auth 
	//@handleError 
	void getNotifications(int _userAuth, HTTPServerRequest req, HTTPServerResponse res)
	{
		render!("blog.dt");
	}

	//Authentication is handled withing routes (in, up, out) in switch statement
	void getSignin(HTTPServerRequest req, HTTPServerResponse res)
	{
		if (this.isSignedIn()) redirect("/");
		string actionType = "in";
		render!("in_or_out.dt", actionType);
	}

	void getSignup(HTTPServerRequest req, HTTPServerResponse res)
	{
		if (this.isSignedIn()) redirect("/");
		string actionType = "up";
		render!("in_or_out.dt", actionType);
	}

	void getSignout(HTTPServerRequest req, HTTPServerResponse res)
	{
		// Set session vars to init, clear cookies and (log action ??)
		import qv.schemas: UserSessionSchema;
		this.userSession = UserSessionSchema.init; 
		//terminate session
		res.terminateSession();

		// Destroy cookies. null value will clear
		res.setCookie("user_id", null, "/");
		res.setCookie("cookie_token", null, "/");

		//log action

		redirect("/signin");
	}

	@path("/terms_of_use")
	void getTermsOfUse(HTTPServerRequest req, HTTPServerResponse res)
	{
		res.writeBody("terms of use page");
		//render!("tiv_view.dt", tiv);
	}

	@path("/privacy_policy")
	void getPrivacyPolicy(HTTPServerRequest req, HTTPServerResponse res)
	{
		res.writeBody("privacy policy page");
	}

	void getBlog(HTTPServerRequest req, HTTPServerResponse res)
	{
		res.writeBody("Blogs page");
	}




	/******************************************************************
		Sign in, sign out, logging actions
	*******************************************************************/
	@path("/signin")
	@method(HTTPMethod.POST)
	//@authNotAllowed
	void postSignIn(HTTPServerRequest req, HTTPServerResponse res)
	{
		//Disallow authenticated uers from performing action
		//if (this.isSignedIn()) send not allouwed error code in headers

		import qv.secure: authenticateSignIn;

		immutable string email = req.form.get("email");
		immutable string password = req.form.get("password");
		immutable bool rememberSession = req.form.get("keep") == "1" ? true : false;
	
		auto result = authenticateSignIn(email, password);

		//set access denied headers
		if (result.isSuccess)
		{ 
			this.sessionSignIn(result.user.userIDFK, rememberSession);

			// NOTE: Abstract signin process in a separate function ??
			//set cookies (user_id and cookie_token).
			if (rememberSession) {
				import std.conv: to;
				import qv.secure: generateCookieToken, generateCookieSalt, changeCookieToken;

				int lifeSpan = (60 * 60 * 24 * 2);
				string cookieSalt = generateCookieSalt();
				string cookieToken = generateCookieToken(cookieSalt);

				// // generate and insert cookie and token date into DB
				// ?? changeCookieToken() doenst work
				if ( changeCookieToken(result.user.userID, cookieToken) )
				{
					auto userIDCookie = res.setCookie("user_id", to!string(result.user.userIDFK), "/");
					// generate cookie token and insert into DB
					auto sessionTokenCookie = res.setCookie("cookie_token", cookieToken, "/");

					// set exprire date for both cookies
					userIDCookie.maxAge =  lifeSpan;
					sessionTokenCookie.maxAge =  lifeSpan;

					userIDCookie.expires = toRFC822DateTimeString(Clock.currTime(UTC()) + lifeSpan.seconds);
					sessionTokenCookie.expires = toRFC822DateTimeString(Clock.currTime(UTC()) + lifeSpan.seconds);
					//cookie.expires = "Thu, 01 Jan 1970 00:00:00 GMT";
					// maxAge: ( 365 * 24 * 60 * 60 ) // 1 year
				}	
			}

			res.writeBody(result.message);
		} else {
			res.writeBody(result.message);
		}
	}


	@path("/signup")
	@method(HTTPMethod.POST)
	//@authNotAllowed
	void postSignUp(HTTPServerRequest req, HTTPServerResponse res)
	{
		//// Debug: to be removed
		//import std.stdio;
		//writeln(req.form);

		import qv.secure: isValidFormData;
		string[] errors = [];

		immutable string fullName = req.form.get("full_name");
		immutable string skill = req.form.get("skill");
		immutable string email = req.form.get("email");
		immutable string password = req.form.get("password");
		immutable string tempLatLng = req.form.get("lat_lng");
		immutable bool agree = req.form.get("agree") == "1" ? true : false;

		if (!isValidFormData("full_name", fullName))
		{
			errors ~= "Invalid full name";
		} 

		if (!isValidFormData("skill", skill))
		{
			errors ~= "Invalid skill name";
		} 

		if (!isValidFormData("email", email))
		{
			errors ~= "Invalid email address";
		} 

		if (!isValidFormData("password", password))
		{
			errors ~= "Insecure password";
		} 

		if (!agree)
		{
			errors ~= "You must agree to our terms to use create an accout";
		}


		if (errors.length) // error occured
		{ 
			import std.algorithm: each;
			string message = "<ol class='error'> <h3>Oops! Some few issues.</h3>";
			errors.each!(x => message ~= "<li>" ~ x ~ "</li>");
			message ~= "</ol>";
			res.writeBody(message);
		} 
		else 
		{
			import qv.users: Users;
			// Fetch skill ID and add to user 
			// Insert info into db
			Users user = new Users();
			user.fullName = fullName;
			user.email = email;
			user.skill = skill;
			user.password = password; // to be hashed in Users.add()
			user.latLng = tempLatLng;

			auto result = Users.add(user);
			if (result.isSuccess)
			{
				// Signin automatically?? : aftr abstracting signin into a separate function
				res.writeBody("Account created sucessfully!");
			}
			else
			{
				res.writeBody("An error occured whilst creating your accout!");
			}
		}
	}



	/*********************************************************************
		CRUD Operations
	**********************************************************************/

	@auth 
	//@handleError 
	void postAddTiv(int _userAuth, HTTPServerRequest req, HTTPServerResponse res)
	{
		res.writeBody("Hello, World!");
	}


	/*********************************************************************
		Validations and Authentication
	**********************************************************************/
	//@auth 
	//@handleError 
	@path("/validate_form_data")
	@method(HTTPMethod.POST)
	void validateFormData(HTTPServerRequest req, HTTPServerResponse res)
	{
		import qv.secure: isValidFormData;

		string inputName = req.form.get("input_name");
		string inputValue = req.form.get("input_value");

		if (isValidFormData(inputName, inputValue))
		{
			res.writeBody("valid");
		} else {
			res.writeBody("invalid");
		}
	}
}

