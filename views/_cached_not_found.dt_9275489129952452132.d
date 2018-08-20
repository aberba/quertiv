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
#line 4 "not_found.dt"
 string pageTitle = "Resource Not Found | Quertiv"; {
#line 4 "not_found.dt"
}
#line 5 "not_found.dt"
 string pageDescription = ""; {
#line 5 "not_found.dt"
}
_diet_output.put("<link rel=\"stylesheet\" href=\"/");
#line 7 "not_found.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/not-found.css\"/><!-- Global head elements--><title>");
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
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><div class=\"account-menu\"><figure class=\"avatar-thumb\"><img src=\"/img/avatar.jpg\" alt=\"Avatar\" title=\"Account Menu\"/></figure><section class=\"menu-wrapper\"><p class=\"arrow\"></p><section class=\"menu\"><section class=\"toggle-menu\"><div class=\"toggle-account active\">Account</div><div class=\"toggle-notification\">Notifications <span class=\"badge\">10+</span></div></section><section class=\"menu-pane options\"><div class=\"option\"><a href=\"#\">Profile</a></div><div class=\"option\"><a href=\"#\">Settings</a></div><div class=\"option\"><a href=\"#\">Privacy Policy</a></div><div class=\"option\"><a href=\"#\">Terms of Use</a></div></section><section class=\"menu-pane notifications\"><section class=\"notification\"><a href=\"#\"><div class=\"letter\"><span>U</span></div></a><div class=\"info\"><h4>Title of notification</h4><p>Activity description summary here nnns ssjs sjjs ...<a href=\"#\">read more &raquo;</a></p></div></section><section class=\"all-btn\"><a href=\"/notifications\" title=\"See all your notifications\">All Notifications</a></section></section><section class=\"actions\"><div><a href=\"/sign/out\" title=\"Log out\">Sign Out</a></div><div><a href=\"/sign/in\" title=\"Log into your account\">Sign In</a></div><div><a href=\"/sign/out\" title=\"Create an account\">Sign Up</a></div></section></section></section></div></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"user-section has-box-shadow\"><div class=\"not-found\"><h3>Oops!</h3><p>");
#line 13 "not_found.dt"
_diet_output.htmlEscape(message);
_diet_output.put("  </p></div></section></main></div></body>");
