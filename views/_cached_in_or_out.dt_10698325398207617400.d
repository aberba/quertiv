import diet.internal.html : htmlEscape, htmlAttribEscape;
import std.format : formattedWrite;
#line 1 "layout.dt"
 import qv.enums; {
#line 1 "layout.dt"
}
_diet_output.put("<!DOCTYPE html><head><!--/ Blobal CSS and JS--><link rel=\"stylesheet\" href=\"/");
#line 6 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/app.css\"/><script type=\"text/javascript\" src=\"/");
#line 8 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.js);
_diet_output.put("/jquery-3.1.1.min.js\"></script><script type=\"text/javascript\" src=\"/");
#line 9 "layout.dt"
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
#line 15 "layout.dt"
_diet_output.htmlEscape(pageTitle);
_diet_output.put("</title><meta charset=\"utf-8\"/><link rel=\"shortcut icon\" type=\"image/ico\" href=\"/");
#line 18 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.img);
_diet_output.put("/favicon.ico\"/><meta name=\"viewport\" content=\"width=&#39;device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/><meta name=\"description\"");
#line 20 "layout.dt"
static if (is(typeof(pageDescription) == bool)) {
#line 20 "layout.dt"
if (pageDescription) _diet_output.put(" content");
#line 20 "layout.dt"
} else static if (is(typeof(pageDescription) : const(char)[])) {{
#line 20 "layout.dt"
  auto val = pageDescription;
#line 20 "layout.dt"
  if (val !is null) {
_diet_output.put(" content=\"");
#line 20 "layout.dt"
    _diet_output.filterHTMLAttribEscape(val);
_diet_output.put("\"");
#line 20 "layout.dt"
  }
#line 20 "layout.dt"
}} else {
_diet_output.put(" content=\"");
#line 20 "layout.dt"
_diet_output.htmlAttribEscape(pageDescription);
_diet_output.put("\"");
#line 20 "layout.dt"
}
_diet_output.put("/></head><body><header id=\"header\"><div class=\"wrapper\"><nav><ul class=\"thumb-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><figure class=\"logo\"><a href=\"/\"><img src=\"/");
#line 33 "layout.dt"
_diet_output.htmlAttribEscape(AssetsURL.img);
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><figure class=\"account-thumb\"><img src=\"/img/avatar.jpg\"/></figure></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"sign-section\"><section class=\"forms-section has-box-shadow\"><div class=\"toggle-menu\"><a class=\"sign-in ");
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
