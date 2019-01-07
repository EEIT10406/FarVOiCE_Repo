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
<script>
	$(document).ready(function() {

		$('#type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
		})
		$('#music_type li').click(function() {
			$(this).toggleClass('active');
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
		
		
		$('#allType').click(function() {
			$('#music_type-div').hide(350);
			$('#soChi').hide(350);
			$('#search-div').show(350);
		})
		$('#choseType').click(function() {
			$('#music_type-div').show(350);
			$('#soChi').show(350);
			$('#soChi').text("收起");
			$('#search-div').hide(350);
		})
	})
</script>
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
											<li class="active"><a class="dynamic" href="#">全部類型</a></li>
											<li><a class="dynamic" href="#">Rock</a></li>
											<li><a class="dynamic" href="#">Hip hop / Rap</a></li>
											<li><a class="dynamic" href="#">Electronic</a></li>
											<li><a class="dynamic" href="#">Pop</a></li>
											<li><a class="dynamic" href="#">Folk</a></li>
											<li><a class="dynamic" href="#">Singer / Songwriter</a></li>
											<li><a class="dynamic" href="#">Alternative</a></li>
											<li><a class="dynamic" href="#">Post rock</a></li>
											<li><a class="dynamic" href="#">Metal</a></li>
											<li><a class="dynamic" href="#">Punk</a></li>
											<li><a class="dynamic" href="#">Reggae / Funk</a></li>
											<li><a class="dynamic" href="#">R&amp;B / Soul</a></li>
											<li><a class="dynamic" href="#">Classical</a></li>
											<li><a class="dynamic" href="#">Blues</a></li>
											<li><a class="dynamic" href="#">Jazz</a></li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>排序</small></label>
									<div class="col-sm-11">
										<ul id="type" class="nav nav-pills nav-sm">
											<li class="active"><a href="#">最新上傳</a></li>
											<li><a href="#">最多播放</a></li>
											<li><a href="#">最多喜歡</a></li>
										</ul>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>期間</small></label>
									<div class="col-sm-11">
										<ul id="type" class="nav nav-pills nav-sm">
											<li class="active"><a href="#">不限時間</a></li>
											<li><a href="#">7 天內</a></li>
											<li><a href="#">30 天內</a></li>
											<li><a href="#">1 年內</a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
						<!--類型 -->
					</div>
					<form id="search-div" class="form-inline">
							<input class="form-control mr-sm-2" type="search"
								placeholder="搜尋" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">搜尋</button>
						</form>
						<script>
						$('#search-div').hide(0);
						</script>
				</div>
			</div>
		</div>
		<!--選單 -->
	</div>


	<!-- 歌單	 -->
	<div class="container">
		<div class="row margin-vert-30">


			<div class="col-md-3 col-sm-6 col-xs-6 m-bottom-8 item_box">


				<div class="work-block m-bottom-2">

					<a href="#"><img class="img-full"
						src="https://cfstatic.streetvoice.com/playlist_images/da/rk/darkbluew/zyjhmW5MGAhKpxtKPBBbSD.jpg?x-oss-process=image/resize,m_fill,h_260,w_260,limit_0/interlace,1/quality,q_85/format,jpg"></a>

				</div>
				<!-- /work-block -->

				<div class="song-info">
					<h4 class="text-ellipsis">
						<a href="#">他們的瘋狂幽默</a>
					</h4>
				</div>

			</div>


		</div>
	</div>
	<!-- 歌單	 -->


	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
</body>
</html>