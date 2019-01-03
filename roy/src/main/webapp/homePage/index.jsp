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
<!-- End JS -->
</head>
<body>
	<div id="body_bg">
		<jsp:include page="header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container no-padding">
				<div class="row"></div>
				<!-- Carousel Slideshow -->
				<div id="carousel-example" class="carousel slide"
					data-ride="carousel">
					<!-- Carousel Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example" data-slide-to="1"></li>
						<li data-target="#carousel-example" data-slide-to="2"></li>
					</ol>
					<div class="clearfix"></div>
					<!-- End Carousel Indicators -->
					<!-- 					Carousel Images -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="../img/slideshow/slide1.jpg">
						</div>
						<div class="item">
							<img src="../img/slideshow/slide2.jpg">
						</div>
						<div class="item">
							<img src="../img/slideshow/slide3.jpg">
						</div>
						<div class="item">
							<img src="../img/slideshow/slide4.jpg">
						</div>
					</div>
					<!-- End Carousel Images -->
					<!-- Carousel Controls -->
					<a class="left carousel-control" href="#carousel-example"
						data-slide="prev"> <img src="../img/left.JPG" />
					</a> <a class="right carousel-control" href="#carousel-example"
						data-slide="next"> <img src="../img/right.JPG" />
					</a>

					<!-- End Carousel Controls -->
				</div>
				<!-- End Carousel Slideshow -->
			</div>
		</div>
		<div class="container background-gray-lighter">
			<div class="row">
				<h2 class="animate fadeIn text-center margin-top-50">大家都在聽</h2>
				<hr class="margin-top-15">
				<p class="animate fadeIn text-center">
					Enlighten offers you the canvas to turn your imagination in to a
					reality <br>giving you the perfect framework for your project!
				</p>
				<p class="text-center animate fadeInUp margin-bottom-50">
					<button type="button" class="btn btn-lg btn-primary">View
						Details</button>
				</p>
			</div>
		</div>
		<div class="container">
			<div class="row margin-vert-30">
				<!-- Main Text -->
				<div class="col-md-9" style="float: left; width: 380px;">
					<h2>本日精選</h2>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud
						exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
						commodo consequat.</p>
					<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
						velit esse molestie consequat, vel illum dolore eu feugiat nulla
						facilisis at vero eros et accumsan et iusto odio dignissim qui
						blandit praesent luptatum zzril delenit augue duis dolore te
						feugait nulla facilisi. Cras non sem sem, at eleifend mi. Nam
						liber tempor cum soluta nobis eleifend option congue nihil
						imperdiet doming id quod mazim placerat facer possim assum.
						Curabitur eget nisl a risus.</p>
					<img class="visible-lg animate fadeInUp"
						style="bottom: -50px; position: relative; left: 85px; margin-top: -20px;"
						src="img/frontpage/responsive_homepage.png" alt="">
				</div>
				<div class="col-md-9" style="float: left; width: 380px;">
					<h2>熱門募資活動</h2>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud
						exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
						commodo consequat.</p>
					<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
						velit esse molestie consequat, vel illum dolore eu feugiat nulla
						facilisis at vero eros et accumsan et iusto odio dignissim qui
						blandit praesent luptatum zzril delenit augue duis dolore te
						feugait nulla facilisi. Cras non sem sem, at eleifend mi. Nam
						liber tempor cum soluta nobis eleifend option congue nihil
						imperdiet doming id quod mazim placerat facer possim assum.
						Curabitur eget nisl a risus.</p>
					<img class="visible-lg animate fadeInUp"
						style="bottom: -50px; position: relative; left: 85px; margin-top: -20px;"
						src="img/frontpage/responsive_homepage.png" alt="">
				</div>
				<!-- End Main Text -->
				<!-- Side Column -->
				<div class="col-md-3" style="float: right">
					<h3 class="title">即時熱門排行</h3>
					<h6 style="margin: 0;">Mon - Wed</h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">Thursday</h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">Fri-Sat</h6>
					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
					<h6 style="margin: 0;">Suday</h6>
					<h4 style="margin: 0;">CLOSED</h4>
					<p>
						<small>* Lorem ipsum dolor sit amet</small>
					</p>
					<hr>
				</div>
				<!-- End Side Column -->
			</div>
		</div>

	</div>
	<!-- === END CONTENT === -->
	<jsp:include page="footer.jsp" />
	<div id="player">
		<jsp:include page="player.jsp" />
	</div>

</body>
</html>