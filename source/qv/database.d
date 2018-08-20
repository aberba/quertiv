module qv.database;

import mysql;
alias DatabaseRow = MySQLRow;
/**
 * MySQLDatabase
 */
class Database
{
	MySQLClient client_;

	this()
	{
		openConnection();
	}

	void openConnection()
	{
		this.client_ = new MySQLClient("host=localhost;user=karabuta;pwd=12345678;db=quertiv");
	}

	auto getConnection() 
	{
		return this.client_.lockConnection();
	}
}

//struct DatabaseTransaction
//{
//	auto connection;

//	this()
//	{
//		auto db = new Database;
//		this.connection = db.getConnection();
//	}

//	void startTransaction()
//	{
//		connection.execute("BEGIN");
//	}

//    void transactionCommit(){
//        connection.execute("COMMIT");
//    }

//    void transactionRollback(){
//        connection.execute("ROLLBACK");
//    }
//}