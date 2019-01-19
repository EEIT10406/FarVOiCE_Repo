<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>專案內容</title>

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
<script src="1.js?ver=1"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script> -->

<!-- End JS -->
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
<link rel="stylesheet" href="../css/funding.css" rel="stylesheet">



<script>
	// 設置日期max屬性
	function getMaxDay() {
		var date = $('#bookdate').attr('min')
		var dateTemp = date.split("-");
		var nDate = new Date(dateTemp[1] + '-' + dateTemp[2] + '-'
				+ dateTemp[0]); //轉換為MM-DD-YYYY格式
		var millSeconds = Math.abs(nDate) + (60 * 24 * 60 * 60 * 1000);
		var rDate = new Date(millSeconds);
		var year = rDate.getFullYear();
		var month = rDate.getMonth() + 1;
		if (month < 10)
			month = "0" + month;
		var date = rDate.getDate();
		if (date < 10)
			date = "0" + date;
		var qqq = (year + "-" + month + "-" + date);
		$('#bookdate').attr('max', year + '-' + month + '-' + date)

	}
	// 設置日期min屬性
	function getMinDay() {
		var date = $('#bookdate').attr('min')
		var dateTemp = date.split("-");
		var nDate = new Date(dateTemp[1] + '-' + dateTemp[2] + '-'
				+ dateTemp[0]); //轉換為MM-DD-YYYY格式
		var millSeconds = Math.abs(nDate) + (1 * 24 * 60 * 60 * 1000);
		var rDate = new Date(millSeconds);
		var year = rDate.getFullYear();
		var month = rDate.getMonth() + 1;
		if (month < 10)
			month = "0" + month;
		var date = rDate.getDate();
		if (date < 10)
			date = "0" + date;
		var qqq = (year + "-" + month + "-" + date);
		$('#bookdate').attr('min', year + '-' + month + '-' + date)

	}

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
																"/roy/img/gun.jpg")
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
						// 呼叫設置日期max屬性方法 
						getMinDay();
						getMaxDay();
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
											limitText();
											if (title == "") {
												$('#pre-content')
														.text(
																"例：簡短描述專案內容，吸引瀏覽者在 FarVoice 首頁上點擊你的專案。");
											}

										})
						//抓取選取日期計算到期天數
						$('input[name="funding_duration"]').on(
								'change',
								function() {
									var pickdate = $(
											'input[name="funding_duration"]')
											.val();
									var enddate = new Date(pickdate);
									var nowdate = new Date();

									var deadline = enddate.getTime()
											- nowdate.getTime();
									var days = parseInt(deadline
											/ (1000 * 60 * 60 * 24)) + 1;
									$('strong[class="days"]').text(days)
									if (isNaN(days)) {
										$('strong[class="days"]').text('0')
									}
								})

					})
	//超過50字以...表示
	function limitText() {

		var len = 70; // 超過50個字以"..."取代
		$(".JQellipsis").each(function(i) {
			if ($(this).text().length > len) {
				$(this).attr("title", $(this).text());
				var text = $(this).text().substring(0, len - 1) + "...";
				$(this).text(text);
			}
		});
	}
</script>

<style>
input[type=date]::-webkit-inner-spin-button {
	visibility: hidden;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	-webkit-appearance: button;
	/* 	background: #eee; */
	/* 	border-color: #ccc; */
	/* 	border-radius: 5px; */
}

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
		<div class="create-content" style="font-family: Microsoft JhengHei;">
			<form action="<c:url value="funding.controller" />" method="post"
				enctype="multipart/form-data">
				<div
					style="text-align: center; margin-bottom: 15px; margin-top: 15px;">
					<label class="top-title">專案內容</label>
				</div>
				<div class="big">
					<div class="a">
						<div class="b">
							<div class="create-title">
								<p class="bluequote">專案標題</p>
								<!---->
								<div class="inputWordCount">
									<input oninput="title" onpropertychange="title"
										style="font-weight: 400" name="funding_title" type="text"
										placeholder="30 個字以內的專案標題" maxlength="20"
										class="form-control fc" required
										oninvalid="setCustomValidity('請输入專案標題');"
										oninput="setCustomValidity('');">
								</div>
								<label for="" class="input-label">一個好的標題應該要好記、好搜尋、吸引人想點進去看，並讓瀏覽者能在最短的時間內瞭解專案的核心理念。</label>
							</div>
						</div>
						<div class="c">
							<div class="create-description">
								<p class="bluequote">專案描述</p>
								<!---->
								<div class="inputWordCount">

									<textarea style="font-weight: 400" class="form-control fc"
										oninput="title" onpropertychange="title"
										name="funding_description" placeholder="500個字以內的專案描述"
										maxlength="450" rows="11" required
										oninvalid="setCustomValidity('請輸入專案描述');"
										oninput="setCustomValidity('');"></textarea>
								</div>
								<label for="" class="input-label">使用吸引人的文字說明你的目標以及理念，強調你的獨一無二，讓贊助人對你或你的專案好奇，願意更進一步贊助專案。</label>
							</div>
						</div>
					</div>

					<div class="a">
						<p class="bluequote blue-pre">專案卡預覽</p>
						<div class="project-pre">
							<div class="img-pres">
								<img class="img-in" id="preview_progressbarTW_img"
									src="/roy/img/gun.jpg">
							</div>
							<div class="pcontent-pre">
								<p id="pre-title" class="title-content"
									style="margin-bottom: -18px">例：30 個字以內的專案標題</p>
								<p class="small creator">
								<p id="pre-name">${nickname}</p>

								<p id="pre-content" class="excerpt JQellipsis"
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

				</div>

				<div class="upload-image" style="margin: auto;">
					<p class="bluequote">專案封面</p>
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

				<div class="limit-date" style="margin: auto;">

					<p class="bluequote">選擇專案期限</p>
					<input onchange="enddate" class="form-control fc" type="date"
						id="bookdate" name="funding_duration"
						min=<%out.println(new java.sql.Date(new Date().getTime()));%>
						required oninvalid="setCustomValidity('請選擇專案期限');"
						oninput="setCustomValidity('');"> <label for=""
						class="input-label">募資天數為提案開始60天為限。</label>

				</div>



				<div class="create-goal" style="margin: auto;">
					<p class="bluequote">募資目標</p>
					<input type="number" style="font-weight: 400" name="funding_goal"
						min="5000" value="5000" step="1000" class="form-control fc">
					<!--------------------------------- -->
					<label for="" class="input-label">募資目標金額最低為 $5,000
						元。設定目標金額時，除了考量專案執行的成本支出外，也必須考慮回饋項目的成本，總體而言必須滿足「最低計畫可執行資金」的門檻，才是合理的募資目標。</label>
				</div>

				<div class="create-type" style="margin: auto;">
					<p class="bluequote">音樂類型</p>
					<select name="funding_styleName" class="form-control fc"><option
							value="null" disabled="disabled" selected="selected">選擇類型</option>
						<option value="爵士">爵士</option>
						<option value="藍調">藍調</option>
						<option value="雷鬼">雷鬼</option>
						<option value="經典">經典</option>
						<option value="R&B">R&B</option>
						<option value="搖滾">搖滾</option>
						<option value="Rap">Rap</option>
						<option value="重金屬">重金屬</option>
					</select>

				</div>

				<div class="create-city" style="margin: auto;">
					<p class="bluequote">提案所在城市</p>
					<select name="funding_city" class="form-control fc"><option
							value="null" disabled="disabled" selected="selected">選擇城市</option>
						<option value="台北市">台北市</option>
						<option value="新北市">新北市</option>
						<option value="桃園市">桃園市</option>
						<option value="台中市">台中市</option>
						<option value="台南市">台南市</option>
						<option value="高雄市">高雄市</option>
						<option value="基隆市">基隆市</option>
						<option value="新竹市">新竹市</option>
						<option value="嘉義市">嘉義市</option>
						<option value="新竹縣">新竹縣</option>
						<option value="苗栗縣">苗栗縣</option>
						<option value="彰化縣">彰化縣</option>
						<option value="南投縣">南投縣</option>
						<option value="雲林縣">雲林縣</option>
						<option value="嘉義縣">嘉義縣</option>
						<option value="屏東縣">屏東縣</option>
						<option value="宜蘭縣">宜蘭縣</option>
						<option value="花蓮縣">花蓮縣</option>
						<option value="台東縣">台東縣</option>
						<option value="澎湖縣">澎湖縣</option>
						<option value="金門縣">金門縣</option>
						<option value="連江縣">連江縣</option>
					</select>

				</div>

				<div class="chose-music" style="margin: auto;">
					<p class="bluequote">選擇募資音樂</p>
					<select name="music_id" class="form-control fc">
						<c:if test='${empty musicName }'>
							<option value="null" disabled="disabled" selected="selected">無音樂</option>
						</c:if>
						<c:if test='${ not empty musicName}'>
							<option value="null" disabled="disabled" selected="selected">選擇音樂</option>
							<c:forEach var='mName' items="${musicName}">
								<option value='${mName.music_id}'>${mName.music_name}</option>
							</c:forEach>
						</c:if>
					</select>
				</div>



				<div class="next-reward">
					<input class="form-control next fc" type="submit"
						name="start-project" value="回饋設定">

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