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
<!-- Favicon -->
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="css/custom.css" rel="stylesheet">
<!-- JS -->
<script type="text/javascript" src="js/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="js/scripts.js"></script>
<!-- Isotope - Portfolio Sorting -->
<script type="text/javascript" src="js/jquery.isotope.js"
	type="text/javascript"></script>
<!-- Mobile Menu - Slicknav -->
<script type="text/javascript" src="js/jquery.slicknav.js"
	type="text/javascript"></script>
<!-- Animate on Scroll-->
<script type="text/javascript" src="js/jquery.visible.js"
	charset="utf-8"></script>
<!-- Sticky Div -->
<script type="text/javascript" src="js/jquery.sticky.js" charset="utf-8"></script>
<!-- Slimbox2-->
<script type="text/javascript" src="js/slimbox2.js" charset="utf-8"></script>
<!-- Modernizr -->
<script src="js/modernizr.custom.js" type="text/javascript"></script>
<!-- End JS -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$('#login').click(function() {
			window.location.href = "login.jsp";
		})
		$('#upload').click(function() {
			window.location.href = "upload.jsp";
		})
	})
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="header.html" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="row margin-vert-30">
					<!-- Begin Sidebar Menu -->
					<div class="col-md-3">
						<ul class="list-group sidebar-nav" id="sidebar-nav">
							<!-- Typography -->
							<li class="list-group-item"><a
								href="">Typography</a>
								
							<!-- End Typography -->
							<!-- Components -->
							<li class="list-group-item"><a href="">Components</a>
								</li>
							<!-- End Components -->
							<!-- Icons -->
							<li class="list-group-item"><a href="">Icons</a>
								</li>
							<!-- End Icons -->
							<!-- Testimonials -->
							<li class="list-group-item"><a
								href="features-testimonials.html">Testimonials</a></li>
							<!-- End Testimonials -->
							<!-- Accordion and Tabs -->
							<li class="list-group-item"><a
								href="features-accordions-tabs.html">Accordions & Tabs</a></li>
							<!-- End Accordion and Tabs -->
							<!-- Buttons -->
							<li class="list-group-item"><a href="features-buttons.html">Buttons</a>
							</li>
							<!-- End Buttons -->
							<!-- Carousels -->
							<li class="list-group-item"><a
								href="features-carousels.html">Carousels</a></li>
							<!-- End Accordion and Tabs -->
							<!-- Animate On Scroll -->
							<li class="list-group-item"><a
								href="features-animate-on-scroll.html">Animate On Scroll</a></li>
							<!-- End Animate On Scroll -->
							<!-- Grid System -->
							<li class="list-group-item"><a href="features-grid.html">Grid
									System</a></li>
							<!-- End Grid System -->
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- === END CONTENT === -->
		<jsp:include page="footer.html" />
</body>
</html>