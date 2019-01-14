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

	var sort;
	
	function mover(e){
		e.setAttribute("class", "play2")
	}
	function mout(e){
		e.setAttribute("class", "play");
	}
	function addList(playlist_id){
		$.getJSON('report.searchPlaylistMusic',{'playlist_id':playlist_id},function(data){
		    $.each(data,function(index,music){
		    	ap.list.add([{
					title : music.Music_name,
					author : music.Member_username,
					url : music.Music_music,
					pic : music.Music_Image
				}])
		    	});
		    })
	}
	
	$(document).ready(function() {
		sort = $('#type li.active').attr("sort");
		loadLists(sort);
		function loadLists(sort){
			$('#list-Container').html("");
			$.getJSON('report.readPlayList',{'sort':sort},function(data){
				var docFrag = $(document.createDocumentFragment());
				$.each(data,function(index,list){
					var row = $("<div class='col-md-3 col-sm-6 col-xs-6 m-bottom-8 item_box'></div>").html(
					'<div class="work-block m-bottom-2">'+
					'<a href="/roy/personalPage/locateToPlayList?playListId='+list.playlist_id+'"><img class="img-full" height="100%" width="100%"'+
					'src="'+list.playlist_image+'">'+
					'</a><input id="playButton" class="play" onmouseover="mover(this)" onmouseout="mout(this)" onclick="addList('+list.playlist_id+')" type="image" src = "../img/player.png" height="50" width="50"></div><div class="song-info">'+
					'<h4 class="text-ellipsis"><a href="/roy/personalPage/locateToPlayList?playListId='+list.playlist_id+'">'+list.playlist_name+'</a></h4></div>'
					)
					docFrag.append(row);
				});
			$('#list-Container').html(docFrag)
			});
		};
		
		//取消a默認
		$('#content a').on('click',function(event){
			event.preventDefault();
		});
		//取消a默認		

		//排序
		$('#type li').click(function() {
			$(this).parent('ul').children('li').removeClass('active');
			$(this).addClass('active');
			sort = $('#type li.active').attr("sort");
			loadLists(sort);
		})
		//排序
		
		$('#playButton').hover(function() {
		src = $( this ).attr("src");
		$( this ).attr("src","../img/player.png");
	  }, function() {
		 $( this ).attr("src",src);
	  })
	})
</script>
<style>
.play {
	width: 60px;
	-webkit-filter: invert(70%);
	cursor: pointer;
}

.play2 {
	width: 60px;
	cursor: pointer;
}
#playButton{
  position: absolute;
  bottom:50%;
  right: 40%;
}
</style>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<!--選單 -->
		<div id="content">
			<div class="container">
				<div class="container">
					<div class="row margin-vert-30">
						<ul class="nav nav-tabs m-bottom-6">
							<li class="active"><a>最新推薦</a></li>
						</ul>
						<div class="collapse in" id="collapse-filter">
							<form class="form-horizontal p-bottom-4">
								<div class="form-group">
									<label class="col-sm-1 control-label text-muted"><small>類型</small></label>
									<div class="col-sm-11">
										<ul id="type" class="nav nav-pills nav-sm">
											<li class="active" sort="playlist_registerTime"><a class="dynamic" href="#">最多喜歡</a></li>
											<li sort="playlist_musicCount"><a class="dynamic" href="#">最多播放</a></li>
											<li sort="playlist_privacy"><a class="dynamic" href="#">最新上傳</a></li>
										</ul>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--選單 -->
	</div>

	<!-- 歌單	 -->
	<div class="container">
		<div id="list-Container" class="row margin-vert-30">
		
			<div class="col-md-3 col-sm-6 col-xs-6 m-bottom-8 item_box">
				<div class="work-block m-bottom-2">
					<a href="/roy/searchMusic/songList.jsp"><img class="img-full"
						src="https://cfstatic.streetvoice.com/playlist_images/da/rk/darkbluew/zyjhmW5MGAhKpxtKPBBbSD.jpg?x-oss-process=image/resize,m_fill,h_260,w_260,limit_0/interlace,1/quality,q_85/format,jpg"></a>
						<input id="playButton" type="image" src = "../img/left.JPG" height="50" width="50">
				</div>
				<div class="song-info">
					<h4 class="text-ellipsis">
						<a href="/roy/searchMusic/songList.jsp">他們的瘋狂幽默</a>
					</h4>
				</div>
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