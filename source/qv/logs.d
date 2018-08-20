module qv.logs;
import qv.enums: LogType;

void log(string message, LogType logType= LogType.noType)
{
	//write log into DB along with time
	// Notify admin if log is and error or security breach, downtime
	import std.stdio: writeln;
	writeln(message);
}