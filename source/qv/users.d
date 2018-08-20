module qv.users;

import qv.database;
import qv.schemas: UserSchema;

//Struct for tiv row
//this.insertID = connection.insertID;

class Users
{
	//private
	//{
	//	ulong insertID;
	//}

	public 
	{
		string fullName;
		string email;
		//int skillID;
		string skill; // to be changed later to only allow pre-populated skills using skillID
		string password;
		//string location;
		string latLng; // should be changed to a location struct, insert as Point in MySQL
	}

	static UserSchema[] findAll()
	{
		auto db = new Database;
		auto connection = db.getConnection();
		//scoped close connection ??
		UserSchema[] users;
		enum sql = `SELECT * FROM tivs
		LEFT JOIN users ON users.user_id = tivs.tiv_id 
		LEFT JOIN skills ON skills.skill_id = users.skill_id_fk`;

		connection.execute(sql, (DatabaseRow row) {
			users ~= row.toStruct!UserSchema;
		});

		return users;
	}

	static UserSchema findByEmailAddress(string emailAddress="")
	{
		auto db = new Database;
		auto connection = db.getConnection();
		
		UserSchema user;
		connection.execute("SELECT * FROM login WHERE email = ? LIMIT 1", emailAddress, (DatabaseRow row) {
			user = row.toStruct!UserSchema;
		});

		return user;
	}

	static UserSchema findByID(int userID=0)
	{
		auto db = new Database;
		auto connection = db.getConnection();
		
		UserSchema user;
		// FIX: filter out blocked users
		enum sql = `SELECT * FROM users 
		LEFT JOIN login ON users.user_id = login.user_id_fk 
		LEFT JOIN skills ON users.skill_id_fk = skills.skill_id 
		WHERE users.user_id = ? LIMIT 1`;
		connection.execute(sql, userID, (DatabaseRow row) {
			user = row.toStruct!UserSchema;
		});

		return user;
	}

	static bool emailExists(string emailAddress)
	{
		//import qv.schemas: UserSchema;
	    return (Users.findByEmailAddress(emailAddress) == UserSchema.init) ? false : true;
	}


	// Both query by skillID and skillName
	static bool skillExists(int skillID)
	{
		import qv.database: Database;
		//import qv.schemas: UserSchema;

		auto db = new Database;
		auto connection = db.getConnection();

		UserSchema user;
		immutable emailSQL = "SELECT skill_id FROM skills WHERE skill_id = ? LIMIT 1";
		connection.execute(emailSQL, skillID, (DatabaseRow row) {
			user = row.toStruct!UserSchema;
		});
		return (user == UserSchema.init) ? false : true;
	}

	static bool skillExists(string skillName)
	{
		import qv.database: Database;
		//import qv.schemas: UserSchema;

		auto db = new Database;
		auto connection = db.getConnection();

		UserSchema user;
		immutable emailSQL = "SELECT skill_id FROM skills WHERE skill_name = ? LIMIT 1";
		connection.execute(emailSQL, skillName, (DatabaseRow row) {
			user = row.toStruct!UserSchema;
		});
		return (user == UserSchema.init) ? false : true;
	}

	/* 
		Insert into users table, login table, & insert confirmation token
		Log user in after sign up ??
	*/
	static auto add(Users user)
	{
		import qv.database: Database;
		auto db = new Database;
		auto connection = db.getConnection();
		//scoped close connection ??

		// Logging
		import qv.logs: log;

		bool isSuccess = true;
		ulong insertID;

		// Perform database transaction: plan later
		//import qv.database: DatabaseTransaction;
		// transaction = DatabaseTransaction(); //struct

		//connection.execute("BEGIN"); // begin transaction
		//log("Transaction begun");
		try
		{
			enum sqlUser = `INSERT INTO users (skill_id_fk, country_id_fk, full_name) 
			VALUES (?, ?, ?)`;
			connection.execute(sqlUser, 1, 1, user.fullName);
			log("user inserted");
			insertID = connection.insertID; 
		}
		catch(Exception e)
		{
			log("user insert failed");
			isSuccess = false;
		}

		if (isSuccess) // proceeed to second query
		{
			import qv.secure: passwordHash, generateAccountVerificationToken;

			try
			{
				// Hash password
				string hashedPassword = passwordHash(user.password);
				//generate account email confirmation token
				string accountToken = generateAccountVerificationToken();
				enum sqlLogin = `INSERT INTO login (user_id_fk, email, password, account_verify_token) 
				VALUES (?, ?, ?, ?)`;
				connection.execute(sqlLogin, insertID, user.email, hashedPassword, accountToken);
				log("login data inserted");
			}
			catch(Exception e)
			{
				isSuccess = false;
				//connection.execute("ROLLBACK"); // rollback transaction both queries
				//log("login data insert failed");
			}

			if (isSuccess) // after both queries execute sucessfully
			{
				//connection.execute("COMMIT"); // begin transaction
				//log("commiting data due to sucess");
			}
		}

		log("add() finished execution");

		struct AddUserResult
		{
			bool isSuccess;
			ulong insertID;
		}

		return AddUserResult(isSuccess, insertID);
	}
} 