module qv.settings;

import qv.enums: SettingsType;

int[string] appSettings;

static this()
{
	//Fetch Values from DB and catche
	appSettings[SettingsType.tivsPerPageProfile] = 1;
	appSettings[SettingsType.tivsPerPageHome] = 3;
}

auto settings(SettingsType type)
{
	return appSettings[type];
}