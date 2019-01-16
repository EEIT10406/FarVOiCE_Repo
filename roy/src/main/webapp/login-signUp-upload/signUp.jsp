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

<script>
	$(document).ready(function() {
		$('#login').click(function() {
			window.location.href = "login.jsp";
		})
		$('#upload').click(function() {
			window.location.href = "upload.jsp";
		})
		//檢查密碼醫治
		$('#member_passwordConfirm').blur(function(){
			var pass1 = $('#member_password').val();
			var pass2 = $('#member_passwordConfirm').val();
			if(pass1){
				if(pass1!=pass2){
					alert("密碼不一致喔")
				}
			}
 
		})
		//檢查帳好重複
		$('#member_username').blur(function(){
		      $.ajax({
	              url: "/roy/login-signUp-upload/accountCheck.controller",   //存取Json的網址             
	              type: "POST",
	              cache:false,
	              dataType:'json',
	              data:{user:$('#member_username').val()},
	              //contentType: "application/json",              
					success : function(data)
					 {   
						if(data.existOrNot == 'true'){
							$('#accountRepeat').text("帳號已存在!");
						}else{
							$('#accountRepeat').text("");
						}
					 },
	              error: function (xhr, ajaxOptions, thrownError) {
	                  alert(xhr.status);
	                  alert(thrownError);
	              }
	          });
 	
		})
		//檢查nickname重複
		$('#member_nickname').blur(function(){
		      $.ajax({
	              url: "/roy/login-signUp-upload/nicknameCheck.controller",   //存取Json的網址             
	              type: "POST",
	              cache:false,
	              dataType:'json',
	              data:{nickname:$('#member_nickname').val()},
	              //contentType: "application/json",              
					success : function(data)
					 {   
						if(data.existOrNot == 'true'){
							$('#nicknameRepeat').text("暱稱已存在!");
						}else{
							$('#nicknameRepeat').text("");
						}
					 },
	              error: function (xhr, ajaxOptions, thrownError) {
	                  alert(xhr.status);
	                  alert(thrownError);
	              }
	          });
 	
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
					<!-- Register Box -->
					<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
						<form class="signup-page" action="/roy/login-signUp-upload/MemberSignUP.controller" method="post">
							<div class="login-header margin-bottom-30">
								<h3>註冊 FarVoice ID</h3>
							</div>
							<label>帳號</label> <span id="accountRepeat" style='color:#880000;margin-left:20px'></span>
								<input class="form-control margin-bottom-20"type="text" id="member_username" name="member_username"value="${param.member_username}">
							<div class="row">
								<div class="col-sm-6">
									<label>密碼</label> <input class="form-control margin-bottom-20" type="password" id="member_password" name="member_password" value="${param.member_password}">
								</div>
								<div class="col-sm-6">
									<label>密碼確認</label> <input
										class="form-control margin-bottom-20" type="password" id="member_passwordConfirm" name="member_passwordConfirm" value="${param.member_passwordConfirm}">
								</div>
							</div>
							<label>電子郵件</label> 
								<input class="form-control margin-bottom-20" type="text" id="member_email" name="member_email" value="${param.member_email}"> 
							<label>暱稱</label> <span id="nicknameRepeat" style='color:#880000;margin-left:20px'></span>
								<input class="form-control margin-bottom-20" type="text" id="member_nickname" name="member_nickname" value="${param.member_nickname}">
							<hr>
							<div class="row">
<!-- 								<div class="col-lg-8"></div> -->
								<div class="col-lg-12 text-center" style='color:#880000;'>
								${errors.signUpError}
<%-- 									<span id="sp1" style='color:#880000;'>${errors.signUpError}</span> --%>
								</div>
								<div class="col-lg-12 text-center">
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

	<!-- === END CONTENT === -->
	
	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
	<jsp:include page="../homePage/player.jsp"/>
	</div>
</body>
</html>