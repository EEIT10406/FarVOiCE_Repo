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
<script type="text/javascript">	
function IsEmail(email) {
    var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!regex.test(email)) {
        return false;
    }else{
        return true;
    }
}
	$(document).ready(function() {
		$('#email').blur(function() {
			if(!IsEmail($('#email').val())){
				console.log('wrong')
				$('#emailCheck').html("信箱格式錯誤!");
			}else{
				console.log('good')
				$('#emailCheck').html("");
			}

		})
	})
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="row margin-vert-30">
					<!-- Main Column -->
					<div class="col-md-9">
						<!-- Main Content -->
						<div class="headline">
							<h2>聯絡我們</h2>
							<br>
						</div>
						<!-- Contact Form -->
						<form action="/roy/contact/new" method="get">
							<label>電子郵件</label><span id="emailCheck" style='color:#880000;margin-left:20px'></span>
							<div class="row margin-bottom-20">
								<div class="col-md-6 col-md-offset-0">
									<input class="form-control" type="text" name="email" required id="email">
								</div>
							</div>
							<label>標題<span class="color-red"></span>
							</label>
							<div class="row margin-bottom-20">
								<div class="col-md-6 col-md-offset-0">
									<input class="form-control" type="text" name="title" required>
								</div>
							</div>
							<label>留言</label>
							<div class="row margin-bottom-20">
								<div class="col-md-8 col-md-offset-0">
									<textarea rows="8" class="form-control" name="content" required></textarea>
								</div>
							</div>
							<p>
								<button type="submit" class="btn btn-primary">送出</button>
							</p>
						</form>
						<!-- End Contact Form -->
						<!-- End Main Content -->
					</div>
					<!-- End Main Column -->

				</div>
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