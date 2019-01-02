<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script>
$(document).ready(function() {
	
	$('tbody img').attr("width",45);
	$('tbody img').attr("height",45);
	
	$('tbody img').hover(function() {
		src = $( this ).attr("src");
		$( this ).attr("src","../img/player.png");
	  }, function() {
		 $( this ).attr("src",src);
	  })
	
	$('#playButton').hover(function() {
		src = $( this ).attr("src");
		$( this ).attr("src","../img/player.png");
	  }, function() {
		 $( this ).attr("src",src);
	  })
})
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
	</div>
	
	<div class="container">
		<div class="row margin-vert-30">
		
<!--單頭 -->
<div class="container">
            <div class="row ">
                <div class="col-md-8 m-top-6 m-bottom-6">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-sm-3 col-xs-4">
                            <div class="work-block">
                                <img class="img-full" src="https://cfstatic.streetvoice.com/playlist_images/da/rk/darkbluew/zyjhmW5MGAhKpxtKPBBbSD.jpg?x-oss-process=image/resize,m_fill,h_260,w_260,limit_0/interlace,1/quality,q_85/format,jpg">
                            </div><!-- /work-block -->
                        </div><!-- /col-lg-3 -->
                        <div class="col-lg-9 col-md-8 col-sm-9 col-xs-8">
                        
                            <h1 class="m-top-0 m-bottom-1 h1-max-two-hide text-white line-height-sm">他們的瘋狂幽默</h1>

                            <table class="table table-noborder m-top-1 m-bottom-0">
                                <tbody>
                                    <tr>
                                        <th>曲數</th>
                                        <td class="text-white">294</td>
                                    </tr>
                                    <tr>
                                        <th>更新</th>
                                        <td class="text-white">2018 年 12 月 28 日</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- /col-lg-9 -->
                    </div><!-- /row -->
                </div><!-- /col-md-8 -->
            </div><!-- /row -->
        </div>
<!--單頭 -->

<!--播放鈕 -->
<div class="col-xs-5">
                            <h4 class="text-red">
                                <input id="playButton" type="image" src = "../img/left.JPG" height="50" width="50">
                            </h4>
                        </div>
                        <!--播放鈕 -->
                        
		<!-- 歌單	 -->
			<div class="col-md-8">
                <div class="p-top-8 p-bottom-6">
                    <div class="p-top-2 work-content">
                        <ul id="albumTab" class="nav nav-tabs m-bottom-6 mobile-nav-justified">
                            <li class="active">曲目</li>
                        </ul><!-- /nav-tabs -->
                        <div id="albumTabContent" class="tab-content">
                            <div class="min-height-300 tab-pane fade in active" id="songlist">
                                <table class="table table-hover table-song" id="item_box_list">
                                    <thead>
                                        <tr>
                                            <th class="text-center width-9">排序</th>
                                            <th>歌曲名稱</th>
                                            <th>作者</th>
                                            <th class="mobile-hide">長度</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        
                                            
<tr class="item_box">
    <th class="text-center font-size-slarge">1</th>
    <td>
        <div class="work-block img-xs pull-left m-right-2">
            <a href="/hideto810006/songs/112663/"><img class="img-full" src="https://cfstatic.streetvoice.com/music_albums/hi/de/hideto810006/668734bd34ae4ee4b87d321f14dcf660.jpg?x-oss-process=image/resize,m_fill,h_44,w_44,limit_0/interlace,1/quality,q_85/format,jpg"></a>
        </div>
        


    <h4><a href="/hideto810006/songs/112663/">Cheer</a></h4>
    </td>
    
    
        <td><a href="/hideto810006/">Josh (from MSF)</a></td>
        <td class="mobile-hide">05:44</td>
    
</tr>  
<tr class="item_box">
    <th class="text-center font-size-slarge">1</th>
    <td>
        <div class="work-block img-xs pull-left m-right-2">
            <a href="/hideto810006/songs/112663/"><img class="img-full" src="https://cfstatic.streetvoice.com/music_albums/hi/de/hideto810006/668734bd34ae4ee4b87d321f14dcf660.jpg?x-oss-process=image/resize,m_fill,h_44,w_44,limit_0/interlace,1/quality,q_85/format,jpg"></a>
        </div>
        


    <h4><a href="/hideto810006/songs/112663/">Cheer</a></h4>
    </td>
    
    
        <td><a href="/hideto810006/">Josh (from MSF)</a></td>
        <td class="mobile-hide">05:44</td>
    
</tr>  
<tr class="item_box">
    <th class="text-center font-size-slarge">1</th>
    <td>
        <div class="work-block img-xs pull-left m-right-2">
            <a href="/hideto810006/songs/112663/"><img class="img-full" src="https://cfstatic.streetvoice.com/music_albums/hi/de/hideto810006/668734bd34ae4ee4b87d321f14dcf660.jpg?x-oss-process=image/resize,m_fill,h_44,w_44,limit_0/interlace,1/quality,q_85/format,jpg"></a>
        </div>
        


    <h4><a href="/hideto810006/songs/112663/">Cheer</a></h4>
    </td>
    
    
        <td><a href="/hideto810006/">Josh (from MSF)</a></td>
        <td class="mobile-hide">05:44</td>
    
</tr>  

                                    </tbody>
                                </table>
                                
<div id="js-loader" class="text-center m-top-4 m-bottom-4">
  <button class="btn btn-default btn-loadmore" type="button">更多</button>
</div><!-- /text-center -->
                            </div><!-- /tab-pane -->
                        </div><!-- /tab-content -->
                    </div><!-- /p-top-2 -->
                </div><!-- /p-top-4 p-bottom-6 -->
            </div>
		</div>
	</div>
	<!-- 歌單	 -->

	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
</body>
</html>