(function (a) {
    a(function () {
        a(".nav-list li span:not(.expand)").live("click", function () {
            var b = a(this), c = b.siblings("ul"), d = b.parent("li").siblings("li").children("span"),
                e = d.siblings("ul");
            b.addClass("expand");
            c.slideDown(200);
            d.removeClass("expand");
            e.slideUp(200)
        })
    })
})(jQuery);