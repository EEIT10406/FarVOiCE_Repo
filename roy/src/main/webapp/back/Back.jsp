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
<style>
th, td {
	border-collapse: collapse; 
	font-size: 14px;
	border-bottom: 0.5px solid lightgrey;
}

 table {
 	width: 750px; 
 } 

.btn {
	color: black;
	background-color: white;
	border: 0px;
}

.music {
	width: 70px;
	height: 70px;
}

.heart {
	width: 15px;
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
	font-size: 13px;
}

.btnAddList {
	color: black;
	background-color: white;
	border: 0px;
}
#report_td span:hover {
  background-color: black;
}
</style>

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
<script src="../js/modernizr.custom.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
<script src="1.js?ver=1"></script>

<!-- End JS -->
<script >
$(document).ready(function() {
	refreshContact();
	refreshReport();
	refreshFunding();
})
function refreshFunding(){
	$('#fundingTable').html("");
	$.ajax({
	    url: "/roy/funding/allFundingProject.controller",
	    type: "POST",
	    cache:false,
	    dataType:'json',
	    data:{},
		success : function(list)
		 {  
			console.log(list);
		 	list.forEach(function(obj, index) {
		 		var fix = "未通過";
		 		if(obj.funding_status=="true"){
		 			fix = "已通過";
		 		}
		 	    var content = "<tr>"+
							      "<td >"+obj.member_username+"</td>"+
							      "<td ><a href='/roy/funding/detail.controller?funding_id="+ 
							    		  obj.funding_id+"&day="+ limitDay(obj.funding_duration)+"&nickname="+obj.nick_name+"'>"
											+obj.funding_title+"</a></td>"+
							      "<td >"+obj.funding_createTime+"</td>"+
							      "<td >"+fix+"</td>"+
							      "<td ><a href='#'  funding_id='"+obj.funding_id+"' onclick='passCurrentFunding(this)'><i class='fas fa-pencil-alt fa-lg'></i></a></td>"+
							  "</tr>";
				$('#fundingTable').append(content);
		  	});
		},  
	    error: function (xhr, ajaxOptions, thrownError) {
	        alert(xhr.status+"-->showAllfundingTable");
	        alert(thrownError);
	    }
	});	
}
function refreshContact(){
	$('#contactTable').html("");
	$.ajax({
	    url: "/roy/back/showAllCustomerService.controller",
	    type: "POST",
	    cache:false,
	    dataType:'json',
	    data:{username:$('#username').text()},
		success : function(list)
		 {  
			console.log(list);
		 	list.forEach(function(obj, index) {
		 		var fix = "未完成";
		 		if(obj.CustomerService_fixed){
		 			fix = "已處理"
		 		}
		 	    var content = "<tr>"+
							      "<td >"+obj.CustomerService_email+"</td>"+
							      "<td >"+obj.CustomerService_title+"</td>"+
							      "<td >"+obj.CustomerService_content+"</td>"+
							      "<td >"+obj.CustomerService_time+"</td>"+
							      "<td >"+fix+"</td>"+
							      "<td ><a href='#'  CustomerService_id='"+obj.CustomerService_id+"' onclick='edit(this)'><i class='fas fa-pencil-alt fa-lg'></i></a></td>"+
							  "</tr>";
				$('#contactTable').append(content);
		  	});
		},  
	    error: function (xhr, ajaxOptions, thrownError) {
	        alert(xhr.status+"-->showAllCustomerService");
	        alert(thrownError);
	    }
	});	
}
function giveFormId(e){
	var id = $(e).attr('CustomerService_id');
	console.log(id);
	$('#CustomerService_id').val(id);
}
function edit(e){
	$.ajax({
	    url: "/roy/back/edit.controller",
	    type: "POST",
	    cache:false,
	    dataType:'json',
	    data:{CustomerService_id:$(e).attr('CustomerService_id')},

		success : function(list)
		{  
			$('#contactTable').html("");
			refreshContact();
			console.log("suc");
		},  
	    error: function (xhr, ajaxOptions, thrownError) {
	    	$('#contactTable').html("");
	    	refreshContact();
			console.log("error");

	    }
	});	
	
}
function refreshReport(){
	$('#reportTable').html("");
	$.ajax({
	    url: "report.get",
	    type: "POST",
	    cache:false,
	    dataType:'json',
	    data:{username:$('#username').text()},
		success : function(list)
		 {  
			console.log(list);
		 	list.forEach(function(obj, index) {
		 		var str = obj.report_time+'';
		 	    var content = "<tr>"+
							      "<td >"+obj.member_usernameReportS+"</td>"+
							      "<td >"+obj.music_idReportM+"</td>"+
							      "<td >"+str.replace('?','月')+"</td>"+
							      "<td id='report_td' music_id="+obj.music_idReportM+" report_id="+obj.report_id+"><span style='cursor: pointer;' onclick='test(this)'><i class='fa fa-check'></i>可</span><span style='cursor: pointer;' onclick='test(this)'><i class='fa fa-times'></i>否</span></td>"+
							  "</tr>";
				$('#reportTable').append(content);
		  	});
		},  
	    error: function (xhr, ajaxOptions, thrownError) {
	        alert(xhr.status+"-->showAllCustomerService");
	        alert(thrownError);
	    }
	});	
}
function test(e){
	var s = $(e).text();
	if(confirm(s+"嗎?")){
		$.get("report.update", {"YON":s,"music_id":$(e).parent('td').attr('music_id'),"report_id":$(e).parent('td').attr('report_id')}, function(message) {
			alert(message);
			refreshReport();
		})
		

	}
}
function passCurrentFunding(e){
	$.ajax({
	    url: "/roy/back/passCurrentFunding.controller",
	    type: "POST",
	    cache:false,
	    dataType:'json',
	    data:{funding_id:$(e).attr("funding_id")},

		success : function(list)
		{  
			$('#fundingTable').html("");
			refreshFunding();
			console.log("suc");
		},  
	    error: function (xhr, ajaxOptions, thrownError) {
	    	$('#fundingTable').html("");
	    	refreshFunding();
			console.log("error");

	    }
	});	
	
}
//抓取選取日期計算到期天數
function limitDay(day) {
	var pickdate = day;
	var enddate = new Date(pickdate);
	var nowdate = new Date();

	var deadline = enddate.getTime() - nowdate.getTime();
	var days = parseInt(deadline / (1000 * 60 * 60 * 24)) + 1;
	if (isNaN(days)) {
		return 0;
	} else {
		return days;
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
				<div class="row margin-vert-30">

					<!--目錄-->
					<div class="row tabs">
						<div class="col-sm-3">
							<ul class="nav nav-pills nav-stacked">
								<li class="active"><a href="#imediate" data-toggle="tab">主控台 </a></li>
								<li><a href="#allType" data-toggle="tab">募資管理 </a></li>
								<li><a href="#rock" data-toggle="tab">檢舉管理</a></li>
								<li><a href="#contact" data-toggle="tab">客服管理</a></li>
							 </ul>
					</div>
					<!--目錄-->
						
						<div class="col-sm-9">
							<div class="tab-content">
								<div class="tab-pane fade in active" id="imediate">
									<div class="row">
										<div class="col-md-12">
											<div style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">主控台
											<div id="canvas-holder" style="width:100%">
												<canvas id="chart-area"></canvas>
											</div>
											<script>
												var randomScalingFactor = function() {
													return Math.round(Math.random() * 100);
												};
										
												var config = {
													type: 'pie',
													data: {
														datasets: [{
															data: [
																19,
																10,
																8,
																25,
																12,
															],
															backgroundColor: [
																 "rgb(67,156,231)",//blue
																 "rgb(255,98,130)",//red
																 "rgb(255,161,77)",//orange
																 "rgb(253,208,99)",//yeolow
																 "rgb(71,190,190)"
															],
															label: 'Dataset 1'
														}],
														labels: [
															'抒情',
															'搖滾',
															'流行',
															'電音',
															'嘻哈'
														]
													},
													options: {
														responsive: true
													}
												};
										
												window.onload = function() {
													var ctx = document.getElementById('chart-area').getContext('2d');
													window.myPie = new Chart(ctx, config);
												};
										
// 												document.getElementById('randomizeData').addEventListener('click', function() {
// 													config.data.datasets.forEach(function(dataset) {
// 														dataset.data = dataset.data.map(function() {
// 															return randomScalingFactor();
// 														});
// 													});
										
// 													window.myPie.update();
// 												});
										
											</script>
											</div>
										</div>
									</div>
								</div>
								
								<!--=-----allType 募資管理 Begin -->
								<div class="tab-pane fade in" id="allType">
									<div class="row">
										<div class="col-md-12">
											<div style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">募資管理</div>
											<table  style="word-break: keep-all" >
											  <thead>
											    <tr>
											      <th scope="col">提案人(帳號)</th>
											      <th scope="col">標題</th>
											      <th scope="col">時間</th>
											      <th scope="col">審核</th>
											      <th scope="col">編輯</th>
											    </tr>
											  </thead>
											  <tbody id="fundingTable">
											   											
											  </tbody>	
											 </table>	
										 </div>
									</div>
								</div> 
								<!--=-----allType 募資管理 END -->
								
							
								
								
								<!--=-----rock Begin 檢舉管理 -->
								<div class="tab-pane fade in" id="rock">
									<div class="row">
										<div class="col-md-5">
											<div style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">檢舉管理</div>
											<table  >
											  <thead>
											    <tr>
											      <th scope="col">檢舉人</th>
											      <th scope="col">音樂ID</th>
											      <th scope="col">時間</th>
											      <th scope="col">編輯</th>
											    </tr>
											  </thead>
											  <tbody id="reportTable">
											   											
											  </tbody>	
											 </table>	
										</div>
										<div class="col-md-7">
										</div>
									</div>
								</div>
								<!--=-----rock END 檢舉管理管 -->
								
								<!-------contact Begin 客服管理 -->
								<div class="tab-pane fade in" id="contact">
									<div class="row">
										<div class="col-md-12">
											<div style="font-size: 25px; margin-bottom: 30px; margin-top: 20px; color: red;">客服管理</div>
											<table  >
											  <thead>
											    <tr>
											      <th scope="col">信箱</th>
											      <th scope="col">標題</th>
											      <th scope="col">內容</th>
											      <th scope="col">時間</th>
											      <th scope="col">狀態</th>
											      <th scope="col">編輯</th>
											    </tr>
											  </thead>
											  <tbody id="contactTable">
											   											
											  </tbody>	
											 </table>	
										 </div>
									</div>
								</div>
								<!--------contact END 客服管理 -->
								
									<!-- 編輯單筆客服 begin-->		
									<div class="modal fade" id="edit" aria-hidden="true">
												<div class="modal-dialog" style="width: 300px;">
													<div class="modal-content">
														<h5 style="margin: 10px;">編輯</h5>
														<form action="/roy/back/edit.controller" method="get" id="form">
															<div class="modal-body">
																<input hidden="true" value="" id="CustomerService_id" name="CustomerService_id">
																<div class="form-group">
																	<select name="fixed" id="selectPlayList" class="form-control">
																		<option value="true">已處理</option>
																	</select>
																</div>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-primary"
																	data-dismiss="modal">取消</button>
																<button  type="button" class="btn btn-primary" data-dismiss="modal" onclick='edit();'>確定</button>
															</div>
														</form>
													</div>
												</div>
											</div>							
									<!-- 編輯單筆客服 end-->
							</div>
						</div>
					</div>
					<!-- Tab -->
				</div>
			</div>
		</div>
	</div>
	<!-- === END CONTENT === -->




	<jsp:include page="../homePage/footer.jsp" />

						


</body>
</html>