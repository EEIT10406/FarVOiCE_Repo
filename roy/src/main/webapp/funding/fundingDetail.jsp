<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>募資詳細頁面</title>
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
<!-- js -->
<script type="text/javascript">
	$(document).ready(function() {

		//替換專案內容
		$('#incontent').on('click', function() {

			$('#sup').removeClass('active');
			$('#incontent').addClass('active');

		})
		//替換支持者
		$('#sup').on('click', function() {

			$('#incontent').removeClass('active');
			$('#sup').addClass('active');
		})
		//切換捐贈+focus
		$('.card-toggle').click(function() {
			var query = $(this).find('.donate');
			var isVisible = query.is(':visible');
			if (isVisible === true) {
				// element is Visible
				$(this).find('.pick-lock').focus();
			} else {
				// element is Hidden
				$('.donate').hide();
				$(this).find('.donate').slideDown(300);
				$(this).find('.pick-lock').focus();
			}
		})

		//無法贊助自己的專案
		if ('${selfusername}' == '${funding.member_username}') {

			$('#entry').attr("disabled", true);
			$('#entry').css("pointer-events", "none");
			$('#entry').css("background-color", "#bebebe");
			$('#entry').html("<i class='fas fa-ban'></i>  您無法贊助自己的專案");
			$('.ban-donate').attr("disabled", true);
			$('.ban-donate').css("pointer-events", "none");
			$('.ban-color').css("background-color", "#e0e0e0");
		}
		
	})
	//得出每個回饋贊助人數
	// 		function donatecounts(count){
	// 			alert(..............)
	// 		$.get("donateCount_reward.controller",{reward_id:count}).done(function(result){

	// 			alert(result);

	// 		})

	// 	}
	
</script>
<style type="text/css">
input::-webkit-outer-spin-button, input::-webkit-inner-spin-button {
	-webkit-appearance: none;
}

input[type="number"] {
	-moz-appearance: textfield;
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="fundingDetail">

			<div class="detailHead">
				<h1 style="font-weight: bold">${funding.funding_title}</h1>
				<p>
					由 <a
						href="/roy/personalPage/somebodyPersonalPage.controller?nickname=${nickname}">${nickname}</a>
					提案
				</p>
			</div>

			<div class="c-1">
				<div class="detailImg">
					<img src="${funding.funding_image}">
				</div>
				<div class="schedule">
					<span class="s-number">$0</span> <span
						class="schedule-span s-number">$${funding.funding_goal}</span>
					<progress value="${percent}" max="100"></progress>
					<span style="font-family: Microsoft JhengHei;">募資開始</span><span
						class="schedule-span" style="font-family: Microsoft JhengHei;">募資成功</span>
				</div>
			</div>


			<div class="c-2">
				<div class="info-1">
					<h1>$${funding.funding_currentAmount}</h1>
					<span>目標</span>
					<p>$${funding.funding_goal}</p>
				</div>
				<div class="info-2">
					<h1>${donateCount_funding}</h1>
					<p>人贊助</p>
				</div>
				<div class="info-3">
					<h1>${day}</h1>
					<p>天結束</p>
				</div>

				<blockquote class="blockquote-d">
					專案募資成功！<br>在 2019/01/31 00:00 募資結束前，您都可以持續贊助此計畫。
				</blockquote>
				<a href="" id="entry" class="btn-sup">贊助專案</a>


			</div>

			<div class="c-3">
				<div class="detail-blockHead">
					<ul class="catNav" data-pjax="">
						<li id="incontent" class="active"><a>專案內容</a></li>
						<li id="sup" class=""><a>支持者</a></li>
					</ul>
				</div>
				<div class="create-man">
					<p style="display: inline-block;">
						<span>提案者:</span>${nickname}
					</p>
					<a> <img src="">
					</a>

				</div>
			</div>




			<div class="c-4">
				<div class="ajax-content">
					<h1 class="content-s1">專案內容</h1>
					<h1 class="content-s2">${funding.funding_title}</h1>
					<p class="content-s3">${funding.funding_description}</p>
				</div>

				<div class="reward-card ban-text">


					<c:forEach var='reward'  items="${reward}">

						<div class="card-toggle ban-donate">
							<div class="a">
								<div class="project-pre pre-hover ban-color">
									<div class="pcontent-pre"
										style="height: 40px; font-size: 2.5rem; margin-bottom: 0px;">
										<p id="pre-amount" class="title-content detail-money">${reward.reward_amount}</p>
										<p class="detail-man">${reward.reward_donateCount}</p>
									</div>
									<div class="img-detail">
										<img class="img-in" id="preview_progressbarTW_img"
											style="border-radius: 0" src="${reward.reward_image}">
									</div>
									<div class="pcontent-pre"
										style="height: auto; margin-bottom: 0px;">

										<p id="pre-content" class="excerpt"
											style="font-weight: bold; font-size: 0.85rem">${reward.reward_description}</p>
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
												style="font-size: 13px; letter-spacing: 0.5px;">${reward.reward_estimatedYear}</span>
											/ <span id="estimated-month"
												style="font-size: 13px; letter-spacing: 0.5px;">${reward.reward_estimatedMonth}</span>
										</div>

										<div class="donate">
											<p class="donate-p">
												<span>你的支持將使專案達到</span>150%
											</p>

											<form method="post"
												action="<c:url value="turnToDonatePage.controller?reward_id=${reward.reward_id}&funding_id=${reward.funding_id}&funding_title=${funding.funding_title}&nickname=${nickname}"/> ">
												<div class="sup-money-0">
<p>${reward.reward_id}</p>
													<div class="sup-money-1">
														<label class="sup-money-2">贊助金額</label>
														<h1 class="sup-money-3">$${reward.reward_amount}</h1>
													</div>
													<div class="plus"></div>
													<div class="extra-sup-1">
														<label class="extra-sup-2">額外支持</label> <br> <input
															value="0" name="sup_money" class="pick-lock" type="number"
															placeholder="$0">
													</div>
<!-- 													<input style="display: none" type="text" -->
<%-- 														value="${reward.reward_id}"> <input --%>
<!-- 														style="display: none" type="text" -->
<%-- 														value="${reward.funding_id}">  --%>
														<input type="submit"
														class=btn-submit value="贊助此回饋">
												</div>
											</form>

										</div>


									</div>
								</div>

							</div>

						</div>

					</c:forEach>


				</div>

			</div>





		</div>




































		<!-- 	=== END CONTENT === -->

		<jsp:include page="../homePage/footer.jsp" />
	</div>
</body>
</html>