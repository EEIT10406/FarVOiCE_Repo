<!-- === BEGIN HEADER === -->
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--<![endif]-->
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<!-- Title -->
<title>Far VOiCE | 閱讀文章</title>
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
<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"
	rel="stylesheet" type="text/css">
<style>
* {
	font-family: 微軟正黑體;
}
}
</style>
</head>
<body>
	<!--         <div id="body_bg"> -->
	<!--             <div id="pre_header" class="container"> -->
	<!--                 <div class="row margin-top-10 visible-lg"> -->
	<!--                     <div class="col-md-6"> -->
	<!--                         <p> -->
	<!--                             <strong>Phone:</strong>&nbsp;1-800-123-4567</p> -->
	<!--                     </div> -->
	<!--                     <div class="col-md-6 text-right"> -->
	<!--                         <p> -->
	<!--                             <strong>Email:</strong>info@example.com</p> -->
	<!--                     </div> -->
	<!--                 </div> -->
	<!--             </div> -->
	<div class="primary-container-group">
		<!-- Background -->
		<div class="primary-container-background">
			<div class="primary-container"></div>
			<div class="clearfix"></div>
		</div>
		<!--End Background -->

		<!-- === BEGIN header === -->
		<jsp:include page="../homePage/header.jsp" />
		<!-- === END HEADER === -->

		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="row margin-vert-30">
					<!-- Main Column -->
					<div class="col-md-9">
						<div class="blog-post">
							<div class="blog-item-header">
								<h2>
									<a href="#">最新文章</a>
								</h2>
							</div>
							<div class="blog-post-details">
								<!-- Author Name -->
								<div
									class="blog-post-details-item blog-post-details-item-left user-icon">
									<i class="fa fa-user color-gray-light"></i> <a href="#">作者:黃金鼠</a>
								</div>
								<!-- End Author Name -->
								<!-- Date -->
								<div class="blog-post-details-item blog-post-details-item-left">
									<i class="fa fa-calendar color-gray-light"></i> <a href="#">${currentPost.post_time}</a>
								</div>
								<!-- End Date -->
								<!-- Tags -->
								<div
									class="blog-post-details-item blog-post-details-item-left blog-post-details-tags">
									<i class="fa fa-tag color-gray-light"></i> <a href="#">PHP</a>,
									<a href="#">Javascript</a>, <a href="#">CoffeeScript</a>
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
							<div class="blog-item">
								<div class="clearfix"></div>
								<div class="blog-post-body row margin-top-15">
									<div class="col-md-5">
										<img class="margin-bottom-20" src="imgs/mouse.PNG"
											alt="image1">
									</div>
									<div class="col-md-7">
										<p>我是一隻黃金鼠</p>
										<p>${currentPost.post_content}</p>
										<span hidden="true" id="postPK">${currentPost.post_idS}</span>
									</div>
									<div class="col-md-12">
										<p>我是一隻黃金鼠</p>
										<blockquote class="primary">
											<p>
												<em>"我是黃金鼠阿"</em>
											</p>
											<small> 黃金鼠 <cite title="Source Title">Source
													Title</cite>
											</small>
										</blockquote>
										<p>我是鼠 黃金鼠</p>
										<p>黃金鼠鼠鼠鼠鼠</p>
									</div>
								</div>
								<div class="blog-item-footer">
									<!-- About the Author -->
									<div class="blog-author panel panel-default margin-bottom-30">
										<div class="panel-heading">
											<h3>關於作者</h3>
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-md-2">
													<img class="pull-left" src="imgs/mouse.PNG" alt="image1">
												</div>
												<div class="col-md-10">
													<label>黃。金鼠</label>
													<p>我是一隻很長的鼠</p>
												</div>
											</div>
										</div>
									</div>
									<!-- End About the Author -->
									<!-- Comments -->
									<div id="comments"
										class="blog-recent-comments panel panel-default margin-bottom-30">
										<div class="panel-heading">
											<h3>評論</h3>
										</div>
										<ul class="list-group" id="0106Test">
											<!-- Comment Form -->
											<li class="list-group-item">
												<div class="blog-comment-form">
													<div class="row margin-top-20">
														<div class="col-md-12">
															<div class="pull-left">
																<h3>留下評論</h3>
															</div>
														</div>
													</div>
													<div class="row margin-top-20">
														<div class="col-md-12">
															<form action="<c:url value="/personalPage/PostComment.controller"/>" method="post">>
																<input hidden="true" value="${currentPost.post_idS}" name="post_idSReff">
																<input hidden="true" value="${user.member_username}" name="member_username">
																
																<label>姓名</label>
																<div class="row margin-bottom-20">
																	<div class="col-md-7 col-md-offset-0">
																		<input class="form-control" type="text" id="name" readonly="readonly" value="${user.member_nickname}">
																	</div>
																</div>
																<label>Email <span>*</span>
																</label>
																<div class="row margin-bottom-20">
																	<div class="col-md-7 col-md-offset-0">
																		<input class="form-control" type="text" id="email" readonly="readonly" value="${user.member_email}" >
																	</div>
																</div>
																<label>內容</label>
																<div class="row margin-bottom-20">
																	<div class="col-md-11 col-md-offset-0">
																		<textarea class="form-control" rows="8" id="comment" name="post_content"></textarea>
																	
																	</div>
																</div>
																<p>
																	<button class="btn btn-primary" type="submit"
																		id="commit">送出</button>
																</p>
															</form>
														</div>
													</div>
												</div>
											</li>
											<!-- End Comment Form -->
										</ul>
									</div>
									<!-- End Comments -->
								</div>
							</div>
						</div>
						<!-- End Blog Post -->
					</div>
					<!-- End Main Column -->
					<!-- Side Column -->
					<br>
					<div class="col-md-3">
						<!-- Blog Tags -->
						<div class="blog-tags">
<!-- 							<h3>搜尋文章</h3> -->
							<ul class="blog-tags">
<!-- 					<!-- 搜尋文章 -->
<!-- 						<form class="form-inline"> -->
<!-- 							<input class="form-control mr-sm-2" type="search" -->
<!-- 								placeholder="搜尋" aria-label="Search"> -->
<!-- 							<button class="btn btn-outline-success" type="submit">搜尋</button> -->
<!-- 						</form> -->
						</ul>
						</div>
						<!-- End Blog Tags -->
						<!-- Recent Posts -->
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
										</a> <a href="#" class="posts-list-title">第三篇</a>
										<br> <span class="recent-post-date">2019.01.03
										</span>
									</div>
									<div class="clearfix"></div>
								</li>
								<br>
								<li>
									<div class="recent-post">
										<a href=""> <img class="pull-left"
											src="../img/blog/thumbs/thumb4.jpg"
											style="width: 100px; height: 90px" alt="thumb4">
										</a> <a href="#" class="posts-list-title">第四篇</a>
										<br> <span class="recent-post-date">2018.05.06
										</span>
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
	<!-- === END CONTENT === -->
	<!-- 	showAllCommentFromArticle start-->
	<script>
        $(function () {            
            $.ajax({
                url: "/roy/personalPage/showAllCommentFromArticle.controller",   //存取Json的網址             
                type: "POST",
                cache:false,
                dataType:'json',
                data:{post_idS:$('#postPK').text()},
                //contentType: "application/json",              
				success : function(list)
				 {   
					list.forEach(function(obj, index) {
						console.log(obj.post_time)
// 								<li class='list-group-item'>
// 									<div class='row'>
// 										<div class='col-md-2 profile-thumb'>
// 											<a href='#'> <img class='media-object'
// 												src='../img/profiles/99.jpg' alt=''>
// 											</a>
// 										</div>
// 										<div class='col-md-10'>
// 											<h4>真是篇好文章</h4>
// 											<p>我完全了解你是隻黃金鼠</p>
// 											<span class='date'> <i
// 												class='fa fa-clock-o color-gray-light'></i>1 hours ago
// 											</span>
// 										</div>
// 									</div>
// 								</li>
						var temp = "	<li class='list-group-item'>"
												+"<div class='row'>"
												+"<div class='col-md-2 profile-thumb'>"
													+"<a href='#'> <img class='media-object'"
													+	"src='../img/profiles/99.jpg' alt=''>"
													+"</a>"
												+"</div>"
												+"<div class='col-md-10'>"
													+"<h4>"+obj.member_username+"</h4>"
													+"<p>"+obj.post_content+"</p>"
													+"<span class='date'> <i"
													+"	class='fa fa-clock-o color-gray-light'></i>"+obj.post_time
													+"</span>"
											+"</div>"
										+"</li>"
// 						var button = "<a  class='btn btn-primary'  href='/roy/personalPage/singleArticle.controller?post_idS=" + obj.post_idS + "'>查看全文</a>"
// 				        var div =  img+content + time + button +"<br></br>";
				        $('#0106Test').append(temp); 
				  	})
				  },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });

        });
    </script>
	<!-- 	showAllCommentFromArticle end-->
	
	<!-- === BEGIN FOOTER === -->
	<jsp:include page="../homePage/footer.jsp" />
	<!-- END Footer Menu -->
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="../homePage/player.jsp"/> --%>
<!-- 	</div> -->
	
	
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

	<script>
	$('#commit').click(function() {
// 			alert($('#name').val());
// 			alert($('#email').val());
// 			alert($('#comment').val());
			var comment;
			comment = $('#comment').val();
			if (comment == "") {
				alert("內容不能為空白");
				
			}else{
				$("#comments").innerHTML="";
			}
			
		})
	</script>
</body>
</html>
<!-- === END FOOTER === -->