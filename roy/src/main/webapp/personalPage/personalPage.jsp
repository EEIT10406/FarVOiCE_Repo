<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<!-- Title -->
<title>FarVoice</title>
<!-- Meta -->
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link href="favicon.ico" rel="shortcut icon">

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="../css/bootstrap.css" rel="stylesheet">
<!-- Template CSS -->
<link rel="stylesheet" href="../css/animate.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="../css/nexus.css" rel="stylesheet">
<link rel="stylesheet" href="../css/responsive.css" rel="stylesheet">
<!-- Google Fonts-->
<link href="http://fonts.googleapis.com/css?family=Roboto:400,300"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300"
	rel="stylesheet" type="text/css">
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
<!-- End JS -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<style>
.post{
	float: left;

/* 	margin-top:30px; */
/* 	margin-bottom:150px; */

}
* {
	font-family: 微軟正黑體;
}

td {
	font-size: 17px;
	width: 75px;
	padding: 2px;
}

table {
	margin-top: 100px;
}

.number {
	color: #FF3333;
}

.unfollow {
	cursor: pointer;
	padding: 3px;
	margin-top: 10px;
	border: 0.5px solid #888888;
	width: 90px;
	float: left;
	text-align: center;
}

.follow {
	cursor: pointer;
	padding: 3px;
	margin-top: 10px;
	border: 0.5px solid #888888;
	width: 90px;
	float: left;
	text-align: center;
	background-color: #888888;
	color: #FFFFFF;
}

.dynamic {
	background-color: #dcdcdc;
	height: 200px;
	margin: 20px;
}

.heart {
	width: 17px;
}

.btnRyo {
	color: black;
	background-color: white;
	border: 0px;
}

.shareAndAdd {
	width: 50px;
	margin-top: 5px;
	padding: 5px;
	font-size: 13px;
	margin-left: 10px;
}

.heartCount {
	margin-top: 10px;
	font-size: 15px;
}

.music {
	border: 1px solid black; margin : 10px;
	width: 180px;
	margin: 10px;
}
</style>
<script>
	$(document).ready(function() {
		$('#login').click(function() {
			window.location.href = "login.jsp";
		})
		$('#upload').click(function() {
			window.location.href = "upload.jsp";
		})

		$('#follow').click(function() {
			if ($('#follow').attr("class") == "follow") {
				$('#follow').attr("class", "unfollow");
				$('#follow').html('追蹤');
			} else {
				$('#follow').attr("class", "follow");
				$('#follow').html('已追蹤');
			}
		})

	})
</script>
<script>
	$(document).ready(function() {
		var heart = document.querySelectorAll("img.heart");
		for (var i = 0; i < heart.length; i++) {
			heart[i].addEventListener("click", click);
		}
	})

	function click() {
		if (this.src.indexOf("love.png") != -1) {
			this.src = "../img/emptyLove.png";
		} else {
			this.src = "../img/love.png"
		}
	}
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div style="border: 0.5px solid #DDDDDD; align: center; height: 231px; margin-top: 30px; margin-bottom: 30px;">
					
					<c:choose>
					    <c:when test="${empty user}">
					      	<img src="imgs/noProfile.gif" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />
					    </c:when>
					    <c:otherwise>
							<img src="imgs/123.jpg" style="float: left; height: 230px; width: 230px; margin-right: 15px;" />					    </c:otherwise>
					</c:choose>
<!-- 					<img src="imgs/123.jpg" style="float: left; height: 230px; width: 230px; margin-right: 15px;" /> -->
					
					
					<div style="padding: 15px; font-size: 30px;">
					<c:choose>
					    <c:when test="${empty user}">
					       	阿腫
					    </c:when>
					    <c:otherwise>
					        ${user.member_nickname}
					    </c:otherwise>
					</c:choose>
					
					</div>
<!-- 					<div id="follow" class="unfollow">追蹤</div> -->
<!-- 					發布新動態按鈕 -->
					<form class="post">
						<input type="button" class="btn btn-primary"
							data-toggle="modal" data-target="#sharebox" value="發佈新動態">
<!-- 										style="outline: none;"> -->

					</form>
					<table>
						<tr>
							<td>音樂</td>
							<td>粉絲</td>
							<td>追蹤中</td>
						</tr>
						<tr>
							<td class="number">0</td>
							<td class="number">0</td>
							<td class="number">0</td>
						</tr>
					</table>


				</div>

				<!-- Tab v2 -->
				<div class="tabs alternative">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#dynamic" data-toggle="tab">動態</a>
						</li>
						<li><a href="#music" data-toggle="tab">音樂</a></li>
						<li><a href="#list" data-toggle="tab">歌單</a></li>
						<li><a href="#like" data-toggle="tab">喜歡</a></li>
						<li><a href="#about" data-toggle="tab">關於</a></li>
					</ul>
					
					<div class="tab-content" style="height: auto;">
					
						<div class="tab-pane fade in active" id="dynamic">
							<div id="test">
<!-- 								<img src="imgs/123.jpg" class="img-circle" style="width:45px;height:45px;float:left;margin-right:15px" > -->
<!-- 								<h4 style="margin-bottom:0px">發表了一篇文章</h4> -->
<!-- 								<small>9 小時前</small> -->
<!-- 								<div class="clearfix"></div> -->
							</div>
					
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
												<a  class="btn btn-primary" target="_blank" href="../findArticle/singleArticle.jsp"
													>
													查看全文
												</a>
												<!-- End Read More -->
											</div>
										</div>
									</div>
									<!-- End Blog Item Body -->
									</div>
								
								<!-- End Blog Item -->
						</div>
						<!-- End dynamic -->
<!-- 						<div class="tab-pane fade in active" id="dynamic"> -->
<!-- 				            <div class="dynamic"></div> -->
<!-- 							<div class="dynamic"></div> -->
<!-- 							<div class="dynamic"></div> -->
<!-- 							<div class="dynamic"></div> -->
<!-- 						</div> -->

						<div class="tab-pane fade in" style="overflow:auto;" id="music">
							<div>
								<div class="col-md-5" style="float:left;width:300px;">
									<a href=""><img src="../img/love.png"
										style="width: 160px; height: 160px;" /></a>

									<div style="font-size: 16px;">讓我為你唱情歌</div>
									<div>
										<img src="../img/emptyLove.png" class="heart"> <span
											class="heartCount"> 0</span> <span id="share"
											class="shareAndAdd"> <a href="" style="color: black;"><img
												src="../img/share.png" width="15px" />分享</a>
										</span> <span class="dropdown"> <span id="add"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"><button type="button"
													class="btnRyo" style="outline: none;">
													<img src="../img/add.png" width="15px">更多
												</button></span> <span class="dropdown-menu"
											style="background-color: white;">
												<button class="btnRyo" style="outline: none;" type="button"
													data-toggle="modal" data-target="#addToPlayList">加入歌單</button>
												<button class="btnRyo" style="outline: none;" type="button"
													data-toggle="modal" data-target="#createPlayList">建立歌單</button>
										</span>
										</span>
									</div>
								</div>
								<div class="col-md-5" style="float:left;width:300px;">
									<a href=""><img src="../img/love.png"
										style="width: 160px; height: 160px;" /></a>

									<div style="font-size: 16px;">讓我為你唱情歌</div>
									<div>
										<img src="../img/emptyLove.png" class="heart"> <span
											class="heartCount"> 0</span> <span id="share"
											class="shareAndAdd"> <a href="" style="color: black;"><img
												src="../img/share.png" width="15px" />分享</a>
										</span> <span class="dropdown"> <span id="add"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false"><button type="button"
													class="btnRyo" style="outline: none;">
													<img src="../img/add.png" width="15px">更多
												</button></span> <span class="dropdown-menu"
											style="background-color: white;">
												<button class="btnRyo" style="outline: none;" type="button"
													data-toggle="modal" data-target="#addToPlayList">加入歌單</button>
												<button class="btnRyo" style="outline: none;" type="button"
													data-toggle="modal" data-target="#createPlayList">建立歌單</button>
										</span>
										</span>
									</div>
								</div>
							</div>
						</div>
<!-- 						end music -->
						<div class="tab-pane fade in" id="list"></div>
						<div class="tab-pane fade in" id="like"></div>
						<div class="tab-pane fade in" id="about"></div>
					</div>
				</div>
			</div>
			<!-- End Tab v2 -->
		</div>
		</div>
	<!-- === END CONTENT === -->
	
	<!-- addPost begin-->
	<div class="modal fade" id="sharebox" aria-hidden="true">
		<div class="modal-dialog" style="width: 690px;">
			<div class="modal-content">
				<h5 style="margin: 20px;">發佈新動態</h5>
				
				<form action="<c:url value="/personalPage/Post.controller"/>" method="post">
					<div class="modal-body" >
						<textarea name="shareContent" style="width:100px;height:30px" placeholder="標題"></textarea>
						<textarea name="post_content" style="width:650px;height:500px" placeholder="是不在想些色色的呢?"></textarea>
						<input type="checkbox" name="post_privacy" value="true">不想被女友看到嗎?<br>					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
						<button type="submit" class="btn btn-primary">確定</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!-- addPost end-->
	
	<!-- 	showArticleFromMember start-->
	<script>
        $(function () {            
            $.ajax({
                url: "/roy/personalPage/showArticleFromMember.controller",   //存取Json的網址             
                type: "POST",
                cache:false,
                dataType:'json',
                data:{user:"Peter"},
                //contentType: "application/json",              
				success : function(list)
				 {   
					list.forEach(function(obj, index) {
// 						<img src='imgs/123.jpg' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >
// 						<h4style='margin-bottom:0px'>發表了一篇文章</h5>
// 						<small>9 小時前</small>
// 						<div class="clearfix"></div>
						var img = "<img src='imgs/123.jpg' class='img-circle' style='width:45px;height:45px;float:left;margin-right:15px' >";
						var content = "<h5 style='margin-bottom:0px'>發表了一篇文章</h5><small>9 小時前</small><div class='clearfix'></div>"+"<div>" + obj.post_content + "</div>";
						var time = "<h6>" + obj.post_time +"</h6>";
				        var div =  img+content + time +"<br>";
				        $('#test').append(div); 
				  	})
				  },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(xhr.status);
                    alert(thrownError);
                }
            });

        });
    </script>
	<!-- 	showArticleFromMember end-->
	
	
	
	
	

	<jsp:include page="../homePage/footer.jsp" />
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
<!-- 	</div> -->
</body>
</html>