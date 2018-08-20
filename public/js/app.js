var App = {};

/***************************************************************************************
	        ALERTS & LOGS
***************************************************************************************/
App.log = function(msg) {
	console.log(msg);
};

App.alert = function(e) {
	var btn = $("<button />", {"text": " OK ", "class":"btn"}).bind("click", function(e) {
       e.preventDefault();
       App.removeAlert();
	});

	var a = $("<div />", {"id":"alert"}).append( $("<p />", {"text":e}) ).append(btn);
	$("body").append(a);
	a.hide().fadeIn("slow");
};

App.removeAlert = function() {
	$("#alert").fadeOut("slow").replaceWith(" ");
};


/***************************************************************************************
        LIGHTBOX
***************************************************************************************/
App.removeLightbox = function(callback) {
	$("#lightbox").fadeOut("slow").replaceWith(" ");
	if (callback != null) callback();
};

App.showLightbox = function(callback) {
	App.removeLightbox();

    var close     = $("<p />", {"class":"close", "text":"x"}).bind("click", function(e) {
    	e.preventDefault();
    	App.removeLightbox();
    });

    var container = $("<div />", {"class":"lightbox-container clearfix"}).append(close);
	var lightbox  = $("<div />", {"id":"lightbox", "class": "lightbox"}).append(container);
	$("body").append(lightbox);
	lightbox.hide().fadeIn("slow");

	if (callback != null) callback(container);
};

App.loadLightboxTemplate = function(template, callback) {
    $(".lightbox-container").load("templates/" + template, function(response, status, xhr) {
	    if (status == "error") App.log(msg + xhr.status + " " + xhr.statusText);
	    if (callback != null) callback();
	}).show();
};




/***********************************************************************************************************************
        PAGE TEMPLATES MANIPULATION
***********************************************************************************************************************/
App.loadPageTemplate = function(template, callback) {
	$(".slider-section").hide();
	$(".thumbs-section").hide();

    $(".templates-section").load("templates/" + template, function(response, status, xhr) {
	    //if (status == "error") App.log(xhr.status + " " + xhr.statusText);
	    if (callback != null) callback();
	    //App.log("Done");
	}).show();
};

App.hideHomepage = function(callback) {
	$(".slider-section").hide();
	$(".thumbs-section").hide();
    $(".templates-section").show();

    if (callback != null) callback(data);
};

App.showHomepage = function(callback) {
	$(".slider-section").show();
	$(".thumbs-section").show();
    $(".templates-section").hide().html("");

    if (callback != null) callback(data);
};



/***********************************************************************************************************************
        TOUR PACKAGES
***********************************************************************************************************************/
App.queryPackages = function(callback) {
	$.get("ajax/ajax.query.php", "packages=yes", function(e) {
		if (e == 0) {
			App.alert("Sorry, no package has been added in our system");
			return false;
		}

		var data = JSON.parse(e);
		if (callback != null) callback(data);
	});
};

App.showSelectedPackage = function(data) {

	App.showLightbox(function(container) {
		var pack = $("<div />", {"class":"package-container"}).append( $("<h1 />", {"text":data.package_name}) );
        var fig = $("<figure />", {"class":"package-photo"}).append( $("<img />", {"src":"uploads/photos/" + data.photo_filename, "alt":data.package_name}) );
        var content = $("<div />", {"class":"content", "html":data.description});
        var packageForm = $("<div />", {"class":"package-form"});//.data("package_id", data.package_id)

        var gotoLink   = $("<a />", {"href":"#", "html":"Skip to Signup Section <br /><br />"}).bind("click", function(e) {
        	e.preventDefault();
        	container.scrollTop( -container.height() );
        });

        //Generate sign up form
        packageForm.append( $("<h3 />", {"text":"Sign Up for this Tour Package"}) );
        packageForm.append( $("<p />", {"text":"The information you provide will be kept strictly confidential"}) );

        packageForm.append( $("<label />", {"for":"fname", "text":"First Name"}) );
        packageForm.append( $("<input />", {"type":"text", "name":"fname", "placeholder":"First Name (Required)"}) );

        packageForm.append( $("<label />", {"for":"lname", "text":"Last Name"}) );
        packageForm.append( $("<input />", {"type":"text", "name":"lname", "placeholder":"Last Name (Required)"}) );

        packageForm.append( $("<label />", {"for":"oname", "text":"Other Name"}) );
        packageForm.append( $("<input />", {"type":"text", "name":"oname", "placeholder":"Other Name (Required)"}) );

        packageForm.append( $("<label />", {"for":"email", "text":"Email Address"}) );
        packageForm.append( $("<input />", {"type":"email", "name":"email", "placeholder":" e.g. johndoe@mail.com"}) );

        packageForm.append( $("<label />", {"for":"phone_number", "text":"Phone Number"}) );
        packageForm.append( $("<input />", {"type":"text", "name":"phone_number", "placeholder":"Phone Number (Required)"}) );

        packageForm.append( $("<label />", {"for":"telephone_number", "text":"Telephone Number"}) );
        packageForm.append( $("<input />", {"type":"text", "name":"telephone_number", "placeholder":"Telephone Number (Optional)"}) );

        packageForm.append( $("<label />", {"for":"address1", "text":"Your Address"}) );
        packageForm.append( $("<textarea />", {"name":"address1", "placeholder":"Your address (Required)"}) );

        packageForm.append( $("<label />", {"for":"address2", "text":"First Name"}) );
        packageForm.append( $("<textarea />", {"name":"address2", "placeholder":"Alternative address (Optional)"}) );

        packageForm.append( $("<label />", {"for":"fname", "text":"Any comment?"}) );
        packageForm.append( $("<textarea />", {"name":"comment", "placeholder":"Anything you want us to know? (Optional)"}) );


        var attractions = $("<div />", {"class":"attractions"}).append( $("<label />", {"for":"attractions[]", "text":"Select the attractions you want in this package"}) );
        attractions.append( $("<button />", {"type":"button", "class":"btn", "text":"Select All Attractions"}) );

        //Pack attractions into sign up form
        for (var i in data.attractions) {

        	var attraction = $("<div />", {"id":data.attractions[i].attraction_name, "class":"attraction"})
        	var aname = $("<h4 />", {"text":data.attractions[i].attraction_name});
        	var afig  = $("<figure />").append( $("<img />", {"src":"uploads/photos/" + data.attractions[i].photo_filename, "alt": data.attractions[i].attraction_name + ""}) );
        	afig.append( $("<figcaption />", {"text":data.attractions[i].caption}) );
        	var checkbox = $("<checkbox />", {"name":"attractions[]", "value":data.attractions[i].attraction_id});

        	attraction.append(aname).append(afig).append(checkbox);
        	attractions.append(attraction);
        }
        packageForm.append(attractions);

        packageForm.append( $("<input />", {"type":"hidden", "name":"package_id", "value":data.package_id}));
        packageForm.append( $("<button />", {"type":"button", "class":"signup-btn btn", "text":"Sign Up for Package"}));

        pack.append(fig).append(content).append(packageForm);;
        container.append(gotoLink).append(pack);
        content.children("a").attr("target", "_blank");
	});
};



/***********************************************************************************************************************
        ATTRACTIONS
***********************************************************************************************************************/
App.queryAttractions = function(callback) {}




/***********************************************************************************************************************
        GALLERY
***********************************************************************************************************************/
App.queryGallery = function(callback) {
	$.get("ajax/ajax.query.php", "gallery=yes", function(e) {
		if (e == 0) {
			App.alert("Oops!, an error ocured whilst fetching data");
			return false;
		}

		var data = JSON.parse(e);
		if (callback != null) callback(data);
	});
};

App.showSelectedGalleryItem = function(itemType, data) {

};



/***********************************************************************************************************************
        TOUR UPDATES
***********************************************************************************************************************/
App.queryTourUpdates = function(callback) {
	App.loadPageTemplate(filename, callback);
};





 /***********************************************************************************************************************
        NEWS LETTERS
***********************************************************************************************************************/
App.signUpNewsLetters = function(email) {

};

App.signOutNewsLetters = function(email) {

};
