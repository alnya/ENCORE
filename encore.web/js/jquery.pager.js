(function ($) {
    $.fn.quickPager = function(options) {

        var defaults = {
            pageSize: 50,
            currentPage: 1
        };

        var options = $.extend(defaults, options);

        return this.each(function() {
            var selector = $(this);
            var pageCounter = 1;

            selector.wrap("<div class='simplePagerContainer'></div>");

            selector.parents(".simplePagerContainer").find("ul.simplePagerNav").remove();

            selector.children().each(function(i) {

                if (i < pageCounter * options.pageSize && i >= (pageCounter - 1) * options.pageSize) {
                    $(this).addClass("simplePagerPage" + pageCounter);
                }
                else {
                    $(this).addClass("simplePagerPage" + (pageCounter + 1));
                    pageCounter++;
                }

            });

            // show/hide the appropriate regions 
            selector.children().hide();
            selector.children(".simplePagerPage" + options.currentPage).show();

            if (pageCounter <= 1) {
                return;
            }

            //Build pager navigation
            var pageNav = "<ul class='simplePagerNav'>";
            for (i = 1; i <= pageCounter; i++) {
                if (i == options.currentPage) {
                    pageNav += "<li class='currentPage simplePageNav" + i + "'><a rel='" + i + "' href='#'>" + i + "</a></li>";
                }
                else {
                    pageNav += "<li class='simplePageNav" + i + "'><a rel='" + i + "' href='#'>" + i + "</a></li>";
                }
            }
            pageNav += "</ul>";

            $(selector).parent().parent().parent().append(pageNav);
      
            //pager navigation behaviour
            selector.parent().parent().parent().find(".simplePagerNav a").click(function() {

                //grab the REL attribute 
                var clickedLink = $(this).attr("rel");
                options.currentPage = clickedLink;

                $(this).parent("li").parent('ul').find("li.currentPage").removeClass("currentPage");
                $(this).parent("li").addClass("currentPage");

                //hide and show relevant links
                selector.children().hide();
                selector.find(".simplePagerPage" + clickedLink).show();

                return false;
            });
        });
    };

})(jQuery);