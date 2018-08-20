//file http
setContentType("application/pdf");  // Your content type 
//application/octet-stream

setHeader("Content-Disposition", "attachment; filename=somefile.pdf"); 
// filesize is needed for download progress??
header('Content-Length: '.filesize($fn));
//diable cahe if needed
header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); // Date in the past
// All
header("Content-Disposition: attachment; filename=" . urlencode($file));   
header("Content-Type: application/force-download");
header("Content-Type: application/octet-stream");
header("Content-Type: application/download");
header("Content-Description: File Transfer");            
header("Content-Length: " . filesize($file));

//Another
if(strstr($_SERVER["HTTP_USER_AGENT"],"MSIE")==false) {
  header("Content-type: text/javascript");
  header("Content-Disposition: inline; filename=\"download.js\"");
  header("Content-Length: ".filesize("my-file.js"));
} else {
  header("Content-type: application/force-download");
  header("Content-Disposition: attachment; filename=\"download.js\"");
  header("Content-Length: ".filesize("my-file.js"));
}
header("Expires: Fri, 01 Jan 2010 05:00:00 GMT");
if(strstr($_SERVER["HTTP_USER_AGENT"],"MSIE")==false) {
  header("Cache-Control: no-cache");
  header("Pragma: no-cache");
}

/// Another with bakward compatibility

// HTTP Headers for ZIP File Downloads
// https://perishablepress.com/press/2010/11/17/http-headers-file-downloads/

// set example variables
$filename = "Inferno.zip";
$filepath = "/var/www/domain/httpdocs/download/path/";
// http headers for zip downloads
header("Pragma: public");
header("Expires: 0");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
header("Cache-Control: public");
header("Content-Description: File Transfer");
header("Content-type: application/octet-stream");
header("Content-Disposition: attachment; filename=\"".$filename."\"");
header("Content-Transfer-Encoding: binary");
header("Content-Length: ".filesize($filepath.$filename));

//
void main()
{
    import std.stdio : writeln;
    import std.range : refRange, roundRobin;

    auto array1 = [1, 2, 3, 4, 5];
    auto array2 = [11, 12, 13, 14, 15];

    auto array1Ref = refRange(&array1);

    roundRobin(array1Ref, array1Ref, array2)
        .writeln();
}

elements: [ 1,  2,  11,  3,   4,  12,   5,  13,  14,  15  ]
indexes:   a11 a12 a21  a13  a14  a22  a15  a23  a24  a25void main()
{
    import std.stdio : writeln;
    import std.range : refRange, roundRobin;

    auto array1 = [1, 2, 3, 4, 5];
    auto array2 = [11, 12, 13, 14, 15];

    auto array1Ref = refRange(&array1);

    roundRobin(array1Ref, array1Ref, array2)
        .writeln();
}

elements: [ 1,  2,  11,  3,   4,  12,   5,  13,  14,  15  ]
indexes:   a11 a12 a21  a13  a14  a22  a15  a23  a24  a25