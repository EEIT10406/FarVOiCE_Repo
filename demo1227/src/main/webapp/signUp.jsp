<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>Enlighten - Professional Bootstrap Template</title>
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
<link rel="stylesheet" href="css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="css/custom.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.min.js"></script>
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
					<!-- Register Box -->
					<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
						<form class="signup-page">
							<div class="login-header margin-bottom-30">
								<h3>註冊 FarVoice ID</h3>
							</div>
							<label>名字</label> <input class="form-control margin-bottom-20"
								type="text"> <label>電子郵件</label> <input
								class="form-control margin-bottom-20" type="text"> <label>帳號</label>
							<input class="form-control margin-bottom-20" type="text">
							<div class="row">
								<div class="col-sm-6">
									<label>密碼</label> <input class="form-control margin-bottom-20"
										type="password">
								</div>
								<div class="col-sm-6">
									<label>密碼確認</label> <input
										class="form-control margin-bottom-20" type="password">
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-lg-8"></div>
								<div class="col-lg-4 text-right">
									<button class="btn btn-primary" type="submit">註冊</button>
								</div>
							</div>
						</form>
					</div>
					<!-- End Register Box -->
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- === END CONTENT === -->
	<jsp:include page="footer.html" />
</body>
</html>