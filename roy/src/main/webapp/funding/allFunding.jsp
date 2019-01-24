<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找募資</title>
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
<script type="text/javascript">

//	判斷贊助成功跳回所有專案畫面
<c:if test="${not empty newDonateBean}">

alert('${result}');

</c:if>


	$(document).ready(function() {
		showAllFunding();

		$(window).load(function() {
			projectSize();
			limitText();
		})

		//預設
		tinysort.defaults.order = 'desc';
		tinysort('div#sortThis>div', 'span.funding_browseCount');

		//瀏覽次數降序排列
		$('#hot').on('click', function() {

			$('#new').removeClass('active');
			$('#end').removeClass('active');
			$('#pledged').removeClass('active');
			$('#hot').addClass('active');

			tinysort.defaults.order = 'desc';
			tinysort('div#sortThis>div', 'span.funding_browseCount');
		})
		//天數降序排列
		$('#new').on('click', function() {

			$('#hot').removeClass('active');
			$('#end').removeClass('active');
			$('#pledged').removeClass('active');
			$('#new').addClass('active');

			tinysort.defaults.order = 'desc';
			tinysort('div#sortThis>div', 'span.funding_createTime')
		})
		//天數升序排列
		$('#end').on('click', function() {

			$('#hot').removeClass('active');
			$('#new').removeClass('active');
			$('#pledged').removeClass('active');
			$('#end').addClass('active');

			tinysort.defaults.order = 'asc';
			tinysort('div#sortThis>div', 'strong.days');
		})
		//募款金額降序排列
		$('#pledged').on('click', function() {

			$('#hot').removeClass('active');
			$('#new').removeClass('active');
			$('#end').removeClass('active');
			$('#pledged').addClass('active');

			tinysort.defaults.order = 'desc';
			tinysort('div#sortThis>div', 'span.currentMoney');
		})

	})

	//抓取選取日期計算到期天數
	function limitDay(day) {
		var pickdate = day;
		var enddate = new Date(pickdate);
		var nowdate = new Date();

		var deadline = enddate.getTime() - nowdate.getTime();
		var days = parseInt(deadline / (1000 * 60 * 60 * 24)) + 1;
		if (isNaN(days)) {
			return 0;
		} else {
			return days;
		}
	}
	// 		function limitDay(s) {

	// 			m = s.substring(s.indexOf('月')-1,s.indexOf('月'));
	// 			d = s.substring(s.indexOf(',')-2,s.indexOf(','));
	// 			y = s.substring(s.length-4,s.length);
	// 			ss = y +'-'+m+'-'+d;

	// 			var enddate = new Date(ss);
	// 			var nowdate = new Date();

	// 			var deadline = enddate.getTime()
	// 					- nowdate.getTime();
	// 			var days = parseInt(deadline
	// 					/ (1000 * 60 * 60 * 24)) + 1;
	// 			return days;

	// 		}
	// 獲取專案數量
	function projectSize() {
		var pcount = $('.allproject').size();
		$('.count').text("有 " + pcount + " 件案子正在募資");
	}
	// 列出所有專案
	function showAllFunding() {
		
				$.getJSON(
						'allFundingProject.controller',
						function(data) {
							var content = "";
							$
									.each(
											data,
											function(idx, list) {
												console.log(list);
												content +=

												'<div class="project-pre allproject" style="cursor:pointer" href="/roy/funding/detail.controller?funding_id='
														+ list.funding_id
														+ '&day='
														+ limitDay(list.funding_duration)
														+ '&nickname='
														+ list.nick_name
														+ '" onclick="detailhref(this)">'
														+ '<div class="img-pres">'
														+ '<img class="img-in" id="preview_progressbarTW_img"'+
			    'src="'+list.funding_image+'">'
														+ '</div>'
														+ '<div class="pcontent-pre">'
														+ '<p id="pre-title" class="title-content"'+
					'style="margin-bottom: -18px">'
														+ list.funding_title
														+ '</p>'
														+ '<p class="small creator">'
														+ '<a href="/roy/personalPage/somebodyPersonalPage.controller?nickname='
														+ list.nick_name
														+ '"><p id="pre-name">'
														+ list.nick_name
														+ '</p></a>'
														+

														'<p id="pre-content" class="excerpt JQellipsis"'+
					'style="font-weight: bold; font-size: 0.85rem">'
														+ list.funding_description
														+ '</p>'
														+ '</div>'
														+ '<div class="downMeta-pre">'
														+ '<progress class="progress-pre"'+
					'style="margin-bottom: 0px; margin-top: 0px;" value="'+list.funding_currentAmount/list.funding_goal*100+'" max="100"></progress>'
														+ '<span class="goalMoney osmfont currentMoney">'
														+ list.funding_currentAmount
														+ '</span><span'+
					' class="hidden-md goalpercent goal"> '
														+ list.funding_currentAmount
														/ list.funding_goal
														* 100
														+ '%</span><span'+
					' style="font-size: 13px; letter-spacing: 1px"'+
					'class="date pull-right small"> 還剩 <strong class="days"'+
					'style="font-size: 13px; font-weight: 1000; letter-spacing: 1px">'
														+ limitDay(list.funding_duration)
														+ '</strong><span'+
					' style="font-size: 13px; letter-spacing: 1px"> 天</span>'
														+ '</span>'
														+ '<span class="funding_id" style="display:none">'
														+ list.funding_id
														+ '</sapn>'
														+ '<span class="funding_goal" style="display:none">'
														+ list.funding_goal
														+ '</sapn>'
														+ '<span class="funding_createTime" style="display:none">'
														+ list.funding_createTime
														+ '</sapn>'
														+ '<span class="funding_duration" style="display:none">'
														+ list.funding_duration
														+ '</sapn>'
														+ '<span class="funding_browseCount" style="display:none">'
														+ list.funding_browseCount
														+ '</sapn>'
														+ '</div>'
														+ '</div>';

											})
							$('#sortThis').html(content);

						})
	}
	//超過50字以...表示
	function limitText() {

		var len = 65; // 超過50個字以"..."取代
		$(".JQellipsis").each(function(i) {
			if ($(this).text().length > len) {
				$(this).attr("title", $(this).text());
				var text = $(this).text().substring(0, len - 1) + "...";
				$(this).text(text);
			}
		});
	}
	// 點擊預覽小卡跳轉詳細頁面
	function detailhref(e) {
		var webhref = $(e).attr("href");
		window.location.href = webhref;
	}

</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="week-count">
			<p class="thisweek">本週動態</p>
			<p class="count"></p>
		</div>
		<div class="blockHead">
			<ul class="catNav" data-pjax="">
				<li id="hot" class="active"><a>熱門項目</a></li>
				<li id="new" class=""><a>最新發起</a></li>
				<li id="end" class=""><a>即將結束</a></li>
				<li id="pledged" class=""><a>募資金額</a></li>
			</ul>
		</div>
		<div style="width: 57%; margin-left: 445px;; text-align: left:;"
			id="showAll">

			<div id="sortThis"></div>
			<!-- 			<div class="project-pre allproject" > -->
			<!-- 				<div class="img-pres"> -->
			<!-- 					<img class="img-in" id="preview_progressbarTW_img" -->
			<!-- 						src="/roy/img/gun.jpg"> -->
			<!-- 				</div> -->
			<!-- 				<div class="pcontent-pre"> -->
			<!-- 					<p id="pre-title" class="title-content" -->
			<!-- 						style="margin-bottom: -18px">例：30 個字以內的專案標題</p> -->
			<!-- 					<p class="small creator"> -->
			<%-- 					<p id="pre-name">${nickname}</p> --%>

			<!-- 					<p id="pre-content" class="excerpt JQellipsis" -->
			<!-- 						style="font-weight: bold; font-size: 0.85rem">例：簡短描述專案內容，吸引瀏覽者在 -->
			<!-- 						FarVoice 首頁上點擊你的專案。</p> -->
			<!-- 				</div> -->
			<!-- 				<div class="downMeta-pre"> -->
			<!-- 					<progress class="progress-pre" -->
			<!-- 						style="margin-bottom: 0px; margin-top: 0px;" value="0" max="100"></progress> -->
			<!-- 					<span class="goalMoney osmfont">0</span>&nbsp; <span -->
			<!-- 						class="hidden-md goalpercent goal"> 0%</span> <span -->
			<!-- 						style="font-size: 13px; letter-spacing: 1px" -->
			<!-- 						class="date pull-right small"> 還剩 <strong class="days" -->
			<!-- 						style="font-size: 13px; font-weight: 1000; letter-spacing: 1px">0</strong><span -->
			<!-- 						style="font-size: 13px; letter-spacing: 1px"> 天</span> -->
			<!-- 					</span> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<!-- 分隔線 -->

			<!-- 分隔線 -->

		</div>
		<!-- 	=== END CONTENT === -->

		<jsp:include page="../homePage/footer.jsp" />
	</div>
</body>
</html>