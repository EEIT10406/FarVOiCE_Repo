<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>贊助頁面</title>
<!-- JS -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<!-- sort -->
<script type="text/javascript" src="../js/tinysort.min.js"></script>
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
<style>
:-moz-placeholder {
	/* Mozilla Firefox 4 to 18 */
	color: #d0d0d0;
}

::-moz-placeholder {
	/* Mozilla Firefox 19+ */
	color: #d0d0d0;
}

input:-ms-input-placeholder {
	color: #d0d0d0;
}

input::-webkit-input-placeholder {
	color: #d0d0d0;
}
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="fundingDetail" style="display: flow-root;">

			<div class="detailHead">
				<h1 style="font-weight: bold">${fundingBean.funding_title}</h1>
				<p>
					由 <a
						href="/roy/personalPage/somebodyPersonalPage.controller?nickname=${nickname}">${nickname}</a>
					提案
				</p>
			</div>
			<div class="c-1" style="padding-left: 20px">
				<form action="<c:url value="" />" method="post">
					<p class="thisweek" style="padding-left: 5px">寄送資訊</p>
					<div class="form-group">

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>收</span> <span>件</span> <span>人</span> <span>姓</span> <span>名</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="請填寫真實姓名，以利提案團隊聯繫及寄送回饋" required name="name"
									type="text">
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>收</span> <span>件</span> <span>地</span> <span>址</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="請填寫希望的收件地址，提案團隊會將回饋寄送至此" required name="name"
									type="text">
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>郵</span> <span>遞</span> <span>區</span> <span>號</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="郵遞區號" required name="name" type="text">
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>聯</span> <span>絡</span> <span>電</span> <span>話</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="請填寫常用手機號碼，以利提案團隊聯繫" required name="name"
									type="text">
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>聯</span> <span>絡</span> <span>信</span> <span>箱</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="請填寫常用電子信箱，以利提案團隊聯繫" required name="name"
									type="text" value='${memberBean.member_email}'>
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>贊</span> <span>助</span> <span>人</span> <span>名</span> <span>稱</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="贊助人名稱" required name="name" type="text" value='${memberBean.member_username}'>
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>贊</span> <span>助</span> <span>金</span> <span>額</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="贊助金額" required name="name" type="text" value='${total_sup}'>
							</div>

						</div>
						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>回</span> <span>饋</span> <span>I</span> <span>D</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="回饋ID" required name="name" type="text" value='${rewardBean.reward_id}'>
							</div>

						</div>

						<div class="input-group">
							<div class="input-group-addon clabel hidden-xs">
								<div class="justify-helper" style="width: 100px">
									<span>專</span> <span>案</span> <span>I</span> <span>D</span>
								</div>

							</div>

							<div class="input-form-wrapper submit-error" id="name">
								<input class="form-control-b live-error-track"
									placeholder="專案ID" required name="name" type="text" value='${rewardBean.funding_id}'>
							</div>

						</div>

					</div>
					<!--總金額 -->
					<div>
						<div class="whiteWell transactionData confirmData">
							<div class="rewardData row">
								<div
									class="col-xs-3  money-addition-sign equal-sym totalCostWrapper"
									style="width: 100%">
									<small class="grey">總金額</small>
									<p class="mathNum totalCost">${total_sup}</p>
								</div>
							</div>
						</div>
						<!-- 提交 -->
						<input type="submit" class="btn-submit sent-money" value="確認贊助">
					</div>
				</form>
			</div>
			<div class="c-2" style="float: right; padding-right: 10px">
				<p class="thisweek" style="padding-left: 15px">
					贊助項目<span class="redweek">更換回饋</span>
				</p>
				<div class="card-toggle ban-donate">
					<div class="a">
						<div class="project-pre pre-hover ban-color">
							<div class="pcontent-pre"
								style="height: 40px; font-size: 2.5rem; margin-bottom: 0px;">
								<p id="pre-amount" class="title-content detail-money">${rewardBean.reward_amount}</p>
								<p class="detail-man">${donateCount}人</p>
							</div>
							<div class="img-detail">
								<img class="img-in" id="preview_progressbarTW_img"
									style="border-radius: 0"
									src="${rewardBean.reward_image}">
							</div>
							<div class="pcontent-pre"
								style="height: auto; margin-bottom: 0px;">

								<p id="pre-content" class="excerpt"
									style="font-weight: bold; font-size: 0.85rem">${rewardBean.reward_description}</p>
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
										style="font-size: 13px; letter-spacing: 0.5px;">${rewardBean.reward_estimatedYear}</span> /
									<span id="estimated-month"
										style="font-size: 13px; letter-spacing: 0.5px;">${rewardBean.reward_estimatedMonth}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- === END CONTENT === -->
		<jsp:include page="../homePage/footer.jsp" />
	</div>
</body>
</html>