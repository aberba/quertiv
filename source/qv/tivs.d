module qv.tivs;

import qv.database;
import qv.schemas;

//Struct for tiv row

class Tivs
{
	ulong insertID;

	static int countAll(int userID) // userID will be used later for customising feeds
	{
		auto db = new Database;
		auto connection = db.getConnection();

		struct TivCount { int total; }
		TivCount count;
		// FIX: filter out unpublihed Tivs
		enum sql = `SELECT COUNT(tiv_id) as total FROM tivs`;
		connection.execute(sql, (DatabaseRow row) {
			count = row.toStruct!TivCount;
		});
		return count.total;
	}

	static TivSchema[] findAll(int userID, int offset=0, int perPage=8, int categoryID=0)
	{
		auto db = new Database;
		auto connection = db.getConnection();
		//scoped close connection ??
		TivSchema[] tivs;
		// FIX: remember to add order by, prioritization, and filter unpublished, 
		// tiv with unpublished categories and blocked tivs
		// OR create several functions with varying search configuration
		// FIX: factor in filtering query by categoryID
		// FIX: factor user feeds using userID
		enum sql = `SELECT * FROM tivs 
		LEFT JOIN categories ON categories.category_id = tivs.category_id_fk 
		LEFT JOIN media ON media.tiv_id_fk = tivs.tiv_id 
		LEFT JOIN users ON users.user_id = tivs.user_id_fk 
		LEFT JOIN countries ON countries.country_id = users.country_id_fk 
		LEFT JOIN skills ON skills.skill_id = users.skill_id_fk 
		ORDER BY tivs.added_on DESC 
		LIMIT ? OFFSET ?`;

		connection.execute(sql, perPage, offset, (DatabaseRow row) {
			tivs ~= row.toStruct!TivSchema;
		});

		return tivs;
	}

	static TivSchema[] findAllByUser(int userID, int offset=0, int perPage=8)
	{
		auto db = new Database;
		auto connection = db.getConnection();
		TivSchema[] tivs;

		// FIX: firlter to show all tives when user is owner
		// AND show only published tivs
		enum sql = `SELECT * FROM tivs 
		LEFT JOIN categories ON categories.category_id = tivs.category_id_fk 
		LEFT JOIN media ON media.tiv_id_fk = tivs.tiv_id 
		LEFT JOIN users ON users.user_id = tivs.user_id_fk 
		LEFT JOIN countries ON users.country_id_fk = countries.country_id 
		LEFT JOIN skills ON skills.skill_id = users.skill_id_fk 
		WHERE tivs.user_id_fk = ? ORDER BY tivs.added_on DESC 
		LIMIT ? OFFSET ?`;

		connection.execute(sql, userID, perPage, offset, (DatabaseRow row) {
			tivs ~= row.toStruct!TivSchema;
		});

		return tivs;
	}

	static TivSchema findByID(int tivID)
	{
		auto db = new Database;
		auto connection = db.getConnection();
		//scoped close connection ??
		TivSchema tiv;
		enum sql = `SELECT * FROM tivs 
		LEFT JOIN categories ON categories.category_id = tivs.category_id_fk 
		LEFT JOIN media ON media.tiv_id_fk = tivs.tiv_id 
		LEFT JOIN users ON users.user_id = tivs.user_id_fk 
		LEFT JOIN countries ON users.country_id_fk = countries.country_id 
		LEFT JOIN skills ON skills.skill_id = users.skill_id_fk 
		WHERE tivs.tiv_id = ? LIMIT 1`;

		connection.execute(sql, tivID, (DatabaseRow row) {
			tiv = row.toStruct!TivSchema;
		});

		return tiv;
	}

	static int countAllByUserID(int userID)
	{
		auto db = new Database;
		auto connection = db.getConnection();

		struct TivCount { int total; }
		TivCount count;
		// FIX: filter out unpublihed Tivs
		enum sql = `SELECT COUNT(tiv_id) as total FROM tivs WHERE tivs.user_id_fk = ?`;
		connection.execute(sql, userID, (DatabaseRow row) {
			count = row.toStruct!TivCount;
		});
		return count.total;
	}


	static CategorySchema[] findAllCategories()
	{
		auto db = new Database;
		auto connection = db.getConnection();

		CategorySchema[] categories;
		enum sql = `SELECT * FROM categories  
		ORDER BY category_name ASC`;

		connection.execute(sql, (DatabaseRow row) {
			categories ~= row.toStruct!CategorySchema;
		});

		return categories;
	}
} 

