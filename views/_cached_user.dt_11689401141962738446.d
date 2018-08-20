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
#line 4 "user.dt"
 string pageTitle = "Profile of " ~ user.fullName ~ " | Quertiv"; {
#line 4 "user.dt"
}
#line 5 "user.dt"
 string pageDescription = ""; {
#line 5 "user.dt"
}
_diet_output.put("<link rel=\"stylesheet\" href=\"/");
#line 7 "user.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/user.css\"/><link rel=\"stylesheet\" href=\"/");
#line 8 "user.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/tivs.css\"/><link rel=\"stylesheet\" href=\"/");
#line 9 "user.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/pagination.css\"/><!--/ script(type=\"text/javascript\", src=\"/#{AssetsURL.js}/user.js\")--><!-- Global head elements--><title>");
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
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><div class=\"account-menu\"><figure class=\"avatar-thumb\"><img src=\"/img/avatar.jpg\" alt=\"Avatar\" title=\"Account Menu\"/></figure><section class=\"menu-wrapper\"><p class=\"arrow\"></p><section class=\"menu\"><section class=\"toggle-menu\"><div class=\"toggle-account active\">Account</div><div class=\"toggle-notification\"><Notifications><span class=\"badge\">10+</span></Notifications></div></section><section class=\"menu-pane options\"><div class=\"option\"><a href=\"#\">Profile</a></div><div class=\"option\"><a href=\"#\">Settings</a></div><div class=\"option\"><a href=\"#\">Privacy Policy</a></div><div class=\"option\"><a href=\"#\">Terms of Use</a></div></section><section class=\"menu-pane notifications\"><section class=\"notification\"><a href=\"#\"><div class=\"letter\"><span>U</span></div></a><div class=\"info\"><h4>Title of notification</h4><p>Activity description summary here nnns ssjs sjjs ...<a href=\"#\">read more &raquo;</a></p></div></section><section class=\"all-btn\"><a href=\"/notifications\" title=\"See all your notifications\">All Notifications</a></section></section><section class=\"actions\"><div><a href=\"/sign/out\" title=\"Log out\">Sign Out</a></div><div><a href=\"/sign/in\" title=\"Log into your account\">Sign In</a></div><div><a href=\"/sign/out\" title=\"Create an account\">Sign Up</a></div></section></section></section></div></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"user-section has-box-shadow\"><section class=\"user\"><div class=\"profile\"><figure><img src=\"/media/avatar.jpg\" alt=\"Profile Photo\"/></figure><ul><li>");
#line 21 "user.dt"
_diet_output.htmlEscape(user.fullName);
_diet_output.put("</li><li>");
#line 22 "user.dt"
_diet_output.htmlEscape(user.skillName);
_diet_output.put("</li><li>");
#line 23 "user.dt"
_diet_output.htmlEscape(user.location);
_diet_output.put("</li></ul></div><ul class=\"about\"><li>");
#line 26 "user.dt"
_diet_output.htmlEscape(user.bio);
_diet_output.put("</li><li><a");
#line 27 "user.dt"
static if (is(typeof(user.websiteURL) == bool)) {
#line 27 "user.dt"
if (user.websiteURL) _diet_output.put(" href");
#line 27 "user.dt"
} else static if (is(typeof(user.websiteURL) : const(char)[])) {{
#line 27 "user.dt"
  auto val = user.websiteURL;
#line 27 "user.dt"
  if (val !is null) {
_diet_output.put(" href=\"");
#line 27 "user.dt"
    _diet_output.filterHTMLAttribEscape(val);
_diet_output.put("\"");
#line 27 "user.dt"
  }
#line 27 "user.dt"
}} else {
_diet_output.put(" href=\"");
#line 27 "user.dt"
_diet_output.htmlAttribEscape(user.websiteURL);
_diet_output.put("\"");
#line 27 "user.dt"
}
_diet_output.put(">");
#line 27 "user.dt"
_diet_output.htmlEscape(user.websiteURL);
_diet_output.put("</a></li></ul><div class=\"follow\"><p class=\"arrow\"></p><button class=\"button\" type=\"button\">Follow</button><div>200</div></div></section><section class=\"map\"><div></div></section></section><section class=\"authored-tivs-section has-box-shadow\"><h3>Tivs Authored</h3><form class=\"form user-tivs-search-form\"><div><label>Search authored tivs:</label><input type=\"search\" name=\"search_user_tiv\" placeholder=\"Enter a keyword or phrase to search ...\"/><button type=\"button\" name=\"button\">Search</button></div></form><div class=\"search-status\"><p>Search results for <em>ice cream</em></p></div></section><section class=\"tivs-section\">");
#line 51 "user.dt"
 if (tivs.length) {
#line 52 "user.dt"
 foreach(tiv; tivs) {
_diet_output.put("<section class=\"tiv has-box-shadow\"><span class=\"category-tag\"><a href=\"/explore/");
#line 54 "user.dt"
_diet_output.htmlAttribEscape(tiv.categoryName);
_diet_output.put("\">");
#line 54 "user.dt"
_diet_output.htmlEscape(tiv.categoryName);
_diet_output.put("</a></span><div><figure><a href=\"/tiv_view/");
#line 58 "user.dt"
_diet_output.htmlAttribEscape(tiv.tivID);
_diet_output.put("\"><img src=\"/");
#line 58 "user.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/");
#line 58 "user.dt"
_diet_output.htmlAttribEscape(tiv.mediaFile1);
_diet_output.put("\" alt=\"Cover image for &#39;");
#line 58 "user.dt"
_diet_output.htmlAttribEscape(tiv.title);
_diet_output.put("&#39;\"/></a></figure><h3><a href=\"/tiv_view/");
#line 59 "user.dt"
_diet_output.htmlAttribEscape(tiv.tivID);
_diet_output.put("\">");
#line 59 "user.dt"
_diet_output.htmlEscape(tiv.title);
_diet_output.put("</a></h3></div><div class=\"author clearfix\"><figure><img src=\"/");
#line 63 "user.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/avatar.jpg\" alt=\"Avatar\"/></figure><div><ul><li><a href=\"/users/");
#line 66 "user.dt"
_diet_output.htmlAttribEscape(tiv.userID);
_diet_output.put("\">");
#line 66 "user.dt"
_diet_output.htmlEscape(tiv.fullName);
_diet_output.put("</a></li><li>");
#line 67 "user.dt"
_diet_output.htmlEscape(tiv.skillName);
_diet_output.put("</li><li>");
#line 68 "user.dt"
_diet_output.htmlEscape(tiv.location);
_diet_output.put("</li></ul></div><div><ul> <li></li><li>2 h</li><li>+ 20</li></ul></div></div></section>");
#line 52 "user.dt"
}
#line 51 "user.dt"
}
#line 74 "user.dt"
 else {
_diet_output.put("<p>No tiv is published this user.</p>");
#line 74 "user.dt"
}
_diet_output.put("</section><!-- Pagination-->");
#line 79 "user.dt"
 if (pagination.totalPages() > 1) {
_diet_output.put("<section class=\"pagination has-box-shadow\"><!-- Previous page-->");
#line 83 "user.dt"
 if(pagination.hasPreviousPage())  {
_diet_output.put("<div class=\"previous\"><a href=\"/users/");
#line 84 "user.dt"
_diet_output.htmlAttribEscape(user.userID);
_diet_output.put("/");
#line 84 "user.dt"
_diet_output.htmlAttribEscape(pagination.previousPage());
_diet_output.put("\">&laquo;</a></div>");
#line 83 "user.dt"
}
#line 85 "user.dt"
 else  {
_diet_output.put("<div>&nbsp;</div>");
#line 85 "user.dt"
}
_diet_output.put("<!-- Shows pages Numbers-->");
#line 89 "user.dt"
 foreach (pageNumber; 1..pagination.totalPages() + 1) {
#line 90 "user.dt"
 if (pageNumber == pagination.currentPage)  {
_diet_output.put("<div class=\"current\">");
#line 91 "user.dt"
_diet_output.htmlEscape(pageNumber);
_diet_output.put("</div>");
#line 90 "user.dt"
}
#line 92 "user.dt"
 else  {
_diet_output.put("<div><a href=\"/users/");
#line 93 "user.dt"
_diet_output.htmlAttribEscape(user.userID);
_diet_output.put("/");
#line 93 "user.dt"
_diet_output.htmlAttribEscape(pageNumber);
_diet_output.put("\">");
#line 93 "user.dt"
_diet_output.htmlEscape(pageNumber);
_diet_output.put("</a></div>");
#line 92 "user.dt"
}
#line 89 "user.dt"
}
_diet_output.put("<!-- Next page-->");
#line 96 "user.dt"
 if (pagination.hasNextPage()) {
_diet_output.put("<div class=\"next\"><a href=\"/users/");
#line 97 "user.dt"
_diet_output.htmlAttribEscape(user.userID);
_diet_output.put("/");
#line 97 "user.dt"
_diet_output.htmlAttribEscape(pagination.nextPage());
_diet_output.put("\">&raquo;</a></div>");
#line 96 "user.dt"
}
#line 98 "user.dt"
 else  {
_diet_output.put("<div>&nbsp;</div>");
#line 98 "user.dt"
}
_diet_output.put("</section>");
#line 79 "user.dt"
}
_diet_output.put("</main></div></body>");
