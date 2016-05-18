 $(function() {
    //获取底部高度，赋值mainbody外边距
     var footHeight=$('#footer').height();
     $('#mainbody').css('marginBottom',footHeight+30+'px');
     $(window).resize(
        function(){
            $('#mainbody').css('marginBottom',footHeight+20+'px');
        }
     );
$(".movie-search").focus(function(){
                $(this).css('background','#fff');
                $(this).animate({width:'300px'});
            });//end movie-search input
 })