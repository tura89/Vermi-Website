(function ($) {


    $(document).ready(function(){
        $( '#info #job_costs' ).hide();

        $('#info-nav li').click(function(e) {
            $('#info .hide').hide();
            $('#info-nav .current').removeClass("current");
            $(this).addClass('current');

            var clicked = $(this).find('a:first').attr('href');
            $('#info ' + clicked).fadeIn('fast');
            e.preventDefault();
        }).eq(0).addClass('current');
    });

    // Navigation scrolls
    $(".navbar-nav li a").on('click', function(event) {
        $('.navbar-nav li').removeClass('active');
        $(this).closest('li').addClass('active');
        var $anchor = $(this);
        var nav = $($anchor.attr('href'));
        if (nav.length) {
        $('html, body').stop().animate({				
            scrollTop: $($anchor.attr('href')).offset().top				
        }, 1500, 'easeInOutExpo');
        
        event.preventDefault();
        }
    });
    
    // Add smooth scrolling to all links in navbar
    $("a.mouse-hover, a.get-quote").on('click', function(event) {
      var hash = this.hash;
      if( hash ) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: $(hash).offset().top
        }, 1500, 'easeInOutExpo');
      }
    });
})(jQuery);
