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
<style>
/* * { */
/* 	font-family: 微軟正黑體; */
/* } */

.play {
	width: 40px;
	-webkit-filter: invert(100%);
	cursor: pointer;
}

.play2 {
	width: 40px;
	cursor: pointer;
}

.topTen {
	border: 0.5px solid gray;
	margin-left: 35px;
	margin-bottom: 10px;
	width: 140px;
	text-align: center;
	padding: 1px;
	font-size: 15px;
	font-weight: 400;
	background-color: #DDDDDD;
}
.music {
	width: 70px;
	height: 70px;
	cursor: pointer;
	margin-left: 10px;
}

</style>
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
<script type="text/javascript" src="../js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<!-- Isotope - Portfolio Sorting -->
<script type="text/javascript" src="../js/jquery.isotope.js"
	type="text/javascript"></script>
<!-- Mobile Menu - Slicknav -->
<script type="text/javascript" src="../js/jquery.slicknav.js"
	type="text/javascript"></script>
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
<!-- End JS -->

<script>
	$(document).ready(function() {
		$('body').on('mouseover','#playerPic',function(){
			 this.setAttribute("class","play2")
		})
		
		$('body').on('mouseout','#playerPic',function(){
			 this.setAttribute("class","play")
		})
	})


</script>
<script>
$(document).ready(function() {
	loadEmotion('抒情')
	loadAllType('')
    loadDynamic('動感')
    loadBlue('藍調')
    loadReggae('雷鬼')
    loadClassic('古典')
    loadRock('搖滾')
    loadImediate('time')
	
	//點音樂去音樂頁面
	$('body').on('click','#musicPage',function(){
		var row = $(this).parents('#rank')
		var musicId =row.find('span[name="music_id"]').text();
		window.location.href = "/roy/musicPage/findMusicById?musicId="+musicId;	
	})
	
	//滑鼠移入顯示播放圖片
	$('body').on('mouseover','.music',function(){
		 this.src = "../img/player.png";
	})
    //滑鼠移出重新載入圖片
	$('body').on('mouseout','.music',function(){
		var row = $(this).parents('#row');
        var musicId =row.find('td[name="music_id"]').text();
        loadEmotion('抒情')
        loadDynamic('動感')
        loadBlue('藍調')
        loadReggae('雷鬼')
        loadClassic('古典')
        loadRock('搖滾')
        loadAllType('')
        loadImediate('time')
	})
	
})

//載入抒情歌
function loadEmotion(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankEmotion.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#emotion').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>抒情</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入動感歌
function loadDynamic(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankDynamic.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#dynamic').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>動感</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入藍調歌
function loadBlue(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankBlue.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#blue').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>藍調</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入雷鬼歌
function loadReggae(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankReggae.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#reggae').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>雷鬼</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入古典歌
function loadClassic(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankClassic.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#classic').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>古典</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入搖滾歌
function loadRock(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankRock.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#rock').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>搖滾</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入所有類型
function loadAllType(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankAllType.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#allType').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>所有類型</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}

//載入即時熱門歌
function loadImediate(type) {
	$.getJSON('/roy/rankTop10/findMusicByType',{'type' : type},function(data) {
			var content="";
			var rank = 1;
			$.each(data,function(index, list) {
			    content+='<div id=rank>'+
				         '<h6 style="margin: 0;">'+rank+'<img src="'+list.music_Image+'" class="music" /></h6>'+
			             '<span name="music_id">'+list.music_id+'</span>'+
			             '<h4 id="musicPage" style="margin: 0;color:#FF3333;cursor: pointer;">'+list.music_name+'</h4>'+
			             '<p><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='+list.nickname+'">'+list.nickname+'</a></p>'+
			             '<hr>'+
			             '</div>';
				    rank=rank+1;
				    if(rank==4){
				    	return false;
				    }
				})
			var btn='<button type="button" class="topTen"><a href="../rankTop10/rankImediate.jsp">看本榜 TOP 10</a></button>'; 
			
				$('#imediate').html('<h3 class="title"><img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice 即時熱門</span></h3>'+content+btn);
				$('span[name="music_id"]').hide();
        })
}



</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container no-padding">
				<div class="row"></div>
			</div>
		</div>

		<div class="container">
			<div class="row margin-vert-30"
				style="margin: 20px auto; margin-left: 7px">
				<!-- Main Text -->
				
				<div class="col-md-3" id="imediate" style="border: 1px #AAAAAA solid; margin-left: 50px;margin-bottom:10px;">
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
				</div>


				<div class="col-md-3" id="allType"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
				</div>


				<div class="col-md-3" id="emotion"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
					</div>
					
				<div class="col-md-3" id="rock"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
					</div>
					
					<div class="col-md-3" id="reggae"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
					</div>
					
					<div class="col-md-3" id="blue"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
					</div>
					
					<div class="col-md-3" id="dynamic"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
				    </div>
				    
				    <div class="col-md-3" id="classic"
					style="border: 1px #AAAAAA solid; margin-left: 50px; margin-bottom:20px;">
					
					<h3 class="title">
						<img id="playerPic" src="../img/player.png" class="play" /><span>FarVoice
							即時熱門</span>
					</h3>
					
					
					<h6 style="margin: 0;">
						1<img src="../img/left.JPG" style="margin-left: 10px;" />
					</h6>
					<span name="musicId"></span>
					<h4 style="margin: 0;color:#FF3333;">讓我為你唱情歌</h4>
					<p>老蕭</p>
					<hr>		
					
					<button type="button" class="topTen">
						<a href="../rankTop10/rankTopTen.jsp">看本榜 TOP 10</a>
					</button>
					
				    </div>
				    
				<!-- End Main Text -->
			</div>
		</div>

	</div>
	<!-- === END CONTENT === -->

	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>

</body>
</html>