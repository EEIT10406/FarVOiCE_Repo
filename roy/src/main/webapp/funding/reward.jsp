<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>回饋設定</title>
<script type="text/javascript" src="../js/scripts.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<!-- Favicon -->
<link href="favicon.ico" rel="shortcut icon">
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="../css/custom.css" rel="stylesheet">
<link rel="stylesheet" href="../css/funding.css" rel="stylesheet">
<script>
	$(document)
			.ready(
					function() {
						// 檢測上傳圖片
						$(".a-upload")
								.on(
										"change",
										"input[type='file']",
										function() {
											var filePath = $(this).val();
											if (filePath.indexOf("jpg") != -1
													|| filePath.indexOf("png") != -1) {

												$("#spin")
														.attr("class",
																"fas fa-spinner fa-spin")
														.fadeOut(1500)
														.queue(
																function(n) {
																	$("#spin")
																			.attr(
																					"class",
																					"fas fa-check");
																	n();
																});

												$(".fileerrorTip").html("")
														.hide();
												var arr = filePath.split('\\');
												var fileName = arr[arr.length - 1];
												$(".showFileName").html(
														fileName);
											} else {
												$("#preview_progressbarTW_img")
														.attr("src",
																"/roy/img/default.jpg")
												$("#spin")
														.attr("class",
																"fas fa-cloud-upload-alt")
												$(".showFileName").html("");
												$(".fileerrorTip").html(
														"您未上傳圖片，或者您上傳圖片類型有誤！")
														.show();
												return false
											}
										})
						//預覽標題輸入框
						$('input[name="funding_title"]')
								.bind(
										'input propertychange',
										function() {

											var title = $(
													'input[name="funding_title"]')
													.val();
											$('#pre-title').text(title);
											if (title == "") {
												$('#pre-title').text(
														"例：30 個字以內的專案標題");
											}

										})
						//預覽專案描述
						$('textarea[name="funding_description"]')
								.bind(
										'input propertychange',
										function() {

											var title = $(
													'textarea[name="funding_description"]')
													.val();
											$('#pre-content').text(title);
											if (title == "") {
												$('#pre-content')
														.text(
																"例：簡短描述專案內容，吸引瀏覽者在 FarVoice 首頁上點擊你的專案。");
											}

										})

					})
</script>
<style>
.a {
	display: inline-block;
	height: 525px;
	width: 30%;
	vertical-align: middle;
}

.b {
	height: 30%;
}

.c {
	height: 65%;
}

.big {
	height: 525px;
	margin: auto;
	width: 100%;
	text-align: center;
}
</style>


</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="create-content">
			<form action="<c:url value="funding.controller" />" method="post"
				enctype="multipart/form-data">
				<div
					style="text-align: center; margin-bottom: 15px; margin-top: 15px;">
					<label class="top-title">回饋設定</label>
				</div>
				<div class="big">

					<div class="a">
						<p class="bluequote blue-pre">回饋卡預覽</p>
						<div class="project-pre">
							<div class="img-pres">
								<img class="img-in" id="preview_progressbarTW_img"
									src="/roy/img/default.jpg">
							</div>
							<div class="pcontent-pre">
								<p id="pre-title" class="title-content"
									style="margin-bottom: -18px">例：30 個字以內的專案標題</p>
								<p class="small creator">
								<p id="pre-name">${nickname}</p>

								<p id="pre-content" class="excerpt"
									style="font-weight: bold; font-size: 0.85rem">例：簡短描述專案內容，吸引瀏覽者在
									FarVoice 首頁上點擊你的專案。</p>
							</div>
							<div class="downMeta-pre">
								<progress class="progress-pre"
									style="margin-bottom: 0px; margin-top: 0px;" value="0"
									max="100"></progress>
								<span class="goalMoney osmfont">0</span>&nbsp; <span
									class="hidden-md goalpercent goal"> 0%</span> <span
									style="font-size: 13px; letter-spacing: 1px"
									class="date pull-right small"> 還剩 <strong class="days"
									style="font-size: 13px; font-weight: 1000; letter-spacing: 1px">0</strong><span
									style="font-size: 13px; letter-spacing: 1px"> 天</span>
								</span>

							</div>
						</div>

					</div>


					<div class="a">
						<div class="b">
							<div class="create-title">
								<p class="bluequote">回饋金額</p>
								<!---->
								<div class="inputWordCount">
									<input oninput="title" onpropertychange="title"
										style="font-weight: 400" name="funding_title" type="number"
										min="100" value="100" step="100"
										class="form-control fc" >
								</div>
								<label for="" class="input-label" style="text-align: left;">最低金額為 $100。</label>
							</div>
						</div>
						<div class="c">
							<div class="create-description">
								<p class="bluequote">內容摘要</p>
								<!---->
								<div class="inputWordCount">

									<textarea style="font-weight: 400" class="form-control fc"
										oninput="title" onpropertychange="title"
										name="funding_description" placeholder="500個字以內的專案描述"
										maxlength="500" rows="11" required
										oninvalid="setCustomValidity('請輸入專案描述');"
										oninput="setCustomValidity('');"></textarea>
								</div>
								<label for="" class="input-label">請在此描述這個回饋項目所包含的品項，您也可以為每一個回饋組合創造名稱以利推廣。</label>
							</div>
						</div>
					</div>



				</div>

				<div class="upload-image" style="margin: auto;">
					<p class="bluequote">回饋封面</p>
					<label for="" class="input-label-img">請提供 JPEG、PNG，圖片尺寸至少
						1024 x 768 px (4:3)； 2MB 以內。</label>
					<!------------------------------->

					<label for="file-upload" class="custom-file-upload"> <i
						id="spin" class="fas fa-cloud-upload-alt"></i> 上傳封面圖片
					</label>
					<!----------------------- -->
					<a href="javascript:;" class="a-upload"> <input
						onchange="readURL(this)" targetID="preview_progressbarTW_img"
						id="file-upload" type="file" accept="image/jpeg, image/png"
						name="imageFile" required
						oninvalid="setCustomValidity('請選擇上傳圖片');"
						oninput="setCustomValidity('');">
					</a>
					<!-- 					<i id='spin' class="fas fa-spinner fa-spin" style="display: none"></i> -->
					<p class="showFileName"></p>
					<p class="fileerrorTip"></p>

				</div>

				<div class="create-type" style="margin: auto;">
					<p  class="bluequote">預計寄送時間</p>
					<select name="reward_estimatedYear" class="form-control fc"
						style="width: 48%; display: inline;"><option
							value="2019年" selected="selected">2019年</option>
						<option value="2020年">2020年</option>
						<option value="2021年">2021年</option>
						<option value="2022年">2022年</option>
						<option value="2023年">2023年</option>
						<option value="2024年">2024年</option>
					</select> <select name="reward_estimatedMonth" class="form-control fc"
						style="width: 48%; float: right;"><option value="1月"
							selected="selected">1月</option>
						<option value="2月">2月</option>
						<option value="3月">3月</option>
						<option value="4月">4月</option>
						<option value="5月">5月</option>
						<option value="6月">6月</option>
						<option value="7月">7月</option>
						<option value="8月">8月</option>
						<option value="9月">9月</option>
						<option value="10月">10月</option>
						<option value="11月">11月</option>
						<option value="12月">12月</option>

					</select> 
					<label for="" class="input-label">此項回饋預計送達時程。</label>
				</div>

			</form>

		</div>
		<!-- 	=== END CONTENT === -->

		<jsp:include page="../homePage/footer.jsp" />
	</div>
</body>
<script>
<!--預覽圖片 -->
	function readURL(input) {

		if (input.files && input.files[0]) {

			var imageTagID = input.getAttribute("targetID");

			var reader = new FileReader();

			reader.onload = function(e) {

				var img = document.getElementById(imageTagID);

				img.setAttribute("src", e.target.result)

			}

			reader.readAsDataURL(input.files[0]);

		}

	}
</script>
</html>