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
						$('input[name="reward_amount"]')
								.bind(
										'input propertychange',
										function() {

											var title = $(
													'input[name="reward_amount"]')
													.val();
											$('#pre-amount').text(title);
											if (title == "") {
												$('#pre-amount').text("100");
											}

										})
						//預覽專案描述
						$('textarea[name="reward_description"]')
								.bind(
										'input propertychange',
										function() {

											var title = $(
													'textarea[name="reward_description"]')
													.val();
											$('#pre-content').text(title);
											if (title == "") {
												$('#pre-content').text(
														"例：單純贊助，不需回饋");
											}

										})
						//預覽寄送年
						$('select[name="reward_estimatedYear"]')
								.bind(
										'input propertychange',
										function() {

											var year = $(
													'select[name="reward_estimatedYear"]')
													.val();
											$('#estimated-year').text(year);
											if (title == "") {
												$('#estimated-year').text(
														"2019年");
											}

										})
						//預覽寄送月
						$('select[name="reward_estimatedMonth"]')
								.bind(
										'input propertychange',
										function() {

											var month = $(
													'select[name="reward_estimatedMonth"]')
													.val();
											$('#estimated-month').text(month);
											if (title == "") {
												$('#estimated-month')
														.text("1月");
											}

										})
						//點擊上一步不檢查編輯專案內容
						$('input[value="編輯專案內容"]').click(
								function() {
									$('textarea[name="reward_description"]')
											.removeAttr("required");
									$('input[name="imageFile"]').removeAttr(
											"required");
									$('input[value="編輯專案內容"]').submit();
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
			<form action="<c:url value="reward.controller" />" method="post"
				enctype="multipart/form-data">
				<div
					style="text-align: center; margin-bottom: 15px; margin-top: 15px;">
					<label class="top-title">回饋設定</label>
				</div>
				<div class="big">

					<div class="a">
						<p class="bluequote blue-pre">回饋卡預覽</p>
						<div class="project-pre">
							<div class="pcontent-pre"
								style="height: 40px; font-size: 2.5rem; margin-bottom: 0px;">
								<p id="pre-amount" class="title-content">100</p>
							</div>
							<div class="img-pres">
								<img class="img-in" id="preview_progressbarTW_img"
									style="border-radius: 0" src="/roy/img/default.jpg">
							</div>
							<div class="pcontent-pre"
								style="height: 135px; margin-bottom: 0px;">

								<p id="pre-content" class="excerpt"
									style="font-weight: bold; font-size: 0.85rem">單純贊助，不需回饋</p>
							</div>
							<div class="downMeta-pre estimated-font">
								<div style="width: 50%; display: inline-block;">
									<p class="locate">寄送地點</p>
									<p
										style="margin-bottom: 0px; font-size: 13px; letter-spacing: 0.5px;">只寄送台灣本島</p>
								</div>
								<div
									style="width: 50%; display: inline-block; float: right; text-align: right;">
									<p class="estimated">預計寄送時間</p>
									<span id="estimated-year"
										style="font-size: 13px; letter-spacing: 0.5px;">2019</span> /
									<span id="estimated-month"
										style="font-size: 13px; letter-spacing: 0.5px;">1</span>
								</div>

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
										style="font-weight: 400" name="reward_amount" type="number"
										min="100" value="100" step="100" class="form-control fc">
								</div>
								<label for="" class="input-label" style="float: left;">最低金額為
									$100。</label>
							</div>
						</div>
						<div class="c">
							<div class="create-description">
								<p class="bluequote">內容摘要</p>
								<!---->
								<div class="inputWordCount">

									<textarea style="font-weight: 400" class="form-control fc"
										oninput="title" onpropertychange="title"
										name="reward_description"  placeholder="單純贊助，不需回饋"
										maxlength="500" rows="11" required
										oninvalid="setCustomValidity('請輸入回饋描述');"
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
					<p class="bluequote">預計寄送時間</p>
					<select oninput="pickYear" onpropertychange="pickYear"
						name="reward_estimatedYear" class="form-control fc"
						style="width: 48%; display: inline;"><option value="2019"
							selected="selected">2019年</option>
						<option value="2020">2020年</option>
						<option value="2021">2021年</option>
						<option value="2022">2022年</option>
						<option value="2023">2023年</option>
						<option value="2024">2024年</option>
					</select> <select oninput="pickDay" onpropertychange="pickDay"
						name="reward_estimatedMonth" class="form-control fc"
						style="width: 48%; float: right;"><option value="1"
							selected="selected">1月</option>
						<option value="2">2月</option>
						<option value="3">3月</option>
						<option value="4">4月</option>
						<option value="5">5月</option>
						<option value="6">6月</option>
						<option value="7">7月</option>
						<option value="8">8月</option>
						<option value="9">9月</option>
						<option value="10">10月</option>
						<option value="11">11月</option>
						<option value="12">12月</option>

					</select> <label for="" class="input-label">此項回饋預計送達時程。</label>
				</div>
				<div class="create-reward">
					<input class="form-control next fc" type="submit" name="reward"
						value="編輯專案內容"> <input class="form-control next fc"
						type="submit" name="reward" value="新增一個回饋"> <input
						class="form-control next fc" type="submit" name="reward"
						value="提交專案">
				</div>
				<input style="display: none;" name="funding_id" type=text
					value="${fundingBean.funding_id}">
			</form>

		</div>
		
<!-- 	
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