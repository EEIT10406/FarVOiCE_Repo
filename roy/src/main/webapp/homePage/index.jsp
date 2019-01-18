<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
/* .clickHeart{ */
/* width:22px; */
/* margin-right:3px; */
/* cursor: pointer; */
/* } */
.heartTeam{
float:right;width:50px;margin-top:25px;margin-right:50px;
}

</style>
<script>
$(document).ready(function(){
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

function loadLikeMusic(username){
	$.getJSON('/roy/homePage/indexLikeMusic',{'username': username},function(data) {
		var content="";
		var number=1;
		$.each(data,function(index, list) {
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
				                   '<div id="message" style="border-radius:5px; width: 400px;height: 140px;margin-top: 74px;margin-right: 25px;float: right;background-color:#AAAAAA">'+
				                   '</div>'+
			    	               '<img src="'+list.music_Image+'" style="float: left; height: 200px; width: 200px;margin:16px 16px auto 20px;border-radius: 5px; border: solid 1px #DDDDDD;" />'+
			                       '<div style="padding-left:0px;padding-top:30px;color:white;float:left;width:150px;">'+
						               '<div id="musicPage" style="font-size:20px;width:200px;">'+list.music_name+'</div>'+
						               '<div><a id="yoyo" href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></div>'+
					                   '<img src="../img/indexPlayer.png" width="60px" height="60px" class="player"/>'+
			                       '</div>'+       
                               '</div>'+                                   
                          '</div>'+
                        '</div>';
                     number=number+1;
           })
           $('#likes').html(content);
		 
		$('span[name="musicId"]').hide();
	})
	
	
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
                                 <a  href="#testimonials1" data-slide="prev"  style="margin-right:15px;text-decoration:none;" >
                                   <i style="color:#666666;" class="fas fa-angle-double-left fa-2x"></i>
                                 </a>
                                 <a href="#testimonials1" data-slide="next">
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
                    
<!-- 				 <div style="border-radius: 5px;align:center; height: 200px; margin-top: 30px; margin-bottom: 30px; background: linear-gradient(to right,#444444,#DDDDDD);width:800px;">                          -->
<!--                  </div>     -->
                                                      
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
<!-- 					<h6 style="margin: 0;">Mon - Wed</h6> -->
<!-- 					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4> -->
<!-- 					<p> -->
<!-- 						<small>* Lorem ipsum dolor sit amet</small> -->
<!-- 					</p> -->
<!-- 					<hr> -->
<!-- 					<button type="button" class="btn btn-primary" style="width:100%" onclick="window.location.href ='/roy/rank/rank.jsp'">媽的看排行喔</button> -->
				</div>
				<!-- End Side Column -->
			</div>
			
			
				<div class="container" >
			<div class="row">
				<div class="row">
                    
                 </div>
                 
              
			</div>
		</div>
		
		
		</div>

	</div>
	<!-- === END CONTENT === -->

            
	<jsp:include page="footer.jsp" />
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="player.jsp" /> --%>
<!-- 	</div> -->






	
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
        data:{user:$('#userName').text()},
		success : function(list){	
			list.forEach(function(obj, index) {
// 	這邊的username是nickname
				console.log(obj) ; 
				var a = "<a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_username+"'>"+obj.member_username+"</a>";
				var content = "<h6 style='margin: 0;'><a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_username+"'>"+obj.member_username+"</a></h6>";
				var content1 = "<h4 style='margin: 0;'>"+obj.music_name+"</h4><hr>";
				var div=content+content1;
				$('#hottest').append(div);
		  	})
		  	var button = "<button type='button' class='btn btn-primary' style='width:100%' onclick='rank()' >媽的看排行喔</button>";
			$('#hottest').append(button);
		},
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
     });
})
</script>













</body>
</html>