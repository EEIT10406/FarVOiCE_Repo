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
<script src="1.js?ver=1"></script>

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
							<div class="blog-item-header" >
								<!-- Title -->
								<h2>
									<a href="#">最新文章</a>
								</h2>
								<div class="clearfix"></div>
								<!-- End Title -->
							</div>
							<div id="articlePutHere"></div>
						</div>
						<!-- Pagination -->
						
						<ul class="pagination" id="ul1" style="cursor:pointer"></ul>
							
						
						
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
								<div id="search-div">
								<form class="form-inline"  action="">
									<input class="form-control mr-sm-2" type="search" id="search_new"
										placeholder="搜尋" aria-label="Search">
									<button class="btn btn-outline-success" type="button">搜尋</button>
								</form>
								</div>
							</ul>
						</div>		
						<hr>
						<br>
						<div class="recent-posts">
							<h3>最近新增文章</h3>
							<ul class="posts-list margin-top-10" id="newArticle">	
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

<script>
var allArticle; //放資料
var start; //從第幾筆開始
var currentPage=1;//目前頁數
var ShowPage;//總頁數
var count = 3;//一次幾筆
var NumOfJData;//總筆數

function doPage(){
	console.log(event.currentTarget);
	page = event.currentTarget.innerHTML;//當前頁數
	currentPage = parseInt(event.currentTarget.innerHTML);//把當前頁數存到 currentPage
	$(".pagination li").attr("class","");
	$(event.currentTarget).parents('li').attr("class","active");
	start = page*count-count;
	showData(start);
}
function preP(){
	if(currentPage!=1){
		currentPage=currentPage-1;
		console.log("page-->"+currentPage);
		$(".pagination li").attr("class","");
		$(".pagination li:nth-child("+(currentPage+1)+")").attr("class","active");
		start = currentPage*count-count;
		showData(start);
	}else{	
		alert("已經是第一頁囉~");
	}	
}
function NextP(){	
	if(currentPage!=ShowPage){
		currentPage=currentPage+1;
		console.log("page-->"+currentPage);
		$(".pagination li").attr("class","");
		$(".pagination li:nth-child("+(currentPage+1)+")").attr("class","active");
		start = currentPage*count-count;
		showData(start);
	}else{		
		alert("已經最後一頁~");		
	}	
}

function showData(token){
	console.log("從第幾筆抓--->"+token);
	$("#articlePutHere").html("");
	var div ="";
	for(var i=token;i<token+count;i++){
			var Blog_Item_Details = 
			"<div class='blog-post-details'>"+
			"<div class='blog-post-details-item blog-post-details-item-left'>"+
				"<i class='fa fa-user color-gray-light'></i><a href='#'>作者:"+allArticle[i].member_nickname+
				"</a>"+
			"</div>"+
			"<div class='blog-post-details-item blog-post-details-item-left'>"+
				"<i class='fa fa-calendar color-gray-light'></i> <a href='#'>"+allArticle[i].post_time+"</a>"+
			"</div>"+
			"<div class='blog-post-details-item blog-post-details-item-left blog-post-details-item-last'>"+
				"<a href=''> <i class='fa fa-comments color-gray-light'></i></a></div></div>";
				
			var Blog_Content = "<div class='blog'>"+
								 "<div class='clearfix'></div>"+
									"<div class='blog-post-body row margin-top-15'>"+
									   "<div class='col-md-7'>"+"<p>"+allArticle[i].post_content+"</p>"+
										"<a href='/roy/personalPage/singleArticle.controller?post_idS="+allArticle[i].post_idS+"'"+
						"class='btn btn-primary'>查看全文<i class='icon-chevron-right readmore-icon'></i>"+
					"</a></div></div></div></div><br><br><br><br>";
			$("#articlePutHere").append(Blog_Item_Details+Blog_Content);
	}
}
$(document).ready(function() {
	loadArticle();
	$("#search_new").keypress(function (event) {
		if (event.keyCode == 13) {
			$("form").submit(function () {
				return false;
			});
			var searchString = $("#search_new").val();
			loadArticle(searchString);
		}
	});
	
})



$('#search-div button').click(function(){
	var searchString = $('#search-div input').val();
	loadArticle(searchString);
})

//顯示畫面
function loadArticle (searchString) {
	$("#articlePutHere").html("");
	$("#newArticle").html("");
	var searchString = searchString ;
	
	$.ajax({
		url: "/roy/findArticle/findArticle.controller",       
		type: "POST",
		cache:false,
		dataType:'json',
		data:{'searchString':searchString},            
		success : function(list)
		{	
			allArticle=list;
			console.log(allArticle);
			NumOfJData = list.length; //NumOfJData=7 總筆數
			//總頁數 
			ShowPage = Math.ceil((NumOfJData/count));  
			
			//顯示總頁數
			if(typeof searchString =='undefined')
			{	
				
				$("#ul1").append("<li class=''><a onclick='return preP()';>&laquo;</a></li>");	
					for(var i=1;i<=ShowPage;i++){
						var pages ="<li class=''><a onclick='return doPage(this);'>"+i+"</a></li>"
						if(i==1){
						var pages ="<li class='active'><a onclick='return doPage(this);'>"+i+"</a></li>"
						}
						$("#ul1").append(pages);	
					}
					$("#ul1").append("<li class=''><a onclick='return NextP()'>&raquo;</a></li>");
			}else{
				$("#ul1").empty();
				count = NumOfJData;
			}
				
			
			
			
			//顯示首頁
			for(var i=0;i<count;i++){
				
				var Blog_Item_Details = 
					"<div class='blog-post-details'>"+
					"<div class='blog-post-details-item blog-post-details-item-left'>"+
						"<i class='fa fa-user color-gray-light'></i><a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+allArticle[i].member_nickname+
						"'>作者:"+allArticle[i].member_nickname+"</a>"+
					"</div>"+
					"<div class='blog-post-details-item blog-post-details-item-left'>"+
						"<i class='fa fa-calendar color-gray-light'></i> <a href='#'>"+allArticle[i].post_time+"</a>"+
					"</div>"+
					"<div class='blog-post-details-item blog-post-details-item-left blog-post-details-item-last'>"+
						"<a href=''> <i class='fa fa-comments color-gray-light'></i></a></div></div>";
						
					var Blog_Content = "<div class='blog'>"+
										 "<div class='clearfix'></div>"+
											"<div class='blog-post-body row margin-top-15'>"+
											   "<div class='col-md-7'>"+"<p>"+allArticle[i].post_content+"</p>"+
												"<a href='/roy/personalPage/singleArticle.controller?post_idS="+allArticle[i].post_idS+"'"+
								"class='btn btn-primary'>查看全文<i class='icon-chevron-right readmore-icon'></i>"+
							"</a></div></div></div></div><br><br><br><br>";
					$("#articlePutHere").append(Blog_Item_Details+Blog_Content);
					
				
			}
			//顯示最近新增
			for(var i=0;i<5;i++){
				var author = allArticle[i].member_nickname;
// 				if(author.length>6){
// 					author = author.substring(0,5)+"...";
// 				}
				var time = allArticle[i].post_time.substring(0,12);
				var content = allArticle[i].post_content;
				if(content.length>8){
					content = content.substring(0,5)+"...";
				}
				var postnumber = allArticle[i].post_idS;
				var profile = allArticle[i].member_profileImage;
				var newArticleContent = "<li style='border-bottom:1px solid #DDDDDD;padding-bottom:5px;margin-top:5px'>"+
				"<div class='recent-post'>"+
				"<a href='/roy/personalPage/singleArticle.controller?post_idS="+postnumber+"'>"+"<img class='pull-left' src='"+profile+"'"+
				"style='width: 100px; height: 90px' alt='thumb1'>"+
				"</a> <span><a href='/roy/personalPage/singleArticle.controller?post_idS="+postnumber+"'"+
				">"+content+"</a></span> <br><span><a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+author+
				"'><small style='color:black;'>"+author+"</small></a></span><br> <span class='recent-post-date'>"+time+"</span>"+
				"</div><div class='clearfix'></div></li>";
				$("#newArticle").append(newArticleContent);
				
				
			}

			

		  },
	      error: function (xhr, ajaxOptions, thrownError) {
	           alert(xhr.status);
	           alert(thrownError);
	      }
	   });
	}
	
</script>

</body>
</html>
<!-- === END FOOTER === -->