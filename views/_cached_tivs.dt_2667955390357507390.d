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
#line 4 "tivs.dt"
 string pageTitle = "Tivs | Quertiv"; {
#line 4 "tivs.dt"
}
#line 5 "tivs.dt"
 string pageDescription = "A collection of creative works"; {
#line 5 "tivs.dt"
}
_diet_output.put("<link rel=\"stylesheet\" href=\"/");
#line 7 "tivs.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/tivs.css\"/><link rel=\"stylesheet\" href=\"/");
#line 8 "tivs.dt"
_diet_output.htmlAttribEscape(AssetsURL.css);
_diet_output.put("/pagination.css\"/><!-- Global head elements--><title>");
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
_diet_output.put("/logo.png\" alt=\"Quertiv Logo\"/></a></figure><ul class=\"main-menu\"><li><a href=\"/\">Tivs</a></li><li><a href=\"/discover\">Discover</a></li><li><a href=\"/blog\">Blog</a></li></ul><form class=\"form\"><input type=\"search\" name=\"search\" placeholder=\"Search ...\"/><input type=\"hidden\" name=\"category\" value=\"all\"/><input type=\"hidden\" name=\"filter_by\" value=\"all\"/></form><figure class=\"account-thumb\"><img src=\"/img/avatar.jpg\"/></figure></nav></div></header><div id=\"content-wrapper\" class=\"wrapper\"><main id=\"content\"><section class=\"tivs-section\">");
#line 12 "tivs.dt"
 if (tivs.length) {
#line 13 "tivs.dt"
 foreach(tiv; tivs) {
_diet_output.put("<section class=\"tiv has-box-shadow\"><span class=\"category-tag\"><a href=\"/explore/");
#line 15 "tivs.dt"
_diet_output.htmlAttribEscape(tiv.categoryName);
_diet_output.put("\">");
#line 15 "tivs.dt"
_diet_output.htmlEscape(tiv.categoryName);
_diet_output.put("</a></span><div><figure><a href=\"/tiv_view/");
#line 19 "tivs.dt"
_diet_output.htmlAttribEscape(tiv.tivID);
_diet_output.put("\"><img src=\"/");
#line 19 "tivs.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/");
#line 19 "tivs.dt"
_diet_output.htmlAttribEscape(tiv.mediaFile1);
_diet_output.put("\" alt=\"Cover image for &#39;");
#line 19 "tivs.dt"
_diet_output.htmlAttribEscape(tiv.title);
_diet_output.put("&#39;\"/></a></figure><h3><a href=\"/tiv_view/");
#line 20 "tivs.dt"
_diet_output.htmlAttribEscape(tiv.tivID);
_diet_output.put("\">");
#line 20 "tivs.dt"
_diet_output.htmlEscape(tiv.title);
_diet_output.put("</a></h3></div><div class=\"author clearfix\"><figure><img src=\"/");
#line 24 "tivs.dt"
_diet_output.htmlAttribEscape(AssetsURL.media);
_diet_output.put("/avatar.jpg\" alt=\"Avatar\"/></figure><div><ul><li><a href=\"/users/");
#line 27 "tivs.dt"
_diet_output.htmlAttribEscape(tiv.userID);
_diet_output.put("\">");
#line 27 "tivs.dt"
_diet_output.htmlEscape(tiv.fullName);
_diet_output.put("</a></li><li>");
#line 28 "tivs.dt"
_diet_output.htmlEscape(tiv.skillName);
_diet_output.put("</li><li>");
#line 29 "tivs.dt"
_diet_output.htmlEscape(tiv.location);
_diet_output.put("</li></ul></div><div><ul> <li></li><li>2 h</li><li>+ 20</li></ul></div></div></section>");
#line 13 "tivs.dt"
}
#line 12 "tivs.dt"
}
#line 35 "tivs.dt"
 else {
_diet_output.put("<p>No results founds</p>");
#line 35 "tivs.dt"
}
_diet_output.put("</section><!-- Pagination-->");
#line 40 "tivs.dt"
 if (pagination.totalPages() > 1) {
_diet_output.put("<section class=\"pagination has-box-shadow\"><!-- Previous page-->");
#line 44 "tivs.dt"
 if(pagination.hasPreviousPage())  {
_diet_output.put("<div class=\"previous\"><a href=\"/tivs/");
#line 45 "tivs.dt"
_diet_output.htmlAttribEscape(pagination.previousPage());
_diet_output.put("\">&laquo;</a></div>");
#line 44 "tivs.dt"
}
#line 46 "tivs.dt"
 else  {
_diet_output.put("<div>&nbsp;</div>");
#line 46 "tivs.dt"
}
_diet_output.put("<!-- Shows pages Numbers-->");
#line 50 "tivs.dt"
 foreach (pageNumber; 1..pagination.totalPages() + 1) {
#line 51 "tivs.dt"
 if (pageNumber == pagination.currentPage)  {
_diet_output.put("<div class=\"current\">");
#line 52 "tivs.dt"
_diet_output.htmlEscape(pageNumber);
_diet_output.put("</div>");
#line 51 "tivs.dt"
}
#line 53 "tivs.dt"
 else  {
_diet_output.put("<div><a href=\"/tivs/");
#line 54 "tivs.dt"
_diet_output.htmlAttribEscape(pageNumber);
_diet_output.put("\">");
#line 54 "tivs.dt"
_diet_output.htmlEscape(pageNumber);
_diet_output.put("</a></div>");
#line 53 "tivs.dt"
}
#line 50 "tivs.dt"
}
_diet_output.put("<!-- Next page-->");
#line 57 "tivs.dt"
 if (pagination.hasNextPage()) {
_diet_output.put("<div class=\"next\"><a href=\"/tivs/");
#line 58 "tivs.dt"
_diet_output.htmlAttribEscape(pagination.nextPage());
_diet_output.put("\">&raquo;</a></div>");
#line 57 "tivs.dt"
}
#line 59 "tivs.dt"
 else  {
_diet_output.put("<div>&nbsp;</div>");
#line 59 "tivs.dt"
}
_diet_output.put("</section>");
#line 40 "tivs.dt"
}
_diet_output.put("</main></div></body>");
