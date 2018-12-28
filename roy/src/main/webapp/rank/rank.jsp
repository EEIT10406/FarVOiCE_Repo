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
<style>
* {
	font-family: 微軟正黑體;
}
.play { 
	width: 40px;
 	-webkit-filter:invert(100%);  
	
}
.play2 {
	width: 40px;
}
.topTen{
border:0.5px solid gray;margin-left:35px;margin-bottom:10px;width:140px;text-align:center;padding:1px;
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
<script type="text/javascript" src="../js/jquery.sticky.js" charset="utf-8"></script>
<!-- Slimbox2-->
<script type="text/javascript" src="../js/slimbox2.js" charset="utf-8"></script>
<!-- Modernizr -->
<script src="../js/modernizr.custom.js" type="text/javascript"></script>
<!-- End JS -->

<script>

	var plays;
	$(document).ready(function() {
		plays = document.querySelectorAll("img.play");
		for (i = 0; i < plays.length; i++) {
			plays[i].addEventListener("mouseover", mouseOver);
			plays[i].addEventListener("mouseout", mouseOut);
		}
	})

	function mouseOver() {
		var locate = this.id.charAt(9);
		plays[locate - 1].setAttribute("class", "play2");
	}

	function mouseOut() {
		var locate = this.id.charAt(9);
		plays[locate - 1].setAttribute("class", "play");
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
				<div class="col-md-3"
					style="border: 1px #AAAAAA solid; margin-left: 50px;">
					<h3 class="title">
						<img id="playerPic1" src="../img/player.png" class="play" /><span>即時熱門排行</span>
					</h3>
					<h6 style="margin: 0;">1<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					
					
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">2<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">3<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">4<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">CLOSED</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">5<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<button type="button" class="topTen"><a href="">看本榜 TOP 10</a></button>
				</div>


				<div class="col-md-3"
					style="border: 1px #AAAAAA solid; margin-left: 70px;">
					<h3 class="title">
						<img id="playerPic2" src="../img/player.png" class="play" /><span>所有類型排行</span>
					</h3>
					<h6 style="margin: 0;">1<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">2<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">3<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">4<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">CLOSED</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">5<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<button type="button" class="topTen"><a href="">看本榜 TOP 10</a></button>
				</div>


				<div class="col-md-3"
					style="border: 1px #AAAAAA solid; margin-left: 70px;">
					<h3 class="title">
						<img id="playerPic3" src="../img/player.png" class="play" /><span>即時熱門排行</span>
					</h3>
					<h6 style="margin: 0;">1<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">2<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">3<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">4<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">5<img src="../img/left.JPG" style="margin-left:10px;" /></h6>
					<h4 style="margin: 0;">CLOSED</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr> 
					<button type="button" class="topTen"><a href="">看本榜 TOP 10</a></button>
				
				</div>
				<!-- End Main Text -->
			</div>
		</div>
		
	</div>
	<!-- === END CONTENT === -->
	
	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
	<jsp:include page="../homePage/player.jsp"/>
	</div>
	
</body>
</html>