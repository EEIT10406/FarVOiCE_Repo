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
<script type="text/javascript" src="../js/jquery.sticky.js" charset="utf-8"></script>
<!-- Slimbox2-->
<script type="text/javascript" src="../js/slimbox2.js" charset="utf-8"></script>
<!-- Modernizr -->
<script src="../js/modernizr.custom.js" type="text/javascript"></script>
<!-- End JS -->
<script type="text/javascript" src="../js/jquery.min.js"></script>
<style type="text/css">

#picArea {
	width: 200px;
	height: 200px;
	border: 0.5px solid gray;
	padding: 5px;
	color: gray;
	font-size: 13px;
	text-align: center;
}

.thumb {
	height: 160px;
	width: 160px;
	margin: 15px;
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
	})
</script>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		document.getElementById("picFile").addEventListener("change",
				fileViewer);
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
		<!-- === BEGIN CONTENT === -->
		<div id="content">
			<div class="container">
				<div class="container">
					<div class="row margin-vert-30">
					
						<!-- Login Box -->
						<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
		<form class="login-page" action="" method="">
			<div class="input-group margin-bottom-20">
				音樂 (mp3格式): <input type="file" id="musicFile" accept=".mp3">
			</div>
			<div class="input-group margin-bottom-20">
				<label for="songName">歌曲名稱:</label> 
				<input id="songName" type="text"
					style="width: 380px;" class="form-control">
			</div>
			<div class="input-group margin-bottom-20">
				封面照片: <input type="file" id="picFile" accept="image/*">
				<div class="form-control" id="picArea">預覽</div>
			</div>
			<div class="input-group margin-bottom-20">
				<label for="songIntroduce">歌曲介紹:</label>
				<textarea class="form-control" style="resize: none;" cols="80"
					rows="3" id="songIntroduce"></textarea>
			</div>
			<div class="input-group margin-bottom-20">
				<label for="lyric">歌詞:</label>
				<textarea class="form-control" style="resize: none;" cols="80"
					rows="5" id="lyric"></textarea>
			</div>
			<div class="input-group margin-bottom-20">
				歌曲分類 : <select class="form-control" id="songType"
					style="padding: 7px;width:380px;">
					<option>未分類</option>
					<option>抒情</option>
					<option>搖滾</option>
					<option>雷鬼</option>
					<option>藍調</option>
					<option>動感</option>
					<option>古典</option>
				</select>
			</div>
			<div class="row">
			<div class="col-md-6">
                                                    
                                                </div>
				<div class="col-md-6" >
					<button class="btn btn-primary pull-right" type="submit">發佈</button>
				</div>
			</div>
			<hr>
		</form>
	</div>
						<!-- End Login Box -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- === END CONTENT === -->
	
	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
	<jsp:include page="../homePage/player.jsp"/>
	</div>
</body>
</html>