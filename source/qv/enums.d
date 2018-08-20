module qv.enums;

//enum ActionType {signIn, signUp, signOut};

enum AssetsURL: string {css="css", js="js", img="img", media="media"};

enum TimeValue: size_t {
	minute = (1000 * 60 * 60),
	hour= (1000 * 60 * 60)
}

enum FormDataType {email, fullName, password, skill};

enum LogType
{
	database,
	runtime,
	action,
	security,
	downtime,
	noType
};

enum SettingsType: string
{
	tivsPerPageProfile = "per_page_in_profile",
	tivsPerPageHome = "per_page_in_home",
	enforceEmailConfirmation = "enforce_email_confirmation"
};