<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>專案內容</title>
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
	// 設置日期max屬性
	function getNewDay() {
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

	$(document).ready(
			function() {

				$(".a-upload").on(
						"change",
						"input[type='file']",
						function() {
							var filePath = $(this).val();
							if (filePath.indexOf("jpg") != -1
									|| filePath.indexOf("png") != -1) {
								$(".fileerrorTip").html("").hide();
								var arr = filePath.split('\\');
								var fileName = arr[arr.length - 1];
								$(".showFileName").html(fileName);
							} else {
								$(".showFileName").html("");
								$(".fileerrorTip").html("您未上傳圖片，或者您上傳圖片類型有誤！")
										.show();
								return false
							}
						})
				// 呼叫設置日期max屬性方法 
				getNewDay();

				// 				
			})
</script>

<style>
input[type=date]::-webkit-inner-spin-button {
	visibility: hidden;
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="create-content">
			<form action="<c:url value="funding.controller" />" method="post">


				<div class="create-title">
					<p class="bluequote">專案標題</p>
					<!---->
					<div class="inputWordCount">
						<input style="font-weight: 400" name="funding_title" type="text"
							placeholder="40 個字以內的專案標題" maxlength="40" class="form-control"
							required oninvalid="setCustomValidity('请输入專案標題');"
							oninput="setCustomValidity('');">
					</div>
					<label for="" class="input-label">一個好的標題應該要好記、好搜尋、吸引人想點進去看，並讓瀏覽者能在最短的時間內瞭解專案的核心理念。</label>
				</div>

				<div class="create-description">
					<p class="bluequote">專案描述</p>
					<!---->
					<div class="inputWordCount">

						<textarea style="font-weight: 400" class="form-control"
							name="funding_description" placeholder="500個字以內的專案描述"
							maxlength="500" rows="10" required
							oninvalid="setCustomValidity('请输入專案描述');"
							oninput="setCustomValidity('');"></textarea>
					</div>
					<label for="" class="input-label">使用吸引人的文字說明你的目標以及理念，強調你的獨一無二，讓贊助人對你或你的專案好奇，願意更進一步贊助專案。</label>
				</div>

				<div class="upload-image">
					<p class="bluequote">上傳專案圖片</p>
					<label for="" class="input-label-img">請提供 JPEG、PNG，圖片尺寸至少
						1024 x 768 px (4:3)； 2MB 以內。</label>
					<!------------------------------->
					<a href="javascript:;" class="a-upload"> <input type="file"
						accept="image/jpeg, image/png" name="funding_image" required
						oninvalid="setCustomValidity('请選擇上傳圖片');"
						oninput="setCustomValidity('');"><i class="fa fa-camera"></i>上傳封面圖片
					</a>
					<p class="showFileName"></p>
					<p class="fileerrorTip"></p>
				</div>

				<div class="limit-date">

					<p class="bluequote">選擇專案期限</p>

					<input class="form-control" type="date" id="bookdate"
						name="funding_duration"
						min=<%out.println(new java.sql.Date(new Date().getTime()));%>>

					<label for="" class="input-label">募資天數為提案開始60天為限。</label>

				</div>



				<div class="create-goal">
					<p class="bluequote">募資目標</p>
					<input type="number" style="font-weight: 400" name="funding_goal"
						min="5000" value="5000" step="1000" class="form-control">
					<!--------------------------------- -->
					<label for="" class="input-label">募資目標金額最低為 $5,000
						元。設定目標金額時，除了考量專案執行的成本支出外，也必須考慮回饋項目的成本，總體而言必須滿足「最低計畫可執行資金」的門檻，才是合理的募資目標。</label>
				</div>

				<div class="create-type">
					<p class="bluequote">音樂類型</p>
					<select name="funding_styleName" class="form-control"><option
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

				<div class="create-city">
					<p class="bluequote">提案所在城市</p>
					<select name="funding_city" class="form-control"><option
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

				<div class="chose-music">
					<p class="bluequote">選擇募資音樂</p>
					<select name="music_id" class="form-control"><option
							value="null" disabled="disabled" selected="selected">選擇音樂</option>

					</select>
				</div>

				<div class="next-reward">
					<input   class="form-control next" type="submit" name="start-project"
						value="下一步 回饋設定">

				</div>
				
			</form>
			<div>${errors.Error}</div>
		</div>
		<!-- 	=== END CONTENT === -->
	</div>

	<jsp:include page="../homePage/footer.jsp" />
</body>


</html>