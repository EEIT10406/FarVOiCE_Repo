<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarVOiCE</title>
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

<style>
.play {
	width: 60px;
	-webkit-filter: invert(100%);
	cursor: pointer;
}

.play2 {
	width: 60px;
	cursor: pointer;
}

.musicName{
cursor: pointer;
}
</style>
<script>
	$(document).ready(function() {
		
		$('td[name="musicId"]').hide();
				$('.play').on('mouseover', function() {
					this.setAttribute("class", "play2")
				})

				$('.play').on('mouseout', function() {
					this.setAttribute("class", "play");
				})
				
				
	//點音樂去音樂頁面
	$('.musicName').on('click',function(){
		var row = $(this).parents('#row');
		var musicId = row.children('td[name="musicId"]').text();
		
		window.location.href = "/roy/musicPage/findMusicById?musicId="+musicId;
		
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
				<div
					style="border-bottom: 0.5px solid #DDDDDD; align: center; height: 180px; margin-top: 30px; margin-bottom: 20px;">

					<img src="${playListBean.playlist_image}"
						style="float: left; height: 176px; width: 176px; margin-right: 15px;" />

					<div style="padding-top: 10px; font-size: 25px;">${playListBean.playlist_name}</div>

					<table style="margin-top: 20px;">
					    <tr>
							<td style="font-size: 13px; font-weight: bold;">建立者 :</td>
							<td style="padding: 5px; font-size: 15px;"><a href="/roy/personalPage/somebodyPersonalPage.controller?nickname=${playListBean.member_nickname}">${playListBean.member_nickname}</a></td>
						</tr>
						<tr>
							<td style="font-size: 13px; font-weight: bold;">歌曲數量 :</td>
							<td style="padding: 5px; font-size: 15px;">${playListBean.playlist_musicCount}</td>
						</tr>

						<tr>
							<td style="font-size: 13px; font-weight: bold;">建立時間 :</td>
							<td id="date" style="padding: 5px; font-size: 15px;">
							<fmt:formatDate value="${playListBean.playlist_registerTime}" type="date" />
							</td>
						</tr>
					</table>

				</div>


				<!-- content begin -->
				<div style="margin-bottom: 150px;">

					<table style="width: 700px; height: auto;border-collapse: separate; border-spacing:10px;">
						<thead>
							<tr>
								<th style="height: 50px;"></th>
								<th style="height: 50px;">歌曲名稱</th>
								<th style="height: 50px;">發佈者</th>
								<th style="height: 50px;">發佈時間</th>

							</tr>
						</thead>
						<tbody>

							<c:forEach var="musicbean" items="${musicBeans}">
								<tr id="row">
								    <td name="musicId">${musicbean.music_id}</td>	
									<td style="text-align: center;">
									   <c:if test="${fn:indexOf(musicbean.music_name, ' (該歌曲已下架)') == -1}" >
									    <img src="../img/player.png" class="play" 
									    onclick="play('${musicbean.music_name}','${musicbean.member_username}',
									    '${musicbean.music_music}','${musicbean.music_Image}','${musicbean.music_id}')"
									     />
									    </c:if>
									</td>
									<td>
									   <img src="${musicbean.music_Image}" style="width: 70px; height: 70px;" />						
									    <c:choose>
									       <c:when test="${fn:indexOf(musicbean.music_name, ' (該歌曲已下架)') == -1}" >
									          <span class="musicName">${musicbean.music_name}</span>
									       </c:when>
									       <c:otherwise>
                                                  ${musicbean.music_name}
                                           </c:otherwise>
									    </c:choose>	
									</td>
									<td style="font-size: 15px;">
									      <a href="/roy/personalPage/somebodyPersonalPage.controller?nickname=${musicbean.member_username}">
									               ${musicbean.member_username}
									      </a>
									</td>
									<td style="font-size: 15px;">
									    <fmt:formatDate value="${musicbean.music_uploadTime}" type="date" />
									</td>
								</tr>
							</c:forEach>

						</tbody>

					</table>

				</div>

				<!-- content end -->


			</div>
		</div>
	</div>


	<jsp:include page="../homePage/footer.jsp" />
	<!--播放器 -->
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>
	<script>
	function play(music_name,member_username,music_music,music_Image,music_id){
		ap.list.add([{
			title : music_name,
			author : member_username,
			url : music_music,
			pic : music_Image
		}]);
		$(ap.audio).attr('music_id',music_id);
	}
	</script>
	<!--播放器 -->
</body>
</html>