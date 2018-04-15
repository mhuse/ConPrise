function version($log) {
    window.console && console.log($log);
}
function dbg($log) {
    window.console && console.log($log);
}

require.config({
    baseUrl: '/sites/all/themes/designcouncil/js/libs',
    //urlArgs: "bust=" + (new Date()).getTime(),
    paths: {
        base: '../',
        async: "async",
        goog: 'goog',
        propertyParser : 'propertyParser',
        typing: 'jquery.typing-0.2.0.min',
        actual: 'jquery.actual.min',
        inview: 'jquery.inview.min',
        visible: 'jquery.visible.min',
        imagesLoaded: 'imagesloaded',
        carousel: 'owl.carousel',
        slider: 'jquery.flexslider',
        parsley: 'parsley/parsley',
        onmediaquery: 'onmediaquery.min',
        placeholder: "jquery.placeholder",
        smoothScroll: "smooth-scroll",
        history: "native.history",
        radio: "jquery-radiobutton-2.0",
        addthis: '//s7.addthis.com/js/300/addthis_widget.js#pubid=designcouncil',
    }
});

require(['base/bootstrap']);

/* Helper to trigger an event when the user stops resizing their browser*/
(function($){
    $(document).ready(function() {
       $(window).bind('resize', function()
        {
            window.resizeEvt;
            jQuery(window).resize(function()
            {
                clearTimeout(window.resizeEvt);
                window.resizeEvt = setTimeout(function()
                {
                    jQuery(window).trigger("teasers:reflow");
                }, 50);
            });
        });
    });
})(jQuery);