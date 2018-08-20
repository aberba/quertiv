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
#line 4 "tiv_view.dt"
 string pageTitle = "Tivs &raquo; #{tiv.title} | Quertiv"; {
#line 4 "tiv_view.dt"
}
#line 5 "tiv_view.dt"
 string pageDescription = "Sign in your existing account or create an account"; {
#line 5 "tiv_view.dt"
}
_diet_output.put("<link rel=\"stylesheet\" href=\"/");
#line 7 "tiv_view.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/tiv-view.css\"/><script type=\"text/javascript\" src=\"/");
#line 8 "tiv_view.dt"
_diet_output.htmlAttribEscape(AssetsURL.js);
_diet_output.put("/tiv-view.js\"></script><!-- Global head elements--><title>");
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
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><div class=\"account-menu\"><figure class=\"avatar-thumb\"><img src=\"/img/avatar.jpg\" alt=\"Avatar\" title=\"Account Menu\"/></figure><section class=\"menu-wrapper\"><p class=\"arrow\"></p><section class=\"menu\"><section class=\"toggle-menu\"><div class=\"toggle-account active\">Account</div><div class=\"toggle-notification\">Notifications <span class=\"badge\">10+</span></div></section><section class=\"menu-pane options\"><div class=\"option\"><a href=\"#\">Profile</a></div><div class=\"option\"><a href=\"#\">Settings</a></div><div class=\"option\"><a href=\"#\">Privacy Policy</a></div><div class=\"option\"><a href=\"#\">Terms of Use</a></div></section><section class=\"menu-pane notifications\"><section class=\"notification\"><a href=\"#\"><div class=\"letter\"><span>U</span></div></a><div class=\"info\"><h4>Title of notification</h4><p>Activity description summary here nnns ssjs sjjs ...<a href=\"#\">read more &raquo;</a></p></div></section><section class=\"all-btn\"><a href=\"/notifications\" title=\"See all your notifications\">All Notifications</a></section></section><section class=\"actions\"><div><a href=\"/sign/out\" title=\"Log out\">Sign Out</a></div><div><a href=\"/sign/in\" title=\"Log into your account\">Sign In</a></div><div><a href=\"/sign/out\" title=\"Create an account\">Sign Up</a></div></section></section></section></div></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"tiv-section\"><section class=\"tiv-content\"><section class=\"tiv-info has-box-shadow\"><h1 class=\"title\">");
#line 16 "tiv_view.dt"
_diet_output.htmlEscape(tiv.title);
_diet_output.put("</h1><ul class=\"author\"><li>By <a href=\"/users/");
#line 19 "tiv_view.dt"
_diet_output.htmlAttribEscape(tiv.userID);
_diet_output.put("\">");
#line 19 "tiv_view.dt"
_diet_output.htmlEscape(tiv.fullName);
_diet_output.put("</a></li><li>In <a href=\"/explore/");
#line 20 "tiv_view.dt"
_diet_output.htmlAttribEscape(tiv.categoryName);
_diet_output.put("\">");
#line 20 "tiv_view.dt"
_diet_output.htmlEscape(tiv.categoryName);
_diet_output.put("</a></li><li>On ");
#line 21 "tiv_view.dt"
_diet_output.htmlEscape(tiv.addedOn);
_diet_output.put("</li></ul><figure class=\"cover\"><img src=\"/");
#line 24 "tiv_view.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/");
#line 24 "tiv_view.dt"
_diet_output.htmlAttribEscape(tiv.mediaFile1);
_diet_output.put("\" alt=\"Cover image for &#39;");
#line 24 "tiv_view.dt"
_diet_output.htmlAttribEscape(tiv.title);
_diet_output.put("&#39;\"/></figure><section class=\"description\"><section>");
#line 27 "tiv_view.dt"
_diet_output.htmlEscape(tiv.description);
_diet_output.put("</section><section class=\"author-profile clearfix\"><figure><img src=\"/");
#line 31 "tiv_view.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/");
#line 31 "tiv_view.dt"
_diet_output.htmlAttribEscape(tiv.avatar);
_diet_output.put("\"/></figure><ul><li><a href=\"user/");
#line 34 "tiv_view.dt"
_diet_output.htmlAttribEscape(tiv.userID);
_diet_output.put("\">");
#line 34 "tiv_view.dt"
_diet_output.htmlEscape(tiv.fullName);
_diet_output.put("</a></li><li>");
#line 35 "tiv_view.dt"
_diet_output.htmlEscape(tiv.skillName);
_diet_output.put("</li><li>");
#line 36 "tiv_view.dt"
_diet_output.htmlEscape(tiv.bio);
_diet_output.put("</li></ul></section></section></section><section class=\"tiv-comments has-box-shadow\"><h2>Comments on tiv</h2><section class=\"comment clearfix\"><figure><img src=\"/");
#line 44 "tiv_view.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/avatar.jpg\"/></figure><ul><li>Full Name </li><li><a href=\"#\">Reply User</a> This is the comment on this tiv from another user</li></ul></section><section class=\"comment\"><figure><img src=\"/");
#line 52 "tiv_view.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/avatar.jpg\"/></figure><ul><li>Full Name &laquo; <span class=\"reply-to\">John Ben</span></li><li><a href=\"#\">Reply User</a> This is the comment on this tiv from another user</li></ul></section></section></section><aside class=\"aside has-box-shadow\"><section class=\"ads\"></section><section class=\"featured-tivs\"></section></aside></section></main></div></body>");
