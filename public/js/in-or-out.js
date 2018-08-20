$(document).on("DOMContentLoaded", function() 
{
	/**************************************************************************
		Form toggle actions
	**************************************************************************/
	$(".toggle-menu .sign-in").on("click", function(e) {
		e.preventDefault();
		SignAction.toggleSignActionMenu(0);
	});

	$(".toggle-menu .sign-up").on("click", function(e) {
		e.preventDefault();
		SignAction.toggleSignActionMenu(1);
	});

	/**************************************************************************
		Sign Up actions
	**************************************************************************/
	$(".sign-up-form input").on("blur", function(e)
	{
		e.preventDefault();
		var inputName = $(this).attr("name");
		var inputValue = $(this).val().trim();
		// 
		var data = "input_name=" + encodeURIComponent(inputName) + "&input_value=" + encodeURIComponent(inputValue);
		SignAction.validateFormData(inputName, data);
	});

	$(".sign-up-form input.valid").on("fucus", function(e) {
		e.preventDefault();
		$(this).removeClass("valid").removeClass("invalid");
	});

	// Sign up submit
	$(".sign-up-form button").on("click", function(e)
	{
		e.preventDefault();
		// does not wait for results to return
		//$(this).attr("disabled", true).addClass("inactive");
		// alert("sign up");
		SignAction.postSignUp();
		//$(this).attr("disabled", false).removeClass("inactive");
	});


	/**************************************************************************
		Sign In
	**************************************************************************/
	$(".sign-in-form button").on("click", function(e)
	{
		e.preventDefault();
		//$(this).attr("disabled", true).addClass("inactive");
		SignAction.postSignIn();
		//$(this).attr("disabled", false).removeClass("inactive");
	});
});

var SignAction = {
	toggleSignActionMenu: function(index) 
	{
		$(".toggle-menu a").removeClass("active");
		$(".forms-container .form").removeClass("active");
		
		switch(index)
		{
			case 0:
				$(".toggle-menu .sign-in").addClass("active");
				$(".forms-container .form.sign-in-form").addClass("active");
				break;
			case 1:
				$(".toggle-menu .sign-up").addClass("active");
				$(".forms-container .form.sign-up-form").addClass("active");
				break;
			default: break;
		}
	},

	postSignIn: function()
	{
		if ($(".sign-in-form input[name=email]").val() == "")
		{
			$(".sign-in-form .status").fadeIn("slow").text("Please enter your email address.");
			return false;
		}

		if ($(".sign-in-form input[name=password]").val() == "")
		{
			$(".sign-in-form .status").fadeIn("slow").text("Please enter your password");
			return false;
		}

		var data = $(".sign-in-form").serialize();
		//alert(data);
		$.post("/signin", data, function(e)
		{
			//alert(e);
			if (e.indexOf("successfully") !== -1) 
			{
            	window.location.href = "/";
            } else {
            	$(".sign-in-form .status").fadeIn("slow").html(e);
            }
		});
	},

	validateFormData: function(type, data)
	{
		//alert(data);
		$.post("/validate_form_data", data, function(e)
		{
			//alert(e);
			if (e.indexOf("invalid") !== -1) 
			{
        		$(".sign-up-form input[name=" + type + "]")
    				.removeClass("valid")
    				.addClass("invalid");
            } else {
				$(".sign-up-form input[name=" + type + "]")
					.removeClass("invalid")
					.addClass("valid");
            }
		});
	},

	postSignUp: function()
	{
		// alert("sign up POST");

		var data = $(".sign-up-form").serialize();
		$.post("/signup", data, function(e)
		{
			alert(e);
			if (e.indexOf("successfully") !== -1) 
			{
            	//window.location.href = "/";
            } else {
            	$(".sign-up-form .status").fadeIn("slow").html(e);
            }
		});
	}
};