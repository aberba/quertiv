import vibe.http.fileserver;
import vibe.http.router;
import vibe.http.server;
auto fileServerSettings = new HTTPFileServerSettings;
fileServerSettings.encodingFileExtension = ["gzip" : ".gz"];
router.get("/gzip/*", serveStaticFiles("./public/", fileServerSettings)); // use gzip
router.get("*", serveStaticFiles("./public/",)); // dont use gzip

//use TLS certificate
import vibe.stream.tls;
settings.tlsContext = createTLSContext(TLSContextKind.server);
settings.tlsContext.useCertificateChainFile("server.crt");
settings.tlsContext.usePrivateKeyFile("server.key");

// make HTTP server work with specific host name in settings
settings.hostName = "hostb";

// use JSON
import vibe.data.json;
import std.bigint;

Json a = 1;
Json[string] obj;
obj["item1"] = a; // a is JSON type

obj["item2"] = "Object";
Json parent = obj;
parent.remove("item1");
foreach (i; obj) writeln(i);

auto obj2 = parseJsonString(`{"serial":17559991181826658461}`);
writeln("serial: ", obj2["serial"]);
assert(obj2["serial"] == BigInt(17559991181826658461UL));


// using vibe.conf
//Json file. Real example:

{
	"mqttHost"       : "***.***.**.***",
	"mqttPort"       : 1883,
	"mqttClientName" : "*****",
	"mqttUsername"   : "*****",
	"mqttPassword"   : "*****",
	
	"listenInterface": "127.0.0.1",
	"listenPort"     : 8088,
	
	"dbConnection"   : "host=127.0.0.1;user=root;pwd=;db=dbname"
}

//You can read values from it like this:
// Read http setting from vibe.conf and init session store
HTTPServerSettings prepareHttpSettings()
{
	auto settings = new HTTPServerSettings;
	settings.port = readRequiredOption!ushort("listenPort","Port to listen by internal HTTP server");
	settings.bindAddresses = [readRequiredOption!string("listenInterface", "Interface to listen by internal HTTP server")];
	settings.sessionStore = new MemorySessionStore;
	
	return settings;
}