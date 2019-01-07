<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>找募資</title>
<!-- js -->

<script type="text/javascript" src="../js/scripts.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>

<!-- sort -->
<script type="text/javascript" src="../js/tinysort.min.js"></script>
<script>
	$(document).ready(function() {
		// 	獲取專案數量

		var pcount = $('.project').size();
		$('.count').text(pcount + " 個募資專案");
		//預設
		tinysort.defaults.order = 'desc';
		tinysort('div#sortThis>div', 'span.visitcount');
		
		//瀏覽次數降序排列
		$('#hot').on('click', function() {

			$('#new').removeClass('active');
			$('#end').removeClass('active');
			$('#pledged').removeClass('active');
			$('#hot').addClass('active');

			tinysort.defaults.order = 'desc';
			tinysort('div#sortThis>div', 'span.visitcount');
		})
		//天數降序排列
		$('#new').on('click', function() {

			$('#hot').removeClass('active');
			$('#end').removeClass('active');
			$('#pledged').removeClass('active');
			$('#new').addClass('active');

			tinysort.defaults.order = 'desc';
			tinysort('div#sortThis>div', 'strong.days')
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
			tinysort('div#sortThis>div', 'span.goalMoney');
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
				<div class="row margin-vert-30"></div>
				<!--分類 -->
				<div class="blockHead">
					<ul class="catNav" data-pjax="">
						<li id="hot" class="active"><a>熱門項目</a></li>
						<li id="new" class=""><a>最新發起</a></li>
						<li id="end" class=""><a>即將結束</a></li>
						<li id="pledged" class=""><a>募資金額</a></li>
					</ul>
				</div>
				<!-- 分類結束 -->
				<!--專案預覽 -->

				<div class="preview">
					<h3 class="title">
						目前有 <b class="count"></b>
					</h3>
				</div>

				<div id="sortThis">

					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="https://cdn2.ettoday.net/images/2880/2880194.jpg">
						</div>
						<div class="pcontent">
							<p class="title-content">送給孩子的第一份程式禮物《Coding Ocean：海霸》</p>
							<p class="small creator">
								<a href="">Papacode-程式老爹</a>
							</p>
							<p class="excerpt">30分鐘學會四大程式邏輯。全球26個國家將程式列入基礎教育，我們將用一場遊戲，開啟孩子學習程式的大門。</p>
						</div>
						<div class="downMeta">
							<progress value="100" max="100"></progress>
							<span class="goalMoney osmfont">2671171</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 1906%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">44</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">159</span>
							</div>
						</div>
					</div>


					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="https://img.news.ebc.net.tw/EbcNews/news/2018/12/28/1546034828_53542.jpg">
						</div>
						<div class="pcontent">
							<p class="title-content">送給孩子的第一份程式禮物《Coding Ocean：海霸》</p>
							<p class="small creator">
								<a href="">Papacode-程式老爹</a>
							</p>
							<p class="excerpt">30分鐘學會四大程式邏輯。全球26個國家將程式列入基礎教育，我們將用一場遊戲，開啟孩子學習程式的大門。</p>
						</div>
						<div class="downMeta">
							<progress value="70" max="100"></progress>
							<span class="goalMoney osmfont">123965</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 70%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">24</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">256</span>
							</div>
						</div>
					</div>

					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="http://castnet.nctu.edu.tw/files/images_db/295/20110528220333.jpg">
						</div>
						<div class="pcontent">
							<p class="title-content">送給孩子的第一份程式禮物《Coding Ocean：海霸》</p>
							<p class="small creator">
								<a href="">Papacode-程式老爹</a>
							</p>
							<p class="excerpt">30分鐘學會四大程式邏輯。全球26個國家將程式列入基礎教育，我們將用一場遊戲，開啟孩子學習程式的大門。</p>
						</div>
						<div class="downMeta">
							<progress value="35" max="100"></progress>
							<span class="goalMoney osmfont">3500</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 35%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">50</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">20</span>
							</div>
						</div>
					</div>

					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="https://file2.rrxh5.cc/2016/07/06/1467787765761.jpg">
						</div>
						<div class="pcontent">
							<p class="title-content">送給孩子的第一份程式禮物《Coding Ocean：海霸》</p>
							<p class="small creator">
								<a href="">Papacode-程式老爹</a>
							</p>
							<p class="excerpt">30分鐘學會四大程式邏輯。全球26個國家將程式列入基礎教育，我們將用一場遊戲，開啟孩子學習程式的大門。</p>
						</div>
						<div class="downMeta">
							<progress value="48" max="100"></progress>
							<span class="goalMoney osmfont">1852111</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 48%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">10</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">6785</span>
							</div>
						</div>
					</div>

					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="http://5b0988e595225.cdn.sohucs.com/images/20180525/fdbf984cd9cd4efcb903aafe6d5a1c9d.jpeg">
						</div>
						<div class="pcontent">
							<p class="title-content">送給孩子的第一份程式禮物《Coding Ocean：海霸》</p>
							<p class="small creator">
								<a href="">Papacode-程式老爹</a>
							</p>
							<p class="excerpt">30分鐘學會四大程式邏輯。全球26個國家將程式列入基礎教育，我們將用一場遊戲，開啟孩子學習程式的大門。</p>
						</div>
						<div class="downMeta">
							<progress value="87" max="100"></progress>
							<span class="goalMoney osmfont">7654321</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 87%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">19</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">842</span>
							</div>
						</div>
					</div>

					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="http://www.chinambn.com/uploadfiles/image/201502/213.jpg">
						</div>
						<div class="pcontent">
							<p class="title-content">送給孩子的第一份程式禮物《Coding Ocean：海霸》</p>
							<p class="small creator">
								<a href="">Papacode-程式老爹</a>
							</p>
							<p class="excerpt">30分鐘學會四大程式邏輯。全球26個國家將程式列入基礎教育，我們將用一場遊戲，開啟孩子學習程式的大門。</p>
						</div>
						<div class="downMeta">
							<progress value="69" max="100"></progress>
							<span class="goalMoney osmfont">8123789</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 69%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">23</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">6941</span>
							</div>
						</div>
					</div>

					<div class="project">
						<div class="img-pre">
							<img class="img-in"
								src="http://a3.att.hudong.com/66/30/01300000165476121446305930262.jpg">
						</div>
						<div class="pcontent">
							<p class="title-content">唱歌給狗聽</p>
							<p class="small creator">
								<a href="">老狗</a>
							</p>
							<p class="excerpt">就是唱歌給狗聽 就是唱歌給狗聽 就是唱歌給狗聽 就是唱歌給狗聽 就是唱歌給狗聽</p>
						</div>
						<div class="downMeta">
							<progress value="12" max="100"></progress>
							<span class="goalMoney osmfont">150</span>&nbsp; <span
								class="hidden-md goalpercent goal"> 12%</span> <span
								class="date pull-right small"> 還剩 <strong class="days">12</strong><span>
									天</span>
							</span>
							<div>
								<span class="visitcount">90</span>
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
	<!-- 	<div id="player"> -->
	<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
	<!-- 	</div> -->

</body>
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


</html>