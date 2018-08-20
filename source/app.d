import vibe.d;
import qv.web: QvApp;

shared static this()
{
	// Handle segmentation faultsdl
	import etc.linux.memoryerror;
	static if (is(typeof(registerMemoryErrorHandle()))) {
		registerMemoryErrorHandle();
	}

	import std.process: environment;
	import std.conv: to;

	auto router = new URLRouter;
	router.registerWebInterface(new QvApp);

	// Static files routing
	auto fileServerSettings = new HTTPFileServerSettings;
	fileServerSettings.options = HTTPFileServerOption.failIfNotFound;
	//fileServerSettings.maxAge = (60 * 60) * 24 * 1; // cache for 1 day
	//fileServerSettings.serverPathPrefix = "assets";

	//serve all other assets from public dir |
	// All requests that haven't been handled by the web interface registered above
	// will be handled by looking for a matching file in the public/ folder.
	router.get("*", serveStaticFiles("./public/", fileServerSettings));

	auto settings = new HTTPServerSettings;
	settings.sessionStore = new MemorySessionStore;
	settings.port = environment.get("PORT", "8080").to!ushort;
	settings.bindAddresses = ["::1", "127.0.0.1"];
	//settings.bindAddresses = ["0.0.0.0"]; // bind to to external IP only
	listenHTTP(settings, router);

	logInfo("Server running");
}
