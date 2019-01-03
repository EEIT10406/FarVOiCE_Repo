<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

</head>
<body>
	<div id="body_bg">
		<jsp:include page="../homePage/header.jsp" />
		<div id="content">
			<div class="container">

				<div class="row" style="margin-top: 30px; margin-left: 180px;">
					<div class="col-lg-9">
						<div class="card">
							<div class="card-body">
								<!-- 每頁不同的內容從這裡開始 -->
								<table id="productTable" class="table table-bordered">
									<thead>
										<tr>
											<th>歌單編號</th>
											<th>圖片</th>
											<th>歌單名稱</th>
											<th>歌曲數量</th>
											<th>管理
											</th>
										</tr>
									</thead>
									<tbody>

										<tr>
											<td style="font-size: 15px;">1</td>
											<td><img src="../img/left.JPG"
												style="width: 100px; height: 100px;" /></td>
											<td style="font-size: 15px;">蕭氏情歌</td>
											<td style="font-size: 15px;">2</td>
											<td><a href=""><img src="img/deleteList.png"
													style="width: 40px; height: 40px;" /></a></td>
										</tr>
										<tr>
											<td style="font-size: 15px;">2</td>
											<td><img src="../img/left.JPG"
												style="width: 100px; height: 100px;" /></td>
											<td style="font-size: 15px;">蕭氏情歌</td>
											<td style="font-size: 15px;">2</td>
											<td><a href=""><img src="img/deleteList.png"
													style="width: 40px; height: 40px;" /></a></td>
										</tr>

									</tbody>
									<tfoot>
										<tr>
											<form name="myForm">
												<td><input type="hidden" id="" name=""><span></span></td>
												<td><input type="file" id="picFile" accept="image/*"></td>
												<td><input type="text" style="width: 100px"
													class="form-control" id="UnitPrice" name="UnitPrice"
													placeholder="歌單名稱"></td>
												<td><input type="hidden" id="" name=""><span></span></td>
												<td><a href=""><img src="img/addList.png"
														style="width: 40px; height: 40px;" /></a></td>
										</tr>
										</form>
									</tfoot>
								</table>
								<!-- 每頁不同的內容到這裡結束 -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../homePage/footer.jsp" />
	<div id="player">
		<jsp:include page="../homePage/player.jsp" />
	</div>

	<script>
		$(document).ready(function() {
			loadProduct(1);
		})
		//新增產品
		$('#buttonAdd').click(function() {

			var datas = $('form[name="myForm"]').serialize();
			//console.log(datas)
			$.post('ProductsInsert', datas, function(data) {
				alert(data);
				loadProduct(1);
				$('#ProductID').val('');
				$('#ProductName').val('');
				$('#UnitPrice').val('');
				$('#UnitsInStock').val('');
			});
		})

		//讀取產品
// 		function loadProduct(id) {

// 			//step1 step2 
// 			$.getJSON('Products',{'categoryID' : id},function(datas) {
// 								//step3
// 								//datas = []
// 								//step4 read data
// 								var docFrag = $(document.createDocumentFragment());
// 								$.each(datas,function(idx, product) {
// 													//product = {}			    		 
// 													var cell1 = $('<td></td>').text(product.ProductID)
// 													var cell2 = $('<td></td>').text(product.ProductName)
// 													var cell3 = $('<td></td>').text(product.UnitPrice)
// 													var cell4 = $('<td></td>').text(product.UnitsInStock)
// 													var cell5 = $('<td></td>').html('<button type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i></button><button type="button" class="btn btn-info"><i class="fas fa-edit"></i></button>')
// 													//<tr><td>
// 													var row = $('<tr></tr>').append([cell1,cell2,cell3,cell4,cell5 ])
// 													docFrag.append(row);
// 												})
// 								$('#productTable>tbody').html(docFrag);
// 							})
// 		}

		//刪除產品
// 		$('#productTable>tbody').on('click', 'button:nth-child(1)', function() {
// 			//alert("del")
// 			var row = $(this).parents('tr');
// 			var productId = row.children('td:nth-child(1)').text();
// 			//ajax 把 productId傳到ProductsDelete.java
// 			$.get('ProductsDelete', {
// 				'ProductID' : productId
// 			}, function(data) {
// 				alert(data);
// 				loadProduct(1);
// 			})
// 		})

		//修改產品
// 		$('#productTable>tbody').on('click', 'button:nth-child(2)', function() {
// 			var row = $(this).parents('tr');
// 			var productId = row.children('td:nth-child(1)').text();
// 			var productName = row.children('td:nth-child(2)').text();
// 			var unitPrice = row.children('td:nth-child(3)').text();
// 			var unitsInStock = row.children('td:nth-child(4)').text();

// 			$('#ProductID').val(productId).next('span').text(productId);
// 			$('#ProductName').val(productName)
// 			$('#UnitPrice').val(unitPrice)
// 			$('#UnitsInStock').val(unitsInStock)

// 		})


		//更新產品
		// 			   $('#buttonUpdate').click(function(){				   
		// 	 			   var datas = $('form[name="myForm"]').serialize();
		//  	 		    	$.post('ProductsUpdate',datas,function(data){
		// 	 		    		alert(data);
		// 	 		    		loadProduct(1);
		// 	 		    		 $('#ProductID').val('').next('span').text('');
		// 	 					   $('#ProductName').val('');
		// 	 					   $('#UnitPrice').val('');
		// 	 					   $('#UnitsInStock').val('');
		// 	 		    	});
		// 			   });
	</script>
</body>
</html>