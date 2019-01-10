<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>FarVoice</title>
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
<!-- End JS -->
<style>
.reportButton {
	position: absolute;
	bottom: 15%;
	right: 15%;
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!--選單 -->
		<div id="content">
			<div class="container">
				<div class="container">
					<div class="row margin-vert-30">
						<ul id="type" class="nav nav-tabs m-bottom-6">
							<li id="choseType" class="active"><a href="#">音樂類型</a></li>
							<li id="allType"><a href="#">所有音樂</a></li>
							<a id="soChi" aria-controls="collapse-filter"
								aria-expanded="false"
								class="pull-right m-top-1 js-collapse-filter"
								data-toggle="collapse" href="#collapse-filter">收起</a>
						</ul>
						<!--類型 -->
						<div id="music_type-div" class="collapse in" id="collapse-filter">
							<form class="form-horizontal p-bottom-4">
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>類型</small></label>
									<div class="col-sm-11">
										<ul id="music_type" class="nav nav-pills nav-sm">
											<li type="'Rock'"><a class="dynamic" href="#">Rock</a></li>
											<li type="'Metal'"><a class="dynamic" href="#">Metal</a></li>
											<li type="'Jazz'"><a class="dynamic" href="#">Jazz</a></li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>排序</small></label>
									<div class="col-sm-11">
										<ul id="sort-type" class="nav nav-pills nav-sm">
											<li class="active"><a href="#">最新上傳</a></li>
											<li><a href="#">最多播放</a></li>
											<li><a href="#">最多喜歡</a></li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>期間</small></label>
									<div class="col-sm-11">
										<ul id="time-type" class="nav nav-pills nav-sm">
											<li before='' class="active"><a href="#">不限時間</a></li>
											<li before='7'><a href="#">7 天內</a></li>
											<li before='30'><a href="#">30 天內</a></li>
											<li before='365'><a href="#">1 年內</a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
						<!--類型 -->
					</div>
					<!--搜尋 -->
					<div id="search-div" class="form-inline">
						<input class="form-control mr-sm-2" type="search" placeholder="搜尋"
							aria-label="Search">
						<button class="btn btn-outline-success">搜尋</button>
					</div>
					<script>
						$('#search-div').hide(0);
					</script>
					<!--搜尋 -->
				</div>
	<button onclick="report()" value="檢舉" >檢舉</button>
			</div>
		</div>
		<!--選單 -->
	</div>


	<!-- 歌	 -->
	<div class="container">
		<div id='music-container' class="row margin-vert-30"></div>
	</div>
	<!-- 歌	 -->


	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
	
	<script>
	$(document).ready(function() {
		var type = '';
		var before = '';
		loadMusic("","","");
		
		// 		上面標籤
		$('#allType').click(function() {
			$('#choseType').removeClass("active");
			$(this).addClass("active");
			$('#music_type-div').hide(300);
			$('#soChi').hide(300);
			$('#search-div').show(300);
		})
		$('#choseType').click(function() {
			$('#allType').removeClass("active");
			$(this).addClass("active");
			$('#music_type-div').show(300);
			$('#soChi').show(300);
			$('#soChi').text("收起");
			$('#search-div').hide(300);
		})
		// 		上面標籤

		// 		選單
		$('#music_type li').click(function() {
			$(this).toggleClass('active');
			type = $("#music_type li.active").map(function(){return $(this).attr("type");}).get();
			loadMusic(''+type,"",''+before);
		})
		$('#time-type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
			before = $(this).attr('before')
			loadMusic(''+type,"",''+before);
		})
		$('#sort-type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
		})
		$('#soChi').click(function() {
			if ($(this).text() == "收起") {
				$('#music_type-div').hide(500);
				$(this).text("展開");
			} else {
				$('#music_type-div').show(500);
				$(this).text("收起");
			}
		})
		// 		選單

		// 		搜尋
		$('#search-div button').click(function(){
			var searchString = $('#search-div input').val();
			type = '';
			before = '';
			loadMusic("",searchString,"");
			    })
		// 		搜尋
		
			  //載音樂
				function loadMusic(type,searchString,before){
					$('#music-container').html("");
					$.getJSON('report.searchMusic',{'type':type,'searchString':searchString,'before':before},function(data){
					var docFrag = $(document.createDocumentFragment());
				    $.each(data,function(index,music){
				    		var row = $("<div></div>").html(
				    				'<div class="col-md-3 col-sm-6 col-xs-6 m-bottom-8 item_box">'+
				    				'<div class="work-block m-bottom-2"><a href="#">'+
				    				'<img class="img-full"src="https://cfstatic.streetvoice.com/playlist_images/da/rk/darkbluew/zyjhmW5MGAhKpxtKPBBbSD.jpg?x-oss-process=image/resize,m_fill,h_260,w_260,limit_0/interlace,1/quality,q_85/format,jpg">'+
				    				'</a><input class="reportButton" type="image" src="../img/檢舉.png"height="50" width="50" music_id="'+music.Music_id+'" member_username="'+music.Member_username+'">'+
				    				'</div>	<div class="song-info"><h4 class="text-ellipsis">'+
				    				'<a href="#">'+music.Music_name+'</a></h4></div></div>');
				    		docFrag.append(row);
				    	});
				    $('#music-container').html(docFrag);
				    })
				}
				//載音樂
				
	})
	
	function report(){
// 		檢舉
		$('.reportButton').hover(function() {
			src = $(this).attr("src");
			$(this).attr("src", "../img/檢舉 2.png");
		}, function() {
			$(this).attr("src", src);
		})
		$('.reportButton').click(function() {
			$.get("report.create", {'music_id':$(this).attr('music_id'),'member_username':$(this).attr('member_username')}, function(message) {
				alert(message);
			})
		})
		
		<%if (session.getAttribute("user") == null) {%>
		$('.reportButton').hide(0);
		<%}%>
		//	檢舉
		}
	
</script>
	
</body>
</html>