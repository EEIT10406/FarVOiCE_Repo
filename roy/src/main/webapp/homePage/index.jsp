<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- Title -->
<title>FarVOiCE</title>
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
<!-- End JS -->

</head>
<body>
	<div id="body_bg">
	
		<jsp:include page="header.jsp" />
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container no-padding">
				<div class="row"></div>
				<!-- Carousel Slideshow -->
				<div id="carousel-example" class="carousel slide"
					data-ride="carousel">
					<!-- Carousel Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#carousel-example" data-slide-to="0"
							class="active"></li>
						<li data-target="#carousel-example" data-slide-to="1"></li>
						<li data-target="#carousel-example" data-slide-to="2"></li>
					</ol>
					<div class="clearfix"></div>
					<!-- End Carousel Indicators -->
					<!-- 					Carousel Images -->
					<div class="carousel-inner">
						<div class="item active">
							<img src="../img/slideshow/slide1.jpg">
						</div>
						<div class="item">
							<img src="../img/slideshow/slide2.jpg">
						</div>
						<div class="item">
							<img src="../img/slideshow/slide3.jpg">
						</div>
						<div class="item">
							<img src="../img/slideshow/slide4.jpg">
						</div>
					</div>
					<!-- End Carousel Images -->
					<!-- Carousel Controls -->
					<a class="left carousel-control" href="#carousel-example"
						data-slide="prev"> <img src="../img/left.JPG" />
					</a> <a class="right carousel-control" href="#carousel-example"
						data-slide="next"> <img src="../img/right.JPG" />
					</a>

					<!-- End Carousel Controls -->
				</div>
				<!-- End Carousel Slideshow -->
			</div>
		</div>
	
		<div class="container">
			<div class="row margin-vert-30">
				<!-- Main Text -->
				<div class="col-md-9" style="float: left; width: 380px;">
					<h2>本日精選</h2>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud
						exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
						commodo consequat.</p>
					<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
						velit esse molestie consequat, vel illum dolore eu feugiat nulla
						facilisis at vero eros et accumsan et iusto odio dignissim qui
						blandit praesent luptatum zzril delenit augue duis dolore te
						feugait nulla facilisi. Cras non sem sem, at eleifend mi. Nam
						liber tempor cum soluta nobis eleifend option congue nihil
						imperdiet doming id quod mazim placerat facer possim assum.
						Curabitur eget nisl a risus.</p>
					
				</div>
				<div class="col-md-9" style="float: left; width: 380px;">
					<h2>熱門募資活動</h2>
					<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit,
						sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna
						aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud
						exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea
						commodo consequat.</p>
					<p>Duis autem vel eum iriure dolor in hendrerit in vulputate
						velit esse molestie consequat, vel illum dolore eu feugiat nulla
						facilisis at vero eros et accumsan et iusto odio dignissim qui
						blandit praesent luptatum zzril delenit augue duis dolore te
						feugait nulla facilisi. Cras non sem sem, at eleifend mi. Nam
						liber tempor cum soluta nobis eleifend option congue nihil
						imperdiet doming id quod mazim placerat facer possim assum.
						Curabitur eget nisl a risus.</p>
				
				</div>
				<!-- End Main Text -->
				<!-- Side Column -->
				<div  id="hottest" class="col-md-3" style="float: right">
					<h3 class="title">即時熱門排行</h3>
<!-- 					<h6 style="margin: 0;">Mon - Wed</h6> -->
<!-- 					<h4 style="margin: 0;">7:00 am - 1:30 pm</h4> -->
<!-- 					<p> -->
<!-- 						<small>* Lorem ipsum dolor sit amet</small> -->
<!-- 					</p> -->
<!-- 					<hr> -->
<!-- 					<button type="button" class="btn btn-primary" style="width:100%" onclick="window.location.href ='/roy/rank/rank.jsp'">媽的看排行喔</button> -->
				</div>
				<!-- End Side Column -->
			</div>
				<div class="container background-gray-lighter">
			<div class="row">
				<h2 class="animate fadeIn text-center margin-top-50">大家都在聽</h2>
				<hr class="margin-top-15">
				<p class="animate fadeIn text-center">
					Enlighten offers you the canvas to turn your imagination in to a
					reality <br>giving you the perfect framework for your project!
				</p>
				<p class="text-center animate fadeInUp margin-bottom-50">
					<button type="button" class="btn btn-lg btn-primary">View
						Details</button>
				</p>
				          <div class="row">
                     <!-- 小輪播 - Default Full Width -->
                     <div class="col-md-12">
                         <div class="carousel slide testimonials" id="testimonials1">
                             <ol class="carousel-indicators">
                                 <li class="active" data-slide-to="0" data-target="#testimonials-rotate">
                                 </li>
                                 <li data-slide-to="1" data-target="#testimonials1">
                                 </li>
                                 <li data-slide-to="2" data-target="#testimonials1">
                                 </li>
                             </ol>
                             <div class="carousel-inner">
                                 <div class="item active">
                                     <div class="col-md-12">
                                         <p>
                                             Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi
                                             porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                         </p>
                                         <div class="testimonial-info">
                                             <img alt="" src="assets/img/profiles/53.jpg" class="img-circle img-responsive" />
                                             <span class="testimonial-author">
                                                 Cristina Hall
                                                 <em>
                                                     Javascript Developer, Business Inc.
                                                 </em>
                                             </span>
                                         </div>
                                     </div>
                                     <div class="clearfix"></div>
                                 </div>
                                 <div class="item">
                                     <div class="col-md-12">
                                         <p>
                                             Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem.
                                             Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.
                                         </p>
                                         <div class="testimonial-info">
                                             <img alt="" src="assets/img/profiles/99.jpg" class="img-circle img-responsive" />
                                             <span class="testimonial-author">
                                                 Anthony Watkins
                                                 <em>
                                                     Web Developer, Amazing Designs Ltd.
                                                 </em>
                                             </span>
                                         </div>
                                     </div>
                                     <div class="clearfix"></div>
                                 </div>
                                 <div class="item">
                                     <div class="col-md-12">
                                         <p>
                                             Cras justo odio, dapibus ac facilisis in, egestas eget quam. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Donec id elit non mi
                                             porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                                         </p>
                                         <div class="testimonial-info">
                                             <img alt="" src="assets/img/profiles/78.jpg" class="img-circle img-responsive" />
                                             <span class="testimonial-author">
                                                 Jonathan Baker
                                                 <em>
                                                     CEO  Founder, Virtuoso Inc.
                                                 </em>
                                             </span>
                                         </div>
                                     </div>
                                     <div class="clearfix"></div>
                                 </div>
                             </div>
                         </div>
                         <div class="testimonials-arrows pull-right">
                             <a class="left" href="#testimonials1" data-slide="prev">
                                 <span class="fa fa-arrow-left"></span>
                             </a>
                             <a class="right" href="#testimonials1" data-slide="next">
                                 <span class="fa fa-arrow-right"></span>
                             </a>
                             <div class="clearfix"></div>
                         </div>
                     </div>
                     <!-- End 小輪播 - default full width -->
                 </div>
			</div>
		</div>
		</div>

	</div>
	<!-- === END CONTENT === -->

            
	<jsp:include page="footer.jsp" />
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="player.jsp" /> --%>
<!-- 	</div> -->






	
<script>
function rank(){
	window.location.href ="/roy/rank/rank.jsp";
}
// 找出所有時間總點閱率最高的五筆音樂
$(function () {            
	$.ajax({
        url: "/roy/homePage/indexFindAllTimePlayCountTop5Music.controller",   //存取Json的網址             
        type: "POST",
        cache:false,
        dataType:'json',
        data:{user:$('#userName').text()},
		success : function(list){	
			list.forEach(function(obj, index) {
				// 	這邊的username是nickname
				console.log(obj) ; 
				var a = "<a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_username+"'>"+obj.member_username+"</a>";
				var content = "<h6 style='margin: 0;'><a href='/roy/personalPage/somebodyPersonalPage.controller?nickname="+obj.member_username+"'>"+obj.member_username+"</a></h6>";
				var content1 = "<h4 style='margin: 0;'>"+obj.music_name+"</h4><hr>";
				var div=content+content1;
				$('#hottest').append(div);
		  	})
		  	var button = "<button type='button' class='btn btn-primary' style='width:100%' onclick='rank()' >媽的看排行喔</button>";
			$('#hottest').append(button);
		},
        error: function (xhr, ajaxOptions, thrownError) {
            alert(xhr.status);
            alert(thrownError);
        }
     });
})
</script>













</body>
</html>