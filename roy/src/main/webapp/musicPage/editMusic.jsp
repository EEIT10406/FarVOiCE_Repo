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
document.addEventListener("DOMContentLoaded", function() {
	$('#musicId').hide();
	document.getElementById("picFile").addEventListener("change",fileViewer);
});

function fileViewer() {
	//取得使用者在檔案選擇標籤中選取檔案
	var files = document.getElementById("picFile").files;
	for (i = 0; i < files.length; i++) {
		//1. 建立FileReader物件
		var reader = new FileReader();

		//3.onload資料讀取成功完成時觸發
		reader.addEventListener("load", function(e) {

			document.getElementById("picArea").innerHTML = "";
			//4. 將檔案內容暫存
			var filecontent = e.target.result;

			//5. 建立img標籤
			var eleimg = document.createElement("img");

			//6. 設定img的src屬性
			eleimg.setAttribute("src", filecontent);

			//7. 設定img的class屬性
			eleimg.setAttribute("class", "thumb");

			//8. 將 img 物件新增到div標籤後
			document.getElementById("picArea").appendChild(eleimg);

		});
		//2. 使用readAsDataURL方法，讀取檔案內容
		reader.readAsDataURL(files[i]);
	}
}
</script>
</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<div id="content" style="margin-left: 10px; margin-top: 50px;">
			<!-- 每頁不同的內容從這裡開始 -->
			<div class="container">
			<form action="<c:url value="/musicPage/editOrDeleteMusic" />" enctype="multipart/form-data" method="post" ">
			   <table id="playListTable" style="width: 1000px;">
				<thead>
					<tr>
						<th>歌曲名稱</th>
						<th style="padding-left:130px;">封面照片</th>
						<th>歌曲介紹</th>
						<th style="padding-left:28px;">歌詞</th>
					</tr>
				</thead>
				<tbody>
				
					<tr style="vertical-align:center;">
					<td id="musicId" >
					   <input type="hidden" name="musicId" value="${musicBean.music_id}" >
					</td>
						<td style="vertical-align:middle;text-align:center;font-size:17px;">${musicBean.music_name}</td>
						<td style="align:center;">
						   <div class="form-control" id="picArea" style="height:200px;width:200px;margin:auto;">
						      <img src="${musicBean.music_Image}" width="180px" height="180px" />
						   </div>
						    <input type="file" id="picFile" accept="image/*" name="imageFile" style="margin:auto;margin-left:135px;">		
						</td>
						<td style="font-size: 15px;">
						<textarea style="resize: none;" cols="18" rows="9" name="musicCaption" >${musicBean.music_caption}</textarea>
						</td>
						<td style="font-size: 15px;text-align:center;">
						<textarea style="resize: none;" cols="30" rows="9" name="musicLyric" >${musicBean.music_lyric}</textarea>
						
						</td>
					</tr>	
					
				</tbody>

			</table>
			<div style="float:left;margin-left:820px;margin-top:10px;">
			     <input type="submit" name="editMusic" class="btn btn-primary pull-right" value="儲存">
			</div>
			
			<div style="float:left;margin-left:18px;margin-top:10px;">
			     <input type="submit" name="editMusic" class="btn btn-primary pull-right" value="刪除音樂"> 
			</div>
           </form>    
			<!-- 每頁不同的內容到這裡結束 -->
		</div>
		</div>
	</div>


	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>

			

</body>
</html>