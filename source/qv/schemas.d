module qv.schemas;

import mysql;

struct TivSchema 
{
	// Tiv information
	@as("tiv_id") int tivID;
	@as("user_id") int userID;
	@as("user_id_fk") int userIDFK;
	@as("category_id_fk") int categoryID;
	@optional @as("category_name") string categoryName;
	string title;
	string description;
	@as("is_published") string isPublished;
	@as("is_blocked") string isBlocked;
	@as("added_on") int addedOn;
	@as("updated_on") int updatedOn;
	

	/// Optional media files
	@optional @as("media_file_1") string mediaFile1;
	@optional @as("media_file_2") string mediaFile2;
	@optional @as("media_file_3") string mediaFile3;
	@optional @as("media_file_4") string mediaFile4;
	@optional @as("media_file_5") string mediaFile5;

	/// Optional media caption
	@optional @as("media_file_1_caption") string mediaFile1Caption;
	@optional @as("media_file_2_caption") string mediaFile2Caption;
	@optional @as("media_file_3_caption") string mediaFile3Caption;
	@optional @as("media_file_4_caption") string mediaFile4Caption;
	@optional @as("media_file_5_caption") string mediaFile5Caption;
	
	/// optional user information
	@optional @as("full_name") string fullName;
	@optional @as("skill_id") int skillID;
	@optional @as("skill_name") string skillName;
	@optional string location;
	@optional string avatar;
	@optional string bio;
}

struct UserSessionSchema
{
	int userID = 0;
	bool signedIn = false;
}

/**
 User schema used for tivs, login and profile. All otional due to
 the diverse use cases.
*/
struct UserSchema
{
	// user info 
	@optional @as("user_id") int userID;
	@optional @as("skill_id") int skillID;
	@optional @as("skill_id_fk") int skillIDFK;
	@optional @as("skill_name") string skillName;
	@optional @as("full_name") string fullName;
	@optional @as("location") string location;
	@optional @as("location_cordinate") string locationCordinates;
	@optional @as("website_url") string websiteURL;
	@optional @as("country_id_fk") int countryID;
	@optional @as("country_name") int countryName;
	@optional @as("phone_number") string phoneNumber;
	@optional @as("gender") string gender;
	@optional string bio;

	/// Login info
	@optional @as("user_id_fk") int userIDFK;
	@optional string email;
	@optional string password;
	@optional @as("account_verify_token") string accountVerifyToken;
	@optional @as("password_verify_token") string passwordVerifyToken;
	@optional @as("cookie_verify_token") string cookieVerifyToken;
	@optional @as("cookie_token_changed_on") int cookieTokenChangedOn;
	@optional @as("logged_in_on") int loggedInOn;
	@optional @as("is_blocked") string isBlocked;
}


struct CategorySchema
{
	@as("category_id") int categoryID;
	@optional @as("category_name") string categoryName;
	@optional @as("category_description") string categoryDescription;
	@optional @as("category_banner") string categoryBanner;
}