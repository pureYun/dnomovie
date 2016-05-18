$(function() {
    
    $('.prev-slide').on('click', function() {
        $('#slideshow').carousel('prev');
    });

    $('.next-slide').on('click', function() {
        $('#slideshow').carousel('next');
    });
    
    $(document).on('keydown', function(e) {
        switch (e.which) {
            case 37:
                $('#slideshow').carousel('prev');
                break;
            case 39:
                $('#slideshow').carousel('next');
                break;
        }
    });
    
    var play = false;
    $('.play-and-stop').click(
        function() {
            if (!play) {
                $('#slideshow').carousel('cycle');
                $(this).children('span').removeClass('glyphicon-play').addClass('glyphicon-pause');
            } else {
                $('#slideshow').carousel('pause');
                $(this).children('span').removeClass('glyphicon-pause').addClass('glyphicon-play');                
            }
            play = !play;
        }
    );
        
});