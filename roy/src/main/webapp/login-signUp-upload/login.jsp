<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>FarVoice | 登錄帳號</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.min.js"  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
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
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="container">
					<div class="row margin-vert-30">
						<!-- Login Box -->
						<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
							<form class="login-page" action="/roy/login-signUp-upload/MemberLogin.controller" method="post">
								<div class="login-header margin-bottom-30">
									<h3>請輸入帳號與密碼</h3>
								</div>
								<div class="input-group margin-bottom-20">
									<span class="input-group-addon"> <i class="fa fa-user"></i>
									</span> <input placeholder="帳號" style="${CssError}" class="form-control" type="text" id="username" name="username" value="${param.username}">
									<span id="sp1" style='color:#880000;'>${errors.usernameError}</span>
								</div>
								<div class="input-group margin-bottom-20">
									<span class="input-group-addon"> <i class="fa fa-lock"></i>
									</span> <input placeholder="密碼" style="${CssError}" class="form-control" type="password" id="password" name="password" value="${param.password}">
									<span id="sp2" style='color:#880000;'>${errors.passwordError}</span>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label class="checkbox"> <input type="checkbox">記住密碼
										</label>
									</div>
									<div class="col-md-6">
										<button class="btn btn-primary pull-right" type="submit">登入</button>
									</div>
								</div>
								<hr>
								<h5>
									還沒註冊嗎 ?<a href="#" style="float: right;">忘記密碼</a>
								</h5>
								<a href="signUp.jsp">按這裡</a>註冊帳號

							</form>
						</div>
						<!-- End Login Box -->
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<script>
		document.addEventListener("DOMContentLoaded", function() {
			document.getElementById("username").addEventListener("blur",
					chkusername);
			document.getElementById("password").addEventListener("blur",
					chkPassword);
		});

		function chkusername() {
			var name = document.getElementById("username").value;
			
			if (name == "") {
				document.getElementById("sp1").innerHTML = "<span style='color:#880000;'>  這個欄位是必須的。</span>";				
					$("#username").css("border","1px #880000 solid");
			}
			else{
				document.getElementById("sp1").innerHTML = "<span style='color:#880000;'></span>";				
				$("#username").css("border","");
			}
		}
		
		function chkPassword() {
			var pass = document.getElementById("password").value;
			
			if (pass == "") {
				document.getElementById("sp2").innerHTML = "<span style='color:#880000;'>  此欄位是必須的。</span>";					
				$("#password").css("border","1px #880000 solid");
			}else{
				document.getElementById("sp2").innerHTML = "<span style='color:#880000;'></span>";					
				$("#password").css("border","");
			}
		}
	</script>
	
	<!-- === END CONTENT === -->
	
	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
	<jsp:include page="../homePage/player.jsp"/>
	</div>
</body>
</html>