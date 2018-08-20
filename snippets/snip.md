https://developers.google.com/maps/articles/phpsqlsearch_v3#findnearsql

Creating a Store Locator with PHP, MySQL & Google Maps

Google Geo APIs Team
August 2009

This tutorial is intended for developers who are familiar with PHP/MySQL, and want to learn how to use Google Maps with a MySQL database to create a store locator-type app. After completing this tutorial, you will have a database of locations and a webpage that lets a user enter their address and see markers on a map for the locations nearest to them, within a chosen distance restriction. Since the Google Maps JavaScript API is designed to work well on modern mobile browsers, this article will show how to create a website that displays nicely on them.

The tutorial is broken up into the following steps:

    Creating the Table
    Populating the Table
    Finding Locations with MySQL
    Outputting XML with PHP
    Creating the Map
    Where to Go From Here


Creating the Table

When you create the MySQL table, you want to pay particular attention to the lat and lng attributes. With the current zoom capabilities of Google Maps, you should only need 6 digits of precision after the decimal. To keep the storage space required for your table at a minimum, you can specify that the lat and lng attributes are floats of size (10,6). That will let the fields store 6 digits after the decimal, plus up to 4 digits before the decimal, e.g. -123.456789 degrees. Your table should also have an id attribute to serve as the primary key.

Note: This tutorial uses location data that already have latitude and longitude information needed to plot corresponding markers.

If you prefer interacting with your database through the phpMyAdmin interface, here's a screenshot of the table creation.

If you don't have access to phpMyAdmin or prefer using SQL commands instead, here's the SQL statement that creates the table. phpsqlajax_createtable.sql:

CREATE TABLE `markers` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `name` VARCHAR( 60 ) NOT NULL ,
  `address` VARCHAR( 80 ) NOT NULL ,
  `lat` FLOAT( 10, 6 ) NOT NULL ,
  `lng` FLOAT( 10, 6 ) NOT NULL
) ENGINE = MYISAM ;


Populating the Table

After creating the table, it's time to populate it with data. The sample data provided below is for about 180 pizzarias scattered across the United States. In phpMyAdmin, you can use the IMPORT tab to import various file formats, including CSV (comma-separated values). Microsoft Excel and Google Spreadsheets both export to CSV format, so you can easily transfer data from spreadsheets to MySQL tables through exporting/importing CSV files.

Here's a snippet of the sample data in CSV format. phpsqlsearch_data.csv:

Frankie Johnnie & Luigo Too,"939 W El Camino Real, Mountain View, CA",37.386339,-122.085823
Amici's East Coast Pizzeria,"790 Castro St, Mountain View, CA",37.38714,-122.083235
Kapp's Pizza Bar & Grill,"191 Castro St, Mountain View, CA",37.393885,-122.078916
Round Table Pizza: Mountain View,"570 N Shoreline Blvd, Mountain View, CA",37.402653,-122.079354
Tony & Alba's Pizza & Pasta,"619 Escuela Ave, Mountain View, CA",37.394011,-122.095528
Oregano's Wood-Fired Pizza,"4546 El Camino Real, Los Altos, CA",37.401724,-122.114646
...

Here's a screenshot of the import options used to transform this CSV into table data:

If you'd rather not use the phpMyAdmin interface, here's a snippet of the SQL statements that accomplish the same results. phpsqlsearch_data.sql:

INSERT INTO `markers` (`name`, `address`, `lat`, `lng`) VALUES ('Frankie Johnnie & Luigo Too','939 W El Camino Real, Mountain View, CA','37.386339','-122.085823');
INSERT INTO `markers` (`name`, `address`, `lat`, `lng`) VALUES ('Amici\'s East Coast Pizzeria','790 Castro St, Mountain View, CA','37.38714','-122.083235');
INSERT INTO `markers` (`name`, `address`, `lat`, `lng`) VALUES ('Kapp\'s Pizza Bar & Grill','191 Castro St, Mountain View, CA','37.393885','-122.078916');
INSERT INTO `markers` (`name`, `address`, `lat`, `lng`) VALUES ('Round Table Pizza: Mountain View','570 N Shoreline Blvd, Mountain View, CA','37.402653','-122.079354');
INSERT INTO `markers` (`name`, `address`, `lat`, `lng`) VALUES ('Tony & Alba\'s Pizza & Pasta','619 Escuela Ave, Mountain View, CA','37.394011','-122.095528');
INSERT INTO `markers` (`name`, `address`, `lat`, `lng`) VALUES ('Oregano\'s Wood-Fired Pizza','4546 El Camino Real, Los Altos, CA','37.401724','-122.114646');
...


Finding Locations with MySQL

To find locations in your markers table that are within a certain radius distance of a given latitude/longitude, you can use a SELECT statement based on the Haversine formula. The Haversine formula is used generally for computing great-circle distances between two pairs of coordinates on a sphere. An in-depth mathemetical explanation is given by Wikipedia and a good discussion of the formula as it relates to programming is on Movable Type's site.

Here's the SQL statement that will find the closest 20 locations that are within a radius of 25 miles to the 37, -122 coordinate. It calculates the distance based on the latitude/longitude of that row and the target latitude/longitude, and then asks for only rows where the distance value is less than 25, orders the whole query by distance, and limits it to 20 results. To search by kilometers instead of miles, replace 3959 with 6371.

SELECT id, ( 3959 * acos( cos( radians(37) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians(-122) ) + sin( radians(37) ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;

##  Other variants from statckoverflow
Link= http://gis.stackexchange.com/questions/31628/find-points-within-a-distance-using-mysql

Mapperz's answer is invalid. Sinus must be calculated from latitude and NOT from longitude. So corect SQL statement is:

SELECT
    id, (
      3959 * acos (
      cos ( radians(78.3232) )
      * cos( radians( lat ) )
      * cos( radians( lng ) - radians(65.3234) )
      + sin ( radians(78.3232) )
      * sin( radians( lat ) )
    )
) AS distance
FROM markers
HAVING distance < 30
ORDER BY distance
LIMIT 0 , 20;


Outputting XML with PHP

Now that you have the table and the SQL statement, you can put them together to output the search results into an XML format that your map can retrieve through asynchronous JavaScript calls. If the code provided here does not work with your PHP configuration, read through the Outputting XML with PHP section of our Using PHP/MySQL with Google Maps article. The only difference between the various PHP code samples shown there and the code needed for this article will be the SQL statement and the rows that are outputted in the XML.

First, you should put your database connection information in a separate file. This is generally a good idea whenever you're using PHP to access a database, as it keeps your confidential information in a file that you won't be tempted to share. In public forums, we've occasionally seen people accidentally publish their database connection information when they were just trying to debug their XML-outputting code. The file should look like this, but with your own database information filled in. phpsqlsearch_dbinfo.php:

<?
$username="username";
$password="password";
$database="username-databaseName";
?>

Using PHP's DOM Functions to Output XML

First, check your configuration and see if you're using PHP5. If so, continue to the explanation and code below. If you aren't, then you can use echo to output XML, as used in this sample code.

In PHP, first initialize a new XML document and create the "markers" parent node. Then connect to the database, execute the SELECT by distance query discussed above on the markers table, and iterate through the results.For each row in the table (each location), create a new XML node with the row attributes as XML attributes, and append it to the parent node. Then dump the XML to the screen.

Note: Since this PHP sends user input in a MySQL statement, this code uses the mysql_real_escape_string technique of avoiding SQL injection. A more elegant solution may be to use MySQL prepared statements, though implementation varies on the PHP version and DB wrapper used.

Note: If your database contains international characters or you otherwise need to force UTF-8 output, you can use utf8_encode on the outputted data.

The PHP file that does all that is shown below (phpsqlsearch_genxml.php):

<?php
require("phpsqlsearch_dbinfo.php");

// Get parameters from URL
$center_lat = $_GET["lat"];
$center_lng = $_GET["lng"];
$radius = $_GET["radius"];

// Start XML file, create parent node
$dom = new DOMDocument("1.0");
$node = $dom->createElement("markers");
$parnode = $dom->appendChild($node);

// Opens a connection to a mySQL server
$connection=mysql_connect (localhost, $username, $password);
if (!$connection) {
  die("Not connected : " . mysql_error());
}

// Set the active mySQL database
$db_selected = mysql_select_db($database, $connection);
if (!$db_selected) {
  die ("Can\'t use db : " . mysql_error());
}

// Search the rows in the markers table
$query = sprintf("SELECT address, name, lat, lng, ( 3959 * acos( cos( radians('%s') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('%s') ) + sin( radians('%s') ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < '%s' ORDER BY distance LIMIT 0 , 20",
  mysql_real_escape_string($center_lat),
  mysql_real_escape_string($center_lng),
  mysql_real_escape_string($center_lat),
  mysql_real_escape_string($radius));
$result = mysql_query($query);

$result = mysql_query($query);
if (!$result) {
  die("Invalid query: " . mysql_error());
}

header("Content-type: text/xml");

// Iterate through the rows, adding XML nodes for each
while ($row = @mysql_fetch_assoc($result)){
  $node = $dom->createElement("marker");
  $newnode = $parnode->appendChild($node);
  $newnode->setAttribute("name", $row['name']);
  $newnode->setAttribute("address", $row['address']);
  $newnode->setAttribute("lat", $row['lat']);
  $newnode->setAttribute("lng", $row['lng']);
  $newnode->setAttribute("distance", $row['distance']);
}

echo $dom->saveXML();
?>

Checking That the XML Output Works

Call this PHP script from the browser to make sure it's producing valid XML. If you suspect there's a problem with connecting to your database, you may find it easier to debug if you remove the line in the file that sets the header to the text/xml content type, as that usually causes your browser to try to parse XML and may make it difficult to see your debugging messages.

If the script is working correctly and you append reasonable sample query parameters to the URL (e.g. ?lat=37&lng=-122&radius=25), you should see XML output like this (phpsqlsearch_expectedoutput.xml):

<?xml version="1.0"?>
<markers><marker name="Round Table Pizza: Mountain View" address="570 N Shoreline Blvd, Mountain View, CA" lat="37.402653" lng="-122.079353" distance="0.38091455044131"/>
<marker name="Kapp's Pizza Bar & Grill" address="191 Castro St, Mountain
     View, CA" lat="37.393887" lng="-122.078918" distance="0.5596115438175"/>
<marker name="Amici's East Coast Pizzeria" address="790 Castro St, Mountain View, CA" lat="37.387138" lng="-122.083237" distance="1.0796074495809"/>
<marker name="Frankie Johnnie & Luigo Too" address="939 W El Camino Real, Mountain View, CA" lat="37.386337" lng="-122.085823" distance="1.2044231336188"/>
<marker name="Tony & Alba's Pizza & Pasta" address="619 Escuela Ave, Mountain View, CA" lat="37.394012" lng="-122.095528" distance="1.3156538737837"/><marker name="Round Table Pizza: Sunnyvale-Mary-Central Expy" address="415 N Mary Ave, Sunnyvale, CA" lat="37.390038" lng="-122.042030" distance="1.84565061776"/>
<marker name="Oregano's Wood-Fired Pizza" address="4546 El Camino Real, Los Altos, CA" lat="37.401726" lng="-122.114647" distance="2.2887425990519"/>
...
</markers>


Creating the Map

Once you are getting correct XML output in your browser, , it's time to create the map with JavaScript. If you have never created a v3 Google Map, please try some of the basic examples in the documentation to make sure you understand the basics of creating a map.
Setting Up the Page Layout

Since one of the objectives is to have this store locator display nicely in a mobile browser, you need to customize the HTML to suit mobile browsers better. First, instead of using a sidebar to display a list of all the search results, you can use a dropdown menu. A dropdown menu takes little space, and mobile browsers will display the options in a large, easy to read list once the dropdown is selected. Then, set the CSS width of your dropdown menu and map to be 100%. This will ensure that it always fills the mobile screen space.

 <div><select id="locationSelect" style="width:100%;visibility:hidden"></select></div>
 <div id="map" style="width: 100%; height: 80%"></div>

Searching Near a Geocode

The PHP script takes latitude and longitude parameters in order to perform the search. Since most people who use your map will know their address but not their coordinates, you can use the Geocoder class to turn their address into a coordinate. Create a button on the page and hook it up to the searchLocations function shown below which just passes in the address from the textbox to the asynchronous Geocoder.doGeocode function, gets a LatLng in response, and sends it off to the searchLocationsNear function if the geocode was successful.

function searchLocations() {
  var address = document.getElementById("addressInput").value;
  var geocoder = new google.maps.Geocoder();
  geocoder.geocode({address: address}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      searchLocationsNear(results[0].geometry.location);
    } else {
      alert(address + ' not found');
    }
  });
}

Loading the XML Results

After you know the latitude and longitude of the user entered location, you need to pass that to the PHP script and process the XML that is outputted. To load the XML file into the page, you can take advantage of the browser-provided XMLHttpRequest object. This object lets you retrieve a file that resides on the same domain as the requesting webpage, and is the basis of "AJAX" programming.

So, you can define your own function for loading the file, and call it downloadUrl(). The function takes two parameters:

    url specifies the path to the PHP script. It's usually easiest to have this reside in the same directory as the HTML so that you can just refer to it by filename.
    callback indicates the function that's called when the XML is returned to the JavaScript. 

The function declaration is shown below:

function downloadUrl(url,callback) {
 var request = window.ActiveXObject ?
     new ActiveXObject('Microsoft.XMLHTTP') :
     new XMLHttpRequest;

 request.onreadystatechange = function() {
   if (request.readyState == 4) {
     request.onreadystatechange = doNothing;
     callback(request.responseText, request.status);
   }
 };

 request.open('GET', url, true);
 request.send(null);
}

Note: Since XMLHttpRequest is asynchronous, the callback function won't be called as soon as you invoke downloadUrl. The bigger your XML file, the longer it may take. Don't put any code after downloadUrl that relies on the markers existing already—put it inside the callback function instead.

Now that the function is defined, you can call it from your code, passing in the name of the PHP file and a callback function. In the callback function, you need to find all the "marker" elements in the XML, and iterate through them. For each marker element you find, retrieve the name, address, distance, and lat/lng attributes and pass them to createMarker() to create the marker, and to createOption() to create an option in the results dropdown. You can also figure out the optimal viewport for the returned results by using LatLngBounds.extend and Map.fitBounds.


function searchLocationsNear(center) {
  clearLocations();

  var radius = document.getElementById('radiusSelect').value;
  var searchUrl = 'phpsqlajax_search.php?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
  downloadUrl(searchUrl, function(data) {
  var xml = parseXml(data);
  var markerNodes = xml.documentElement.getElementsByTagName("marker");
  var bounds = new google.maps.LatLngBounds();
  for (var i = 0; i < markerNodes.length; i++) {
    var name = markerNodes[i].getAttribute("name");
    var address = markerNodes[i].getAttribute("address");
    var distance = parseFloat(markerNodes[i].getAttribute("distance"));
    var latlng = new google.maps.LatLng(
        parseFloat(markerNodes[i].getAttribute("lat")),
        parseFloat(markerNodes[i].getAttribute("lng")));

    createOption(name, distance, i);
    createMarker(latlng, name, address);
    bounds.extend(latlng);
  }
  map.fitBounds(bounds);
 });
}

Creating Markers & the Sidebar

In the createMarker() function shown below, you just create a marker at the given LatLng, and add an event listener to the marker so that when clicked, an info window is displayed showing the name and address. Note that since API v3 permits multiple infowindows to be displayed on the map at once, you can re-use the same infowindow variable throughout the code to ensure that only one infowindow ever displays.

function createMarker(latlng, name, address) {
  var html = "<b>" + name + "</b> <br/>" + address;
  var marker = new google.maps.Marker({
    map: map,
    position: latlng
  });
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.setContent(html);
    infoWindow.open(map, marker);
  });
  markers.push(marker);
}

In the createOption() function shown below, you create an option element that displays the name and distance in parantheses. The value of the option is the index of the marker in the global markers array. You can use this value to open the infowindow over the marker when the option is selected.

function createOption(name, distance, num) {
  var option = document.createElement("option");
  option.value = num;
  option.innerHTML = name + "(" + distance.toFixed(1) + ")";
  locationSelect.appendChild(option);
}

Clearing Previous Results

Between searches, you need to remove the previously displayed infowindow, markers and dropdown options. The clearLocations() function removes the markers by setting their map property to null, and then clears the options.


function clearLocations() {
  infoWindow.close();
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
  markers.length = 0;

  locationSelect.innerHTML = "";
  var option = document.createElement("option");
  option.value = "none";
  option.innerHTML = "See all results:";
  locationSelect.appendChild(option);
  locationSelect.style.visibility = "visible";
}

Putting It All Together

Here's a screenshot and code for the webpage that ties everything together (phpsqlsearch_map.html). When the page loads, the load function is called. This function sets up the map and the results dropdown.


<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <title>Google Maps AJAX + mySQL/PHP Example</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"
            type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
    var map;
    var markers = [];
    var infoWindow;
    var locationSelect;

    function load() {
      map = new google.maps.Map(document.getElementById("map"), {
        center: new google.maps.LatLng(40, -100),
        zoom: 4,
        mapTypeId: 'roadmap',
        mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU}
      });
      infoWindow = new google.maps.InfoWindow();

      locationSelect = document.getElementById("locationSelect");
      locationSelect.onchange = function() {
        var markerNum = locationSelect.options[locationSelect.selectedIndex].value;
        if (markerNum != "none"){
          google.maps.event.trigger(markers[markerNum], 'click');
        }
      };
   }

   function searchLocations() {
     var address = document.getElementById("addressInput").value;
     var geocoder = new google.maps.Geocoder();
     geocoder.geocode({address: address}, function(results, status) {
       if (status == google.maps.GeocoderStatus.OK) {
        searchLocationsNear(results[0].geometry.location);
       } else {
         alert(address + ' not found');
       }
     });
   }

   function clearLocations() {
     infoWindow.close();
     for (var i = 0; i < markers.length; i++) {
       markers[i].setMap(null);
     }
     markers.length = 0;

     locationSelect.innerHTML = "";
     var option = document.createElement("option");
     option.value = "none";
     option.innerHTML = "See all results:";
     locationSelect.appendChild(option);
   }

   function searchLocationsNear(center) {
     clearLocations();

     var radius = document.getElementById('radiusSelect').value;
     var searchUrl = 'phpsqlsearch_genxml.php?lat=' + center.lat() + '&lng=' + center.lng() + '&radius=' + radius;
     downloadUrl(searchUrl, function(data) {
       var xml = parseXml(data);
       var markerNodes = xml.documentElement.getElementsByTagName("marker");
       var bounds = new google.maps.LatLngBounds();
       for (var i = 0; i < markerNodes.length; i++) {
         var name = markerNodes[i].getAttribute("name");
         var address = markerNodes[i].getAttribute("address");
         var distance = parseFloat(markerNodes[i].getAttribute("distance"));
         var latlng = new google.maps.LatLng(
              parseFloat(markerNodes[i].getAttribute("lat")),
              parseFloat(markerNodes[i].getAttribute("lng")));

         createOption(name, distance, i);
         createMarker(latlng, name, address);
         bounds.extend(latlng);
       }
       map.fitBounds(bounds);
       locationSelect.style.visibility = "visible";
       locationSelect.onchange = function() {
         var markerNum = locationSelect.options[locationSelect.selectedIndex].value;
         google.maps.event.trigger(markers[markerNum], 'click');
       };
      });
    }

    function createMarker(latlng, name, address) {
      var html = "<b>" + name + "</b> <br/>" + address;
      var marker = new google.maps.Marker({
        map: map,
        position: latlng
      });
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
      markers.push(marker);
    }

    function createOption(name, distance, num) {
      var option = document.createElement("option");
      option.value = num;
      option.innerHTML = name + "(" + distance.toFixed(1) + ")";
      locationSelect.appendChild(option);
    }

    function downloadUrl(url, callback) {
      var request = window.ActiveXObject ?
          new ActiveXObject('Microsoft.XMLHTTP') :
          new XMLHttpRequest;

      request.onreadystatechange = function() {
        if (request.readyState == 4) {
          request.onreadystatechange = doNothing;
          callback(request.responseText, request.status);
        }
      };

      request.open('GET', url, true);
      request.send(null);
    }

    function parseXml(str) {
      if (window.ActiveXObject) {
        var doc = new ActiveXObject('Microsoft.XMLDOM');
        doc.loadXML(str);
        return doc;
      } else if (window.DOMParser) {
        return (new DOMParser).parseFromString(str, 'text/xml');
      }
    }

    function doNothing() {}

    //]]>
  </script>
  </head>

  <body style="margin:0px; padding:0px;" onload="load()">
    <div>
     <input type="text" id="addressInput" size="10"/>
    <select id="radiusSelect">
      <option value="25" selected>25mi</option>
      <option value="100">100mi</option>
      <option value="200">200mi</option>
    </select>

    <input type="button" onclick="searchLocations()" value="Search"/>
    </div>
    <div><select id="locationSelect" style="width:100%;visibility:hidden"></select></div>
    <div id="map" style="width: 100%; height: 80%"></div>
  </body>
</html>

Where to Go From Here

Now that you have a store locator for your website, consider extending it with more features. Some ideas:

    User Location: The Android phone provides a Gears Geolocation module for determining the approximate location of a user, and the iPhone supports the W3C geolocation property. You can use this information to do a default search for the user when they first arrive at your page, and minimize the amount of typing they need to do. See this example.
    Advanced search: Let users restrict searches by category or some attribute. Check out the Ace Hardware store locator for a great example of this.
    Fancy infowindows: You can make your info windows more helpful by adding quick links for the user to zoom in to that location or get driving directions to/from that location.

