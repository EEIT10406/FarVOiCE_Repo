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
<link rel="stylesheet" href="../css/funding.css" rel="stylesheet">
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
		$(".a-upload").on(
				"change",
				"input[type='file']",
				function() {
					var filePath = $(this).val();
					if (filePath.indexOf("jpg") != -1
							|| filePath.indexOf("png") != -1) {
						alert("if")
						$(".fileerrorTip").html("").hide();
						var arr = filePath.split('\\');
						var fileName = arr[arr.length - 1];
						$(".showFileName").html(fileName);
					} else {
						alert("else")
						$(".showFileName").html("");
						$(".fileerrorTip").html("您未上傳圖片，或者您上傳圖片類型有誤！")
								.show();
						return false
					}
				}
		)
		var passError = $('#csrfmiddlewaretoken').val();
		if(passError){
			alert(passError);
		}
		var passSucc = $('#csr').val();
		if(passSucc){
			alert(passSucc);
		}
		var proSucc = $('#changeProSucc').val();
		if(proSucc){
			alert(proSucc);
		}
		$('#type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
		})
		$('#id_new_passconf').blur(function(){
			var pass1 = $('#id_new_password').val();
			var pass2 = $('#id_new_passconf').val();
			if(pass1){
				if(pass1!=pass2){
					alert("新密碼不一致喔")
				}
			}
		})
	})
</script>
<style>
#content {
	margin-top: 3%
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />

		<div id="content">
			<div class="container">
				<!--左選單 -->
				<div class="col-sm-3">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="#detail" data-toggle="tab">帳號資訊</a></li>
						<li><a href="#changePassword" data-toggle="tab"> 變更密碼 </a></li>
						<li><a href="#email" data-toggle="tab"> 電子郵件 </a></li>
					</ul>
				</div>
				<!-- end 左選單 -->
				<div class="col-sm-9">
					<div class="tab-content">

						<!--detail-->
						<div class="tab-pane fade in active" id="detail">
							<div class="bg-white p-30 min-height-500">
								<h3 >StreetVoice Account :  ${user.member_username}</h3>
									<form method="POST" action="/roy/personalPage/change_profile"
											enctype="multipart/form-data">
											<input type="hidden" id="changeProSucc"
												value="${changeProSucc}">
										<div class="upload-image">
											<p class="bluequote">上傳大頭貼</p>
											<label for="" class="input-label-img">請提供 JPEG、PNG，圖片尺寸至少
												1024 x 768 px (4:3)； 2MB 以內。</label>
											
											<a href="javascript:;" class="a-upload"> 
											<input type="file"
													accept="image/jpeg, image/png" name="member_profileImage" required
													oninvalid="setCustomValidity('請選擇上傳圖片');"
													oninput="setCustomValidity('');" >
												<i class="fa fa-camera"></i>上傳大頭貼
											</a>
											<p class="showFileName"></p>
											<p class="fileerrorTip"></p>
										</div>
											
										<button type="submit" class="btn btn-default m-top-4">儲存變更</button>
									</form>
							</div>
						</div>
						<!--detail-->

						<!-- changePassword -->
						<div class="tab-pane fade in" id="changePassword">
							<div class="bg-white p-30 min-height-500">
								<h3 class="m-bottom-4">變更密碼</h3>
								<p></p>
								<div class="row">
									<div class="col-md-5">
										<form method="POST" action="/roy/personalPage/change_password"
											data-pjax="">
											<input type="hidden" id="csrfmiddlewaretoken"
												value="${errors.passError}">
											<input type="hidden" id="csr"
												value="${changePassSucc}">
											<div class="form-group">
												<div class="form-group">
													<label class="control-label" for="id_old_password">舊密碼</label><input
														class="form-control" id="id_old_password"
														name="old_password" placeholder="" required="required"
														title="" type="password">
												</div>
											</div>
											<hr>
											<div class="form-group">
												<div class="form-group">
													<label class="control-label" for="id_new_password">新密碼</label><input
														class="form-control" id="id_new_password"
														name="new_password" placeholder="長度須介於 6 ~ 28 個字元"
														required="required" title="" type="password">
												</div>
											</div>
											<div class="form-group">
												<div class="form-group">
													<label class="control-label" for="id_new_passconf">再輸入一次</label><input
														class="form-control" id="id_new_passconf"
														name="new_passconf" placeholder="長度須介於 6 ~ 28 個字元"
														required="required" title="" type="password">
												</div>
											</div>
											<button type="submit" class="btn btn-default m-top-4">儲存變更</button><span> </span>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- changePassword -->


						<!-- email -->
						<div class="tab-pane fade in" id="email">

							<div class="bg-white p-30 min-height-500">
								<h3 class="m-bottom-4">電子郵件</h3>
								<p></p>
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label>電子郵件地址</label>
											<p class="form-control-static">


											${user.member_email} <span class="label label-success m-left-1">已驗證個頭</span>
 

											</p>

										</div>
										<!-- /form-group -->
										<form action="/roy/personalPage/change_email" method="POST"
											data-pjax="">
											<input type="hidden" name="csrfmiddlewaretoken"
												value="9Dnww9nygayHsw89cFNOjwXLSmZx2zlx">
											<div class="form-group">
												<label class="control-label" for="id_email">新的電子郵件地址</label><input
													class="form-control" id="id_email" name="email"
													placeholder="" required="required" title="" type="text">
											</div>
											<div class="form-group">
												<label class="control-label" for="id_emailconf">再輸入一次</label><input
													class="form-control" id="id_emailconf" name="emailconf"
													placeholder="" required="required" title="" type="text">
											</div>
											<button type="submit" class="btn btn-default m-top-4">儲存變更</button>
										</form>
									</div>
									<!-- /col-md-5 -->
								</div>
								<!-- /row -->
							</div>

						</div>
						<!-- email -->

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../homePage/footer.jsp" />
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
<!-- 	</div> -->
</body>
</html>