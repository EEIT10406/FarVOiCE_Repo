<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FarVoice</title>
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
td {
	width: 50px;
}
</style>
<script>
<!-- // 判斷是否輸入歌單名稱 begin -->
	<c:if test="${not empty errors}">
	alert("${errors.emptyValue}");
	</c:if>
	<!-- //  判斷是否輸入歌單名稱 end  -->

	<!-- // 判斷歌單新增是否成功 begin -->
	<c:if test="${not empty result}">
	alert("${result}");
	</c:if>
	<!--
// 判斷歌單新增是否成功 end  -->
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<div id="content" style="margin-left: 250px; margin-top: 50px;">
			<!-- 每頁不同的內容從這裡開始 -->
			<table id="playListTable" class="table table-bordered"
				style="width: 750px;">
				<thead>
					<tr>
						<th>圖片</th>
						<th>歌單名稱</th>
						<th>隱私</th>
						<th>歌曲數量</th>
						<th>管理</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td name="playlist_id"></td>
						<td><img src="../img/left.JPG"
							style="width: 100px; height: 100px;" /></td>
						<td style="font-size: 15px;">蕭氏情歌</td>
						<td style="font-size: 15px;">公開</td>
						<td style="font-size: 15px;">2</td>
						<td><button class="btn btn-primary pull-right">刪除</button></td>
					</tr>

				</tbody>
				<tfoot>

					<tr>
						<form action="<c:url value="/list/createPlayList" />"
							enctype="multipart/form-data" method="post">
							<input type="hidden" id="playListId"><span></span>
							<td><input type="file" id="imageFile" accept="image/*"
								name="imageFile"></td>
							<td><input type="text" style="width: 100px"
								class="form-control" id="playlist_name" name="playlist_name"
								placeholder="歌單名稱"></td>
							<td><select name="playlist_privacy">
									<option value="true">公開</option>
									<option value="false">隱藏</option>
							</select></td>
							<td><input type="hidden" name=""><span></span></td>
							<td><input class="btn btn-primary pull-right" type="submit"
								value="新增"></td>
						</form>
					</tr>
				</tfoot>
			</table>

			<!-- 編輯歌單 begin-->
			<div class="modal fade" id="editPLayList" aria-hidden="true">
				<div class="modal-dialog" style="width: 795px;">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">歌曲列表</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<table id="playListMusicTable" class="table table-bordered"
								style="width: 750px;">
								<thead>
									<tr>
										<th>圖片</th>
										<th>歌曲名稱</th>
										<th>作者</th>
										<th>發佈時間</th>
										<th>管理</th>
									</tr>
								</thead>
								<tbody>
<!-- 									<tr> -->
<!-- 										<td name="music_id"></td> -->
<!-- 										<td><img src="../img/left.JPG" -->
<!-- 											style="width: 100px; height: 100px;" /></td> -->
<!-- 										<td style="font-size: 15px;">買綁</td> -->
<!-- 										<td style="font-size: 15px;">julia</td> -->
<!-- 										<td style="font-size: 15px;">2018-12-12</td> -->
<!-- 										<td><button class="btn btn-primary pull-right">刪除</button></td> -->
<!-- 									</tr> -->
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<!-- 編輯歌單 end-->

			<!-- 每頁不同的內容到這裡結束 -->
		</div>
	</div>


	<jsp:include page="../homePage/footer.jsp" />
<!-- 	<div id="player"> -->
<%-- 		<jsp:include page="../homePage/player.jsp" /> --%>
<!-- 	</div> -->

	<script>
		$(document).ready(function() {
			//loadList('${playListBean.member_username}');
			loadList('Peter');
			//loadList('${ListMusicBean.id.playlist_id}');
			//loadListMusic(1)
				
		})
</script>
<script>
		//讀取歌單
		function loadList(username) {
			$.getJSON('/roy/list/readPlayList',{'username' : username},function(data) {
					var docFrag = $(document.createDocumentFragment());
					$.each(data,function(index, list) {
						var cell1 = $('<td name="playlist_id"></td>').text(list.playlist_id)
						var img = $("<img>");
						$(img).attr({"src" : list.playlist_image,"style" : "width: 100px; height: 100px;"});
						var cell2 = $('<td></td>').append(img)
						var cell3 = $('<td name="playlist_name"></td>').append($('<span>'))
						.attr({"style" : "cursor:pointer;font-size: 15px;","data-toggle" : "modal",
								"data-target" : "#editPLayList","id" : "editList"}).text(list.playlist_name)
							if (list.playlist_privacy == "true") {
								var cell4 = $('<td name="playlist_privacy"></td>').attr("style","font-size: 15px;").text("公開")
							} else {
								var cell4 = $('<td name="playlist_privacy"></td>').attr("style","font-size: 15px;").text("隱藏")
							}
						var cell5 = $('<td name="playlist_musicCount"></td>').attr("style","font-size: 15px;").text(list.playlist_musicCount)
						var cell6 = $('<td></td>').html('<button class="btn btn-primary pull-right" >刪除</button>')
						//<tr><td>
						var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6 ])
						docFrag.append(row);})
						$('#playListTable>tbody').html(docFrag);
						$('td[name="playlist_id"]').hide();
		        })
		}

		//刪除歌單
		$('#playListTable>tbody').on('click', 'button:nth-child(1)',
				function() {
					var row = $(this).parents('tr');
					var playlist_id = row.children('td:nth-child(1)').text();
					//ajax 把 productId傳到ProductsDelete.java
					$.get('/roy/list/deletePlayList', {
						'playlist_id' : playlist_id
					}, function(data) {
						alert(data)
						loadList('Jack');
					})
				})
</script>	
			
<script>
		//讀取歌單裡的音樂
		function loadListMusic(playListId) {
			$.getJSON('/roy/list/readPlayListMusic',
							{'playListId' : playListId},
							function(data) {
								var docFrag = $(document.createDocumentFragment());
								$.each(data,function(index, list) {
									var cell1 = $('<td name="music_id"></td>').text(list.music_id)
									var img = $("<img>");
									$(img).attr({"src" : list.music_music,"style" : "width: 100px; height: 100px;"});
									var cell2 = $('<td></td>').append(img)
									var cell3 = $('<td name="music_name"></td>').attr("style","font-size: 15px;").text(list.music_name)
									var cell4 = $('<td name="member_username"></td>').attr("style","font-size: 15px;").text(list.member_username)
									var cell5 = $('<td name="music_uploadTime"></td>').attr("style","font-size: 15px;").text(list.music_uploadTime)
									var cell6 = $('<td></td>').html('<button class="btn btn-primary pull-right" >刪除</button>')
													//<tr><td>
									var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5,cell6 ])
									docFrag.append(row);
							})
								$('#playListMusicTable>tbody').html(docFrag);
								$('td[name="music_id"]').hide();
					})
		}
		$('#playListTable>tbody').on('click', 'td:nth-child(3)',
				function() {
					var row = $(this).parents('tr');
					var playlist_id = row.children('td:nth-child(1)').text();
					loadListMusic(playlist_id)	
					
					//刪除歌單裡的音樂
					$('#playListMusicTable>tbody').on('click', 'button:nth-child(1)',function() {
					var row = $(this).parents('tr');
					var music_id = row.children('td:nth-child(1)').text();
					
					$.get('/roy/list/deletePlayListMusic', {'music_id' : music_id,'playlist_id':playlist_id}, function(data) {
						loadListMusic(playlist_id)
						loadList('Peter')
					})
				})
		})
				

     
				
		
		
			
		
	</script>

</body>
</html>