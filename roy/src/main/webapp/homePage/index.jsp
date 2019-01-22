<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<!-- Title -->
<title>FarVOiCE</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
<!-- JS -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<!-- Isotope - Portfolio Sorting -->
<script type="text/javascript" src="../js/jquery.isotope.js"></script>
<!-- Mobile Menu - Slicknav -->
<script type="text/javascript" src="../js/jquery.slicknav.js"></script>
<!-- Animate on Scroll-->
<script type="text/javascript" src="../js/jquery.visible.js"
	charset="utf-8"></script>
<!-- Sticky Div -->
<script type="text/javascript" src="../js/jquery.sticky.js"
	charset="utf-8"></script>
<!-- Slimbox2-->
<script type="text/javascript" src="../js/slimbox2.js" charset="utf-8"></script>
<!-- Modernizr -->
<script src="../js/modernizr.custom.js" type="text/javascript"></script>
<script src="1.js?ver=1"></script>
<!-- End JS -->
<style>
#musicPage{
cursor: pointer;
}
#yoyo{ 
	color:white;
	margin-top:0px;
    font-size:17px;
}
.likeCoint{
margin:0;padding:0;color:#a4a4a4;

}
.player{
cursor: pointer;
margin-top:60px;
}
.heart{
width:25px;
cursor: pointer;
}

.heartTeam{
float:right;width:50px;margin-top:25px;margin-right:50px;
}

</style>
<script>
$(document).ready(function(){
	//取消a默認
	$('a.arrow').on('click',function(event){
		event.preventDefault();
		});
	//取消a默認
	
	loadLikeMusic('${user.member_username}');

	//按愛心
      $('#likes').on('click','.heart',function(){
		    if('${user.member_username}'!=""){
		   	  var row = $(this).parents('#row');
		 	  var musicId = row.children('span[name="musicId"]').text();
		 		if ($(this).attr("alt")=="true") {
		 			
		 			$.get('/roy/personalPage/memberTakeBackLike',{'musicId' : musicId,'username':'${user.member_username}'},function(data) {
		 				row.find('#likeCount').text(data);
		 			})
		 			this.src = "../img/indexHeart.png";
		 			$(this).parent('.heartTeam').children('#likeCount').attr("style","font-size:20px;margin:0;padding:0;color:#a4a4a4;");
		 			$(this).attr("alt","false");
		 			
		 		} else {
		 			
		 			$.get('/roy/personalPage/memberClickLike',{'musicId' : musicId,'username':'${user.member_username}'},function(data) {
		 				row.find('#likeCount').text(data);
		 			})
		 			this.src = "../img/indexClickHeart.png";
		 			$(this).parent('.heartTeam').children('#likeCount').attr("style","font-size:20px;margin:0;padding:0;color:red");
		 			$(this).attr("alt","true");
		 		}
		   }else{
		      	window.location.href = "/roy/login-signUp-upload/login.jsp";
		   }	
      })

      
      $('#likes').on('mouseover','.heart',function(){
    	if($(this).attr("alt")=="false"){
    	   this.src="../img/indexClickHeart.png";
    	   $(this).parent('.heartTeam').children('#likeCount').attr("style","font-size:20px;margin:0;padding:0;color:red");
    	}
      })
      
       $('#likes').on('mouseout','.heart',function(){
    	 
    	 if($(this).attr("alt")=="false"){
    	   this.src="../img/indexHeart.png";
    	   $(this).parent('.heartTeam').children('#likeCount').attr("style","font-size:20px;margin:0;padding:0;color:#a4a4a4;");
    	 }
      })
      
      
      //點音樂去音樂頁面
	$('#likes').on('click','#musicPage',function(){
		var row = $(this).parents('#row');
		var musicId = row.children('span[name="musicId"]').text();
		
		window.location.href = "/roy/musicPage/findMusicById?musicId="+musicId;
		
	})
	
	
})


function timeFn(d1) {//di作为一个变量传进来
		    //如果时间格式是正确的，那下面这一步转化时间格式就可以不用了
		    var dateBegin = new Date(d1.replace(/-/g, "/"));//将-转化为/，使用new Date
		    var dateEnd = new Date();//获取当前时间
		    var dateDiff = dateEnd.getTime() - dateBegin.getTime();//时间差的毫秒数
		    var dayDiff = Math.floor(dateDiff / (24 * 3600 * 1000));
		    //计算出相差天数
		    var leave1=dateDiff%(24*3600*1000)    //计算天数后剩余的毫秒数
		    var hours=Math.floor( leave1 /(3600*1000))
		    //计算出小时数
		    //计算相差分钟数
		    var leave2=leave1%(3600*1000)    //计算小时数后剩余的毫秒数
		    var minutes=Math.floor(leave2 /(60*1000))
		    //计算相差分钟数
		    //计算相差秒数
		    var leave3=leave2%(60*1000)      //计算分钟数后剩余的毫秒数
		    var seconds=Math.round(leave3/1000)
// 		    console.log(" 相差 "+dayDiff+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒");
		    var timediff ="";
		    if(dayDiff>1){
		    	timediff += dayDiff+"天前";
		    }else if(hours>1){
		    	timediff += hours+"小時前";
		    }else if(minutes>1){
		    	timediff += minutes+"分鐘前";
		    }else{
		    	timediff+="剛剛";
		    }
		    return timediff;
		}


function loadLikeMusic(username){
	$.getJSON('/roy/homePage/indexLikeMusic',{'username': username},function(data) {
		var content="";
		var number=1;
		var timediff ="";
		$.each(data,function(index, list) {
			
			if(list.memberCommentMusic_time){
				
				var timediff = timeFn(list.memberCommentMusic_time);
			}	
			if(number>1){
				var begin='<div class="item">'
			}else{
				var begin='<div class="item active">'
			}
			content+=begin+
	                      '<div class="col-md-12">'+
			                  '<div id="row" style="border-radius: 5px;align:center; height: 231px; margin-top: 30px; margin-bottom: 30px; background: linear-gradient(to right,#444444,#DDDDDD);">'+
			                      '<span name="musicId">'+list.music_id+'</span>'+
                                  '<div id="heartTeam" class="heartTeam" style="text-align:center">';
                                  if(list.memberLikeMusic=="/roy/img/indexClickHeart.png"){
                                	  var heart='<img class="heart" src="'+list.memberLikeMusic+'" style="width:45px;height:45px" alt="true" />'+
                                	            '<span id="likeCount" style="font-size:20px;margin:0;padding:0;color:red;" class="likeCount">'+list.music_likeCount+'</span>';
                                  }else{
                                	  var heart='<img class="heart" src="'+list.memberLikeMusic+'" style="width:45px;height:45px" alt="false" />'+
                                	            '<span id="likeCount" style="font-size:20px;margin:0;padding:0;color:#a4a4a4" class="likeCount">'+list.music_likeCount+'</span>';
                                  }
				    				content+=heart+
				                   '</div>'+
				                   '<div id="message'+list.music_id+'" style="border-radius:5px; width: 400px;height: 140px;margin-top: 74px;margin-right: 25px;float: right;background-color:#AAAAAA">'+
// 				                   ----------------------
				                   "<div style='margin-bottom:45px'>"+
				                  " <div style='margin-bottom:15px'>"+
				                   "<img src='"+list.member_profileImage+"' class='img-circle' style='width:50px;height:50px;float:left;margin-right:15px;margin-left:10px;margin-top:2px;'>"+
				                   "<h5 style='margin-bottom:0px;letter-spacing:0.5px;display:inline;vertical-align: middle;color:white;font-size:15px;margin-left:0px;'>"+list.member_nickname+"</h5>"+
				                   "<small style='vertical-align: middle;margin-left:9px;color:white;font-size:15px;margin-top:10px;'>"+timediff+"</small>"+
				                   "</div>"+
				                   "<div class='clearfix'></div>"+
				                   "<div style='margin-bottom:15px;color:white;margin-top:10px;font-size:16px;margin-left:13px;'>"+list.memberCommentMusic_content+"</div>"+
				                   "<br><br>"+
				                   "</div>"+
				                   '</div>'+
// 				                   -----------------
			    	               '<img src="'+list.music_Image+'" style="float: left; height: 200px; width: 200px;margin:16px 16px auto 20px;border-radius: 5px; border: solid 1px #DDDDDD;" />'+
			                       '<div style="padding-left:0px;padding-top:30px;color:white;float:left;width:150px;">'+
						               '<div id="musicPage" style="font-size:20px;width:200px;">'+list.music_name+'</div>'+
						               '<div><a id="yoyo" href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></div>'+
					                   '<img src="../img/indexPlayer.png" width="60px" height="60px" class="player"  music_Image="'+list.music_Image+'" class="music" music_name="'+list.music_name+'" '+
								        'music_id = "'+list.music_id+'" nickname="'+list.nickname+'" music_music="'+list.music_music+'" onclick="play(this)"/>'+
			                       '</div>'+       
                               '</div>'+                                   
                          '</div>'+
                        '</div>';
                        
                     number=number+1;
           })
           $('#likes').html(content);
		 
		$('span[name="musicId"]').hide();
	});
	
	for(var i=0;i<999999999;i++){}
	$.getJSON('/roy/homePage/indexLikeMusicComment',{'username': username},function(data) {
		$.each(data,function(index, obj) {
			console.log(obj);
			var id = "#message"+obj.music_id;
			var content = 
		     	"<div style='margin-bottom:45px'>"+
	           	"<div style='margin-bottom:15px'>"+
	            "<img src='"+obj.member_profileImage+"' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px'>"+
	            "<h5 style='margin-bottom:0px;margin-top:15px;letter-spacing:0.5px;display:inline;vertical-align: middle;'>"+obj.member_nickname+"</h5>"+
	            "<small style='vertical-align:middle;margin-top:15px;margin-left:15px'>"+timeFn(obj.memberCommentMusic_time)+"</small>"+
	            "</div>"+
	            "<div class='clearfix'></div>"+
	            "<div style='margin-bottom:15px'>"+obj.memberCommentMusic_content+"</div>"+
	            "<br><br></div>"+
	            '</div>';
	        $(id).html(content);
              
		})	
	});
	
	
}

	function timeFn(d1) {//di作为一个变量传进来
	    //如果时间格式是正确的，那下面这一步转化时间格式就可以不用了
	    var dateBegin = new Date(d1.replace(/-/g, "/"));//将-转化为/，使用new Date
	    var dateEnd = new Date();//获取当前时间
	    var dateDiff = dateEnd.getTime() - dateBegin.getTime();//时间差的毫秒数
	    var dayDiff = Math.floor(dateDiff / (24 * 3600 * 1000));
	    //计算出相差天数
	    var leave1=dateDiff%(24*3600*1000)    //计算天数后剩余的毫秒数
	    var hours=Math.floor( leave1 /(3600*1000))
	    //计算出小时数
	    //计算相差分钟数
	    var leave2=leave1%(3600*1000)    //计算小时数后剩余的毫秒数
	    var minutes=Math.floor(leave2 /(60*1000))
	    //计算相差分钟数
	    //计算相差秒数
	    var leave3=leave2%(60*1000)      //计算分钟数后剩余的毫秒数
	    var seconds=Math.round(leave3/1000)
	    console.log(" 相差 "+dayDiff+"天 "+hours+"小时 "+minutes+" 分钟"+seconds+" 秒");
	    var timediff = "";
	    if(dayDiff>1){
	    	timediff += dayDiff+"天前";
	    }else if(hours>1){
	    	timediff += hours+"小時前";
	    }else if(minutes>1){
	    	timediff += minutes+"分鐘前";
	    }else{
	    	timediff+="剛剛";
	    }
		return timediff;
	}
</script>
</head>
<body>
	<div id="body_bg">
	
		<jsp:include page="header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container" >
			<div class="row">
				<div class="row">
                     <!-- 大家都喜歡 - Default Full Width -->
                     <div style="width: 92%;margin: auto;">
                          <div style="font-family: 微軟正黑體;display: inline-block;width: 40%;float: left;font-size: 20px;font-weight: bold;margin-top:15px;">
                              
                              <p><img src="../img/earphone.png" width="20px;" style="margin-right:7px;"/> 大家都喜歡</p>
                          </div>         
                     </div>
                                            
<div class="col-md-12" style="margin-top: -30px">
     <div class="carousel slide testimonials" id="testimonials1">
        <div id="likes" class="carousel-inner">
			<div class="item active">
                <div class="col-md-12">       
                 </div>                                   
            </div>
            <div class="item">
                  <div class="col-md-12">                   
                  </div>
            </div>
            <div class="item">
                  <div class="col-md-12">
                  </div>
            </div>
       </div>
       <div style="width:40%;float:right;text-align: right;position: absolute;margin-left: 550px;margin-top:0px;">
			
                                 <a class='arrow' href="#testimonials1" data-slide="prev"  style="margin-right:15px;text-decoration:none;" >
                                   <i style="color:#666666;" class="fas fa-angle-double-left fa-2x"></i>
                                 </a>
                                 <a class='arrow' href="#testimonials1" data-slide="next">
                                     <i style="color:#666666;" class="fas fa-angle-double-right fa-2x" style="text-decoration:none;"></i>
                                 </a>
                          </div>
      			</div>                   
			</div>
                     <!-- End 大家都喜歡 - default full width -->
                 </div>
                 
              
			</div>
		</div>
		</div>
	
		<div class="container">
			<div class="row margin-vert-30">
				<!-- Main Text -->
				
				 <!-- 募資輪播 - Default Full Width -->
                     <div style="width: 92%;margin: auto;">
                          <div style="font-family: 微軟正黑體;display: inline-block;width: 40%;float: left;font-size: 20px;font-weight: bold;">
                              
                              <p> 熱門募資活動</p>
                          </div>
                          <div style="width:40%;float:right;text-align: right;position: absolute;margin-left: 140px;">
                                 <a  href="#testimonials2" data-slide="prev"  style="margin-right:10px;text-decoration:none;" >
                                   <i style="color:#666666;" class="fas fa-chevron-circle-left fa-2x"></i>
                                 </a>
                                 <a href="#testimonials2" data-slide="next">
                                     <i style="color:#666666;" class="fas fa-chevron-circle-right fa-2x" style="text-decoration:none;"></i>
                                 </a>
                          </div>
                     </div>
                         
                     
                     <div class="col-md-12" style="margin-top: -30px">
            <div class="carousel slide testimonials" id="testimonials2">

        <div class="carousel-inner" style="width:200px;">


			<div class="item active">
               <div class="col-md-12">
                    
                                                      
               </div>
            </div>                
                                 <div class="item">
                                     <div class="col-md-12">
                                     </div>
                                 </div>

                                 <div class="item">
                                     <div class="col-md-12">
   
                                         
                                     </div>
                                 </div>
                             </div>
                         </div>
                         
                     </div>
                     <!-- End 募資輪播 - default full width -->
				<!-- End Main Text -->
				<!-- Side Column -->
				<div  id="hottest" class="col-md-3" style="float: right">
					<h3 class="title">即時熱門排行</h3>

				</div>
				<!-- End Side Column -->
			</div>


			<div class="container">
				<div class="row">
					<div class="row"></div>
				</div>
			</div>


		</div>

	</div>
	<!-- === END CONTENT === -->

            
	<jsp:include page="footer.jsp" />
	<div id="player">
		<jsp:include page="player.jsp" />
	</div>






	
<script>
function rank(){
	window.location.href ="/roy/rank/rank.jsp";
}
// 找出所有時間總點閱率最高的五筆音樂
$(function () {            
	$.ajax({
        url: "/roy/homePage/indexFindAllTimePlayCountTop5Music.controller",   //存取Json的網址             
        type: "POST",
        cache:false,
        dataType:'json',
//         data:{user:$('#userName').text()},
		success : function(list){	
			list.forEach(function(obj, index) {
// 	這邊的username是nickname

// 				console.log(obj) ; 
				var content = "<h6 style='margin: 0;'><a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_username+"'><small>"+obj.member_username+"</small></a></h6>";
				var content1 = "<h5 style='margin: 0;'><a href='/roy/musicPage/findMusicById?musicId="+obj.music_id+"'>"+obj.music_name+"</a></h5>";
				var div=content1+content+"<hr>";

				$('#hottest').append(div);
		  	})
		  	var button = "<button type='button' class='btn btn-primary' style='width:100%' onclick='rank()' >看排行</button>";
			$('#hottest').append(button);
		},
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
     });
})
</script>





<!-- 播放器 -->
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
	<script>
	function play(e) {
				ap.list.add([{
					title : $(e).attr('music_name'),
					author : $(e).attr('nickname'),
					url : $(e).attr('music_music'),
					pic : $(e).attr('music_Image')
				}]);
				$(ap.audio).attr('music_id',$(e).attr('music_id'));
	}
	</script>
	<!-- 播放器 -->







</body>
</html>