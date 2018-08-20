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
#line 4 "user.dt"
 string pageTitle = "Profile of #{user.fullName} | Quertiv"; {
#line 4 "user.dt"
}
#line 5 "user.dt"
 string pageDescription = "Sign in your existing account or create an account"; {
#line 5 "user.dt"
}
_diet_output.put("<link rel=\"stylesheet\" href=\"/");
#line 7 "user.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/user.css\"/><!--/ script(type=\"text/javascript\", src=\"/#{AssetsURL.js}/user.js\")--><!-- Global head elements--><title>");
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
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><figure class=\"account-thumb\"><img src=\"/img/avatar.jpg\"/></figure></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"user-section has-box-shadow\"><section class=\"user\"><div class=\"top-info\"><figure><img src=\"/media/avatar.jpg\" alt=\"Avatar\"/></figure><ul><li>");
#line 19 "user.dt"
_diet_output.htmlEscape(user.fullName);
_diet_output.put("</li><li>");
#line 20 "user.dt"
_diet_output.htmlEscape(user.skillName);
_diet_output.put("</li><li>");
#line 21 "user.dt"
_diet_output.htmlEscape(user.location);
_diet_output.put("</li></ul></div><p class=\"about\">This is about me as the author of this tiv</p><ul class=\"follows\"><li><a href=\"#\">https://aberba.com</a></li><li><a class=\"buttonn\" href=\"#\">Follow</a></li></ul></section><section class=\"map\"><div></div></section></section><section class=\"tivs-section has-box-shadow\"></section></main></div></body>");
