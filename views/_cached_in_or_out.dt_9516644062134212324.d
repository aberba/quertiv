import diet.internal.html : htmlEscape, htmlAttribEscape;
import std.format : formattedWrite;
#line 1 "layout.dt"
 import qv.enums; {
#line 1 "layout.dt"
}
_diet_output.put("<!DOCTYPE html><head><!--/ Blobal CSS and JS--><link rel=\"stylesheet\" href=\"/");
#line 6 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/app.css\"/><link rel=\"stylesheet\" href=\"/");
#line 7 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/account-menu.css\"/><script type=\"text/javascript\" src=\"/");
#line 9 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.js);
_diet_output.put("/jquery-3.1.1.min.js\"></script><script type=\"text/javascript\" src=\"/");
#line 10 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.js);
_diet_output.put("/app.js\"></script><!--/ Insert head template here-->");
#line 4 "in_or_out.dt"
 string pageTitle = "Sign in or Sign up | Quertiv"; {
#line 4 "in_or_out.dt"
}
#line 5 "in_or_out.dt"
 string pageDescription = "Sign in your existing account or create an account"; {
#line 5 "in_or_out.dt"
}
_diet_output.put("<link rel=\"stylesheet\" href=\"/");
#line 7 "in_or_out.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/in-or-out.css\"/><script type=\"text/javascript\" src=\"/");
#line 8 "in_or_out.dt"
_diet_output.htmlAttribEscape(AssetsURL.js);
_diet_output.put("/in-or-out.js\"></script><!-- Global head elements--><title>");
#line 16 "layout.dt"
_diet_output.htmlEscape(pageTitle);
_diet_output.put("</title><meta charset=\"utf-8\"/><link rel=\"shortcut icon\" type=\"image/ico\" href=\"/");
#line 19 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.img);
_diet_output.put("/favicon.ico\"/><meta name=\"viewport\" content=\"width=&#39;device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/><meta name=\"description\"");
#line 21 "layout.dt"
static if (is(typeof(pageDescription) == bool)) {
#line 21 "layout.dt"
if (pageDescription) _diet_output.put(" content");
#line 21 "layout.dt"
} else static if (is(typeof(pageDescription) : const(char)[])) {{
#line 21 "layout.dt"
  auto val = pageDescription;
#line 21 "layout.dt"
  if (val !is null) {
_diet_output.put(" content=\"");
#line 21 "layout.dt"
    _diet_output.filterHTMLAttribEscape(val);
_diet_output.put("\"");
#line 21 "layout.dt"
  }
#line 21 "layout.dt"
}} else {
_diet_output.put(" content=\"");
#line 21 "layout.dt"
_diet_output.htmlAttribEscape(pageDescription);
_diet_output.put("\"");
#line 21 "layout.dt"
}
_diet_output.put("/></head><body><header id=\"header\"><div class=\"wrapper\"><nav><ul class=\"thumb-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><figure class=\"logo\"><a href=\"/\"><img src=\"/");
#line 34 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.img);
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><div class=\"account-menu\"><figure class=\"avatar-thumb\"><img src=\"/img/avatar.jpg\" alt=\"Avatar\" title=\"Account Menu\"/></figure><section class=\"menu-wrapper\"><p class=\"arrow\"></p><section class=\"menu\"><section class=\"toggle-menu\"><div class=\"toggle-account active\">Account</div><div class=\"toggle-notification\"><Notifications><span class=\"badge\">10+</span></Notifications></div></section><section class=\"menu-pane options\"><div class=\"option\"><a href=\"#\">Profile</a></div><div class=\"option\"><a href=\"#\">Settings</a></div><div class=\"option\"><a href=\"#\">Privacy Policy</a></div><div class=\"option\"><a href=\"#\">Terms of Use</a></div></section><section class=\"menu-pane notifications\"><section class=\"notification\"><a href=\"#\"><div class=\"letter\"><span>U</span></div></a><div class=\"info\"><h4>Title of notification</h4><p>Activity description summary here nnns ssjs sjjs ...<a href=\"#\">read more &raquo;</a></p></div></section><section class=\"all-btn\"><a href=\"/notifications\" title=\"See all your notifications\">All Notifications</a></section></section><section class=\"actions\"><div><a href=\"/sign/out\" title=\"Log out\">Sign Out</a></div><div><a href=\"/sign/in\" title=\"Log into your account\">Sign In</a></div><div><a href=\"/sign/out\" title=\"Create an account\">Sign Up</a></div></section></section></section></div></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"sign-section\"><section class=\"forms-section has-box-shadow\"><div class=\"toggle-menu\"><a class=\"sign-in ");
#line 15 "in_or_out.dt"
_diet_output.htmlAttribEscape(actionType == "in" ? "active" : "");
_diet_output.put("\" href=\"/signin\">Sign In</a><a class=\"sign-up ");
#line 16 "in_or_out.dt"
_diet_output.htmlAttribEscape(actionType == "up" ? "active" : "");
_diet_output.put("\" href=\"/signup\">Sign Up</a><!--div(class=actionType == \"up\" ? \"active\" : \"\"): a(href=\"#\") Sign Up--><!--div.status-bar\n    //div.progress-bar: div.progress(data-level=\"10\")\n    //div.progress-msg: p Invalid email and password combination \n    --></div><div class=\"forms-container\"><form class=\"form sign-in-form ");
#line 24 "in_or_out.dt"
_diet_output.htmlAttribEscape(actionType == "in" ? "active" : "");
_diet_output.put("\"><h2>Sign into your existing account</h2><div class=\"status sign-in-status\"></div><div><label for=\"email\">Email Address:</label><input type=\"email\" name=\"email\" placeholder=\" johndoe@mail.com\"/></div><div><label for=\"password\">Password:</label><input type=\"password\" name=\"password\" placeholder=\" ********\"/></div><div><input type=\"checkbox\" name=\"keep\" value=\"1\"/><label for=\"email\">Remember me.</label></div><button type=\"button\">Sign In</button></form><form class=\"form sign-up-form ");
#line 44 "in_or_out.dt"
_diet_output.htmlAttribEscape(actionType == "up" ? "active" : "");
_diet_output.put("\"><h2>Create an account</h2><div class=\"status sign-up-status\"></div><div><label for=\"full_name\">Your Full Name:</label><input type=\"text\" name=\"full_name\" placeholder=\"e.g. John Doe\"/></div><div><label for=\"skill\">Your main skill:</label><input type=\"text\" name=\"skill\" placeholder=\"e.g. Carpentry\"/></div><div><label for=\"email\">Email Address:</label><input type=\"email\" name=\"email\" placeholder=\"e.g. johndoe@mail.com\"/></div><div><label for=\"password\">Password:</label><input type=\"password\" name=\"password\" placeholder=\" ********\"/></div><input type=\"checkbox\" name=\"agree\" value=\"1\"/><span>Yes, I agree with Quertiv's <a href=\"/privacy-policy\">Privacy Policy</a> and <a href=\"/terms-of-use\">Terms of Use</a> <sup class=\"error\">*</sup></span><input type=\"hidden\" name=\"lat_lng\" value=\"yes\"/><div><button type=\"button\">Sign Up</button></div></form></div></section><section class=\"slides-section has-box-shadow\"><p>Slides will be here</p></section></section></main></div></body>");
