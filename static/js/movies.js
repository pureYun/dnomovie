$(function() {
            //点击播放电影，生成播放记录

            $('a.btn-movie').click(function(e){
                var movieid= $(this).attr("id");

                //用get方法传输数据，不好不好，以后要改,先用这种方式吧
                $.get('/generatemoviehistory',{movieid:movieid})
                //用Ajax不知道为什么出问题唉
                   /* $.ajax({
                      type: "POST",
                      contentType: "application/json; charset=utf-8",
                      url: '/generatemoviehistory',
                      data: JSON.stringify({movieid: movieid}),
                      success: function (data) {
                        console.log(data.movieid);
                      },
                      dataType: "json"
                    });*/

            });//end bofang movie

            $(".movieList_con_cell").hover(function(){
            $(this).find(".movieList_con_cell_info").css("border-bottom","1px solid #4ba6e5")
            $(this).find(".movie-info .title a").addClass("on-hover");
            },
            function(){
            $(this).find(".movie-info .title a").removeClass("on-hover");
            $(this).find(".movieList_con_cell_info").css("border-bottom","none");
            });//end movielist_con_cell

            $(".post-thumbnail").hover(function(){
                $(this).find(".img_title").css("display","block").slideUp(2200);
            },
            function(){
            $(this).find(".img_title").css("display","none").slideUp(2200);
            });//end post-thunbmal

            //点击右上角收藏按钮
            $(".havesee").click(function(){
                alert("hahah")
              $(this).parents("div .col-md-4").remove();

            });//end havesee

        });


