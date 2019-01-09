<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- === BEGIN HEADER === -->
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
<!-- Title -->
<title>FarVOiCE | 找文章</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="../css/custom.css" rel="stylesheet">
<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"
	rel="stylesheet" type="text/css">
<style>
* {
	font-family: 微軟正黑體;
}
</style>
<!-- JS -->
<script type="text/javascript" src="../js/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="../js/scripts.js"></script>
<!-- Isotope - Portfolio Sorting -->
<script type="text/javascript" src="../js/jquery.isotope.js"
	type="text/javascript"></script>
<!-- Mobile Menu - Slicknav -->
<script type="text/javascript" src="../js/jquery.slicknav.js"
	type="text/javascript"></script>
<!-- Animate on Scroll-->
<script type="text/javascript" src="../js/jquery.visible.js"
	charset="utf-8"></script>
<!-- Sticky Div -->
<script type="text/javascript" src="../js/jquery.sticky.js"
	charset="utf-8"></script>
<!-- Slimbox2-->
<script type="text/javascript" src="../js/slimbox2.js"
	charset="utf-8"></script>
<!-- Modernizr -->
<script src="../js/modernizr.custom.js" type="text/javascript"></script>
<!-- End JS -->

</head>

<body>

	<div class="primary-container-group">
		<!-- Background -->
		<div class="primary-container-background">
			<div class="primary-container"></div>
			<div class="clearfix"></div>
		</div>
		<!--End Background -->
		<!-- === BEGIN header === -->
	
		<jsp:include page="../homePage/header.jsp" />
		<!-- === END header === -->

		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="row margin-vert-30">
					<!-- Main Column -->
					<div class="col-md-9">
						<!-- Blog Post -->
						<div class="blog-post padding-bottom-20">
							<!-- Blog Item Header -->
							<div class="blog-item-header">
								<!-- Title -->
								<h2>
									<a href="#">最新文章</a>
								</h2>
								<div class="clearfix"></div>
								<!-- End Title -->
							</div>
							<!-- End Blog Item Header -->
							<!-- Blog Item Details -->
							<div class="blog-post-details">
								<!-- Author Name -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-user color-gray-light"></i> <a href="#">作者:黃金鼠</a>
								</div>
								<!-- End Author Name -->
								<!-- Date -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-calendar color-gray-light"></i> <a href="#">2019.01.02</a>
								</div>
								<!-- End Date -->
								<!-- Tags -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
									<i class="fa fa-tag color-gray-light"></i> <a href="#">HTML5</a>,
									<a href="#">CSS</a>, <a href="#">Grunt</a>
								</div>
								<!-- End Tags -->
								<!-- # of Comments -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
									<a href=""> <i class="fa fa-comments color-gray-light"></i>
										9 Comments
									</a>
								</div>
								<!-- End # of Comments -->
							</div>
							<!-- End Blog Item Details -->
							<!-- Blog Item Body -->
							<div class="blog">
								<div class="clearfix"></div>
								<div class="blog-post-body row margin-top-15">
									<div class="col-md-5">
										<img class="margin-bottom-20" src="imgs/mouse.PNG"
											alt="thumb1">
									</div>
									<div class="col-md-7">
										<p>最新文章</p>
										<p>我是一隻黃金鼠</p>
										<!-- Read More -->
										<a href="../findArticle/singleArticle.jsp"
											class="btn btn-primary">查看全文<i
											class="icon-chevron-right readmore-icon"></i>
										</a>
										<!-- End Read More -->
									</div>
								</div>
							</div>
							<!-- End Blog Item Body -->
						</div>
						<!-- End Blog Item -->
						<!-- Blog Post -->
						<div class="blog-post padding-bottom-20">
							<!-- Blog Item Header -->
							<div class="blog-item-header">
								<!-- Title -->
								<h2>
									<a href="#">玄鳳</a>
								</h2>
								<div class="clearfix"></div>
								<!-- End Title -->
							</div>
							<!-- End Blog Item Header -->
							<!-- Blog Item Details -->
							<div class="blog-post-details">
								<!-- Author Name -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-user color-gray-light"></i> <a href="#">作者:玄鳳鸚鵡</a>
								</div>
								<!-- End Author Name -->
								<!-- Date -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-calendar color-gray-light"></i> <a href="#">2019.01.02</a>
								</div>
								<!-- End Date -->
								<!-- Tags -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
									<i class="fa fa-tag color-gray-light"></i> <a href="#">CoffeeScript</a>,
									<a href="#">CSS</a>, <a href="#">Ruby</a>
								</div>
								<!-- End Tags -->
								<!-- # of Comments -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
									<a href=""> <i class="fa fa-comments color-gray-light"></i>
										5 Comments
									</a>
								</div>
								<!-- End # of Comments -->
							</div>
							<!-- End Blog Item Details -->
							<!-- Blog Item Body -->
							<div class="blog">
								<div class="clearfix"></div>
								<div class="blog-post-body row margin-top-15">
									<div class="col-md-5">
										<img class="margin-bottom-20" src="imgs/bird.jpg" alt="thumb2">
									</div>
									<div class="col-md-7">
										<p>你好我是玄鳳</p>
										<p>你好我是鸚鵡</p>

										<!-- Read More -->
										<a href="#" class="btn btn-primary"> 查看全文 <i
											class="icon-chevron-right readmore-icon"></i>
										</a>
										<!-- End Read More -->
									</div>
								</div>
							</div>
							<!-- End Blog Item Body -->
						</div>
						<!-- End Blog Item -->
						<!-- Blog Post -->
						<div class="blog-post padding-bottom-20">
							<!-- Blog Item Header -->
							<div class="blog-item-header">
								<!-- Title -->
								<h2>
									<a href="#">讓我為你唱情歌</a>
								</h2>
								<div class="clearfix"></div>
								<!-- End Title -->
							</div>
							<!-- End Blog Item Header -->
							<!-- Blog Item Details -->
							<div class="blog-post-details">
								<!-- Author Name -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-user color-gray-light"></i> <a href="#">蕭敬騰</a>
								</div>
								<!-- End Author Name -->
								<!-- Date -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-calendar color-gray-light"></i> <a href="#">2019.01.02</a>
								</div>
								<!-- End Date -->
								<!-- Tags -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
									<i class="fa fa-tag color-gray-light"></i> <a href="#">Bootstrap</a>,
									<a href="#">CoffeeScript</a>, <a href="#">Ruby</a>
								</div>
								<!-- End Tags -->
								<!-- # of Comments -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
									<a href=""> <i class="fa fa-comments color-gray-light"></i>
										9 Comments
									</a>
								</div>
								<!-- End # of Comments -->
							</div>
							<!-- End Blog Item Details -->
							<!-- Blog Item Body -->
							<div class="blog">
								<div class="clearfix"></div>
								<div class="blog-post-body row margin-top-15">
									<div class="col-md-5">
										<img class="margin-bottom-20" src="imgs/hqdefault.jpg"
											alt="thumb3">
									</div>
									<div class="col-md-7">
										<p>333333333333333333</p>
										<!-- Read More -->
										<a href="#" class="btn btn-primary"> 查看全文 <i
											class="icon-chevron-right readmore-icon"></i>
										</a>
										<!-- End Read More -->
									</div>
								</div>
							</div>
							<!-- End Blog Item Body -->
						</div>
						<!-- End Blog Item -->
						<!-- Blog Post -->
						<div class="blog-post padding-bottom-20">
							<!-- Blog Item Header -->
							<div class="blog-item-header">
								<!-- Title -->
								<h2>
									<a href="#"> 第四篇</a>
								</h2>
								<div class="clearfix"></div>
								<!-- End Title -->
							</div>
							<!-- End Blog Item Header -->
							<!-- Blog Item Details -->
							<div class="blog-post-details">
								<!-- Author Name -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-user color-gray-light"></i> <a href="#">作者</a>
								</div>
								<!-- End Author Name -->
								<!-- Date -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-calendar color-gray-light"></i> <a href="#">2019.08.03</a>
								</div>
								<!-- End Date -->
								<!-- Tags -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
									<i class="fa fa-tag color-gray-light"></i> <a href="#">PHP</a>,
									<a href="#">HTML</a>, <a href="#">HTML5</a>
								</div>
								<!-- End Tags -->
								<!-- # of Comments -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-item-last">
									<a href=""> <i class="fa fa-comments color-gray-light"></i>
										4 Comments
									</a>
								</div>
								<!-- End # of Comments -->
							</div>
							<!-- End Blog Item Details -->
							<!-- Blog Item Body -->
							<div class="blog">
								<div class="clearfix"></div>
								<div class="blog-post-body row margin-top-15">
									<div class="col-md-5">
										<img class="margin-bottom-20" src="../img/blog/image4.jpg"
											alt="thumb4">
									</div>
									<div class="col-md-7">
										<p>4444444444444444</p>
										<!-- Read More -->
										<a href="#" class="btn btn-primary">查看全文 <i
											class="icon-chevron-right readmore-icon"></i>
										</a>
										<!-- End Read More -->
									</div>
								</div>
							</div>
							<!-- End Blog Item Body -->
						</div>
						<!-- End Blog Item -->
						<!-- Pagination -->
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li class="disabled"><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
						<!-- End Pagination -->
					</div>
					<br> <br>
					<!-- End Main Column -->
					<!-- Side Column -->
					<div class="col-md-3">
						<div class="blog-tags">
							<h3>搜尋文章</h3>
							<ul class="blog-tags">

								<!-- 搜尋文章 -->
								<form class="form-inline">
									<input class="form-control mr-sm-2" type="search"
										placeholder="搜尋" aria-label="Search">
									<button class="btn btn-outline-success" type="submit">搜尋</button>
								</form>
							</ul>
						</div>

						<hr>
						<br>
						<div class="recent-posts">
							<h3>最近新增文章</h3>
							<ul class="posts-list margin-top-10">
								<li>
									<div class="recent-post">
										<a href=""> <img class="pull-left" src="imgs/mouse.PNG"
											style="width: 100px; height: 90px" alt="thumb1">
										</a> <a href="../findArticle/singleArticle.jsp"
											class="posts-list-title">黃金鼠 </a> <br> <span
											class="recent-post-date"> 2019.01.02 </span>
									</div>
									<div class="clearfix"></div>
								</li>
								<br>
								<li>
									<div class="recent-post">
										<a href=""> <img class="pull-left" src="imgs/bird.jpg"
											style="width: 100px; height: 90px" alt="thumb2">
										</a> <a href="#" class="posts-list-title">玄鳳</a> <br> <span
											class="recent-post-date"> 2019.01.02 </span>
									</div>
									<div class="clearfix"></div>
								</li>
								<br>
								<li>
									<div class="recent-post">
										<a href=""> <img class="pull-left"
											src="../img/blog/thumbs/thumb3.jpg"
											style="width: 100px; height: 90px" alt="thumb3">
										</a> <a href="#" class="posts-list-title">第三篇</a> <br> <span
											class="recent-post-date"> 2019.02.03 </span>
									</div>
									<div class="clearfix"></div>
								</li>
								<br>
								<li>
									<div class="recent-post">
										<a href=""> <img class="pull-left"
											src="../img/blog/thumbs/thumb4.jpg"
											style="width: 100px; height: 90px" alt="thumb4">
										</a> <a href="#" class="posts-list-title">第四篇</a> <br> <span
											class="recent-post-date"> 2019.05.06 </span>
									</div>
									<div class="clearfix"></div>
								</li>
							</ul>
						</div>
						<!-- End Recent Posts -->
					</div>
					<!-- End Side Column -->
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- === END CONTENT === -->

	<!-- === BEGIN FOOTER === -->
	<jsp:include page="../homePage/footer.jsp" />
	<!-- END Footer Menu -->
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
<!-- 	</div> -->



</body>
</html>
<!-- === END FOOTER === -->