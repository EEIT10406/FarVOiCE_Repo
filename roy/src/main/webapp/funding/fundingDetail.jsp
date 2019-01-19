<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>募資詳細頁面</title>
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
<!-- js -->
<script type="text/javascript">
	// 替換專案內容&支持者
	//瀏覽次數降序排列
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
	})
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div class="fundingDetail">

			<div class="detailHead">
				<h1 style="font-weight: bold;">『the ONE table 一張桌子』為孩子開張團圓桌</h1>
				<p>
					由 <a href="">the ONE table 一張桌子扶助計畫</a> 提案
				</p>
			</div>

			<div class="c-1">
				<div class="detailImg">
					<img src="/roy/image/funding/hon.jpg">
				</div>
				<div class="schedule">
					<span class="s-number">$0</span> <span
						class="schedule-span s-number">$15000</span>
					<progress value="50" max="100"></progress>
					<span style="font-family: Microsoft JhengHei;">募資開始</span><span
						class="schedule-span" style="font-family: Microsoft JhengHei;">募資成功</span>
				</div>
			</div>


			<div class="c-2">
				<div class="info-1">
					<h1>$153980</h1>
					<span>目標</span>
					<p>$150000</p>
				</div>
				<div class="info-2">
					<h1>167</h1>
					<p>人贊助</p>
				</div>
				<div class="info-3">
					<h1>12</h1>
					<p>天結束</p>
				</div>

				<blockquote class="blockquote-d">
					專案募資成功！<br>在 2019/01/31 00:00 募資結束前，您都可以持續贊助此計畫。
				</blockquote>
				<a href="" class="btn-sup">贊助專案</a>
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
						<span>提案者:</span>the ONE table 一張桌子扶助計畫
					</p>
					<a> <img src="">
					</a>

				</div>
			</div>




			<div class="c-4">
				<div class="ajax-content">
					<h1 class="content-s1">專案內容</h1>
					<h1 class="content-s2">『the ONE table 一張桌子』為孩子開張團圓桌</h1>
					<p class="content-s3">一張桌子，看似只有三支桌腳支撐著，分別代表著一起合作的三位女孩，另外一支隱形的桌腳，代表著社會上支持公益與傳遞愛心的人；『the
						ONE table
						一張桌子』扶助計畫，已順利推動善的循環，無論是寒冬的艱苦人尾牙，抑或是拾荒長輩的支助，都讓迫切需要幫助的人，在那當下，倚著一張桌子，找到希望。無論是捐贈者或是受贈者，都因著這樣的善行，在桌子上呈現最好的互助，也讓彼此的生命大大被改變。</p>
				</div>

				<div class="reward-card">

					<div class="a">
						<div class="project-pre">
							<div class="pcontent-pre"
								style="height: 40px; font-size: 2.5rem; margin-bottom: 0px;">
								<p id="pre-amount" class="title-content detail-money">100</p>
								<p class="detail-man">41人</p>
							</div>
							<div class="img-detail">
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

								<div class="donate">
									<p>
										<span>你的支持將使專案達到</span>150%
									</p>
									<form method="post" action=""></form>

									<div>
										<div></div>
										<div></div>
									</div>


								</div>


							</div>
						</div>

					</div>






				</div>

			</div>





		</div>




































		<!-- 	=== END CONTENT === -->

		<jsp:include page="../homePage/footer.jsp" />
	</div>
</body>
</html>