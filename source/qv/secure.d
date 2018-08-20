module qv.secure;


bool passwordVerify(string submitPassword, string hashPassword)
{
	//import botan.passhash.bcrypt;
	return submitPassword == hashPassword;
}

string passwordHash(string submitPassword)
{
	//import botan.passhash.passhash9;
	return submitPassword;
}

import qv.enums: FormDataType;
bool isit(string item, FormDataType type)
{
	bool isValid = false;
	switch(type)
	{
		case FormDataType.email:
			import std.regex;
			// static regex at compile-time, which contains fast native code.
			//auto regex = ctRegex!(`(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)`);
			//auto regex = regex(r`);
			if (item.matchFirst(`(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)`)) isValid = true;
			import std.stdio;
			//if (isValid) {
			//	writeln("valid email");
			//} else { writeln("invalid email"); }
			break;

		case FormDataType.fullName:
			import std.regex;
			//auto regex = regex();
			// BUG: does not invalidate single names
			if (item.matchFirst(`^\pL+[\pL\pZ\pP]{0,}`)) isValid = true;
			break;

		case FormDataType.password:
			import std.regex;
			//auto regex = regex();
			//must contain mix of upper and lowercase 
			// aphanumeric characters and symbols
			if ( 
				item.matchFirst(`([a-z]+)`) && // lowercase
				item.matchFirst(`([A-Z]+)`) && // uppercase
				item.matchFirst(`([0-9]+)`) && // numbers
				item.matchFirst(`([^a-zA-Z0-9]+)`) && // symbols
				item.length >= 8 // at least 8 characters
				) 
				isValid = true;
			break;

		default: break;
	}
	return isValid;
}

bool isValidFormData(string inputName, string inputValue)
{
	import qv.enums: FormDataType;
	bool isValid = false;

	switch(inputName)
	{
		case "full_name":
		    isValid = inputValue.isit(FormDataType.fullName);
		    break;

		case "skill":
		   	import qv.users: Users;
		   	if (Users.skillExists(inputValue)) isValid = true;
		    break;

		case "email":
			import qv.users: Users;
			if ( inputValue.isit(FormDataType.email) && !Users.emailExists(inputValue) ) isValid = true;
		    break;

		case "password":
		    isValid = inputValue.isit(FormDataType.password);
		    break;

		default:
			isValid = false; // Is this neccesary?
			break;
	}

	return isValid;
}

auto authenticateSignIn(string email="", string password="") 
{
	//varify if is email using regex 
	import qv.users;
	import qv.schemas: UserSchema;

	struct LoginResult
	{
		bool isSuccess;
		string message;
		UserSchema user;
	}

	UserSchema user;
	user = Users.findByEmailAddress(email);
	//import std.stdio: writeln;
	//writeln(user);

	if ( user == UserSchema.init || !passwordVerify(password, user.password) ) 
		return LoginResult(false, "Invalid email and password combination.");

	return LoginResult(true, "Signed in successfully", user);
}

string generateCookieToken(string tokenSalt)
{
	return "mmmmmmmmmmm";
}


string generateAccountVerificationToken()
{
	// configure to  generate unque token: maybe using md5 of currTime() + others
	return "xxxaccountxxx";
}

string generateCookieSalt()
{
	return "xxxx";
}

bool changeCookieToken(size_t userID, string cookieToken)
{
	import qv.database: Database;
 	import std.datetime: Clock, UTC;

 	// Logging
 	import qv.logs: log;
 	import qv.enums: LogType;

	auto db = new Database;
	auto connection = db.getConnection();

	auto time = Clock.currTime(UTC());

	bool isSuccess = true;

	try 
	{
		auto stmt = connection.prepare("UPDATE login SET cookie_verify_token = ?, 
		cookie_token_changed_on = ? WHERE user_id_fk = ? LIMIT 1");
		connection.execute(stmt, cookieToken, time, userID);

		//debug
		import std.stdio;
		writeln(connection.insertID);

		log("Updated session cookie token",LogType.database);
	} catch (Exception e)
	{	
		isSuccess = false;	
		log("Error updating session cookie token: changeCookieToken()", LogType.database);
	}

	return isSuccess;
}

//static struct AuthorizationInformation {
//	import qv.schemas: UserSessionSchema;

//	@noRoute  
//	AuthorizationInformation authenticate(scope HTTPServerRequest req, scope HTTPServerResponse res)
//	{

//	}

//	bool isSignedIn()
//	{

//	}
//}