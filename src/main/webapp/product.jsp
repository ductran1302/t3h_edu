<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<%@include file="base_fragment/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<script type="text/javascript"
	src="assets/bootstrap/js/jquery.uploadPreview.min.js"></script>
<style type="text/css">
#image-preview {
	width: 300px;
	height: 300px;
	position: relative;
	overflow: hidden;
	background-color: #ffffff;
	color: #ecf0f1;
}

#image-preview input {
	line-height: 100px;
	font-size: 100px;
	position: absolute;
	opacity: 0;
	z-index: 10;
}

#image-preview label {
	position: absolute;
	z-index: 5;
	opacity: 0.4;
	cursor: pointer;
	background-color: #bdc3c7;
	/*
	width: 100px;
	height: 25px;
	*/
	font-size: 10px;
	line-height: 25px;
	text-transform: uppercase;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin: auto;
	text-align: center;
}
</style>
<div class="content-wrapper">
	<section class="main content">
		<div class="row">
			<div class="col-md-12">
				<!-- Block buttons -->
				<div class="box box-primary">
					<div class="box">
						<div class="box-header with-border">
							<h3 class="box-title">
								<b style="text-transform: uppercase;">
									${n.i18n.crud_new_product } </b>
							</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<!--  
							<form id="form1" action="upload" method="post" runat="server"
								enctype="multipart/form-data">
								<div class="form-group">
								<div id="image-preview">
									<label for="image-upload" id="image-label">Choose File</label>
									<input type="file" name="image" src="#" id="image-upload"
										accept="image/*" />
								</div>
								
							</form>
							-->
							<form id="form1" method="post" runat="server"
								enctype="multipart/form-data" class="form-horizontal">
								<div class="product-block clearfix">
									<div class="row">
										<div class="col-md-3 col-sm-3 col-xs-12">
											<div id="image-preview">
												<label for="image-upload" id="image-label">Choose
													File</label> <input type="file" name="image" src="#"
													id="image-upload" accept="image/*" />
											</div>
										</div>
										<div class="col-md-6 col-sm-6 col-xs-12 clearfix">
											<div class="form-group">
												<label for="policy" class="control-label col-sm-4"
													title="Click to select" style="text-align: left">Mã
													sản phẩm</label>
												<div class="col-sm-8">
													<input class="form-control" placeholder="Nhập mã sản phẩm"
														id="product_ma"></input>
												</div>
											</div>
											<div class="form-group">
												<div>
													<label for="policy" class="control-label col-sm-4"
														title="Click to select" style="text-align: left">Nhập
														tên sản phẩm</label>
													<div class="col-sm-8">
														<input type="text" class="form-control"
															placeholder="Nhập tên sản phẩm" id="product_name"></input>
													</div>
												</div>
											</div>
											<!-- ngIf: IsPromotion==true -->
											<div class="form-group">
												<label for="policy" class="control-label col-sm-4"
													title="Click to select" style="text-align: left">Nhập
													giá cũ</label>
												<div class="col-sm-8">
													<input class="form-control"
														placeholder="Giá cũ sản phẩm (đ)" id="old_price"></input>
												</div>
											</div>
											<div class="form-group">
												<label for="policy" class="control-label col-sm-4"
													title="Click to select" style="text-align: left">Nhập
													giá mới</label>
												<div class="col-sm-8">
													<input class="form-control"
														placeholder="Giá mới sản phẩm (đ)" id="new_price"></input>
												</div>
											</div>

											<div class="form-group">
												<label for="policy" class="control-label col-sm-4"
													title="Click to select" style="text-align: left">Mô
													tả ngắn</label>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<textarea rows="4" class="form-control"
														style='resize: vertical;' id="product_summary">Review san pham</textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="policy" class="control-label col-sm-4"
													title="Click to select" style="text-align: left">Link</label>
												<div class="col-sm-12">
													<input class="form-control" placeholder="Link"
														id="product_link"></input>
												</div>
											</div>
											<!-- ngRepeat: item in ProductOptions -->
											
										</div>
									</div>
									<div class="row">
										<div class="col-md-12 col-sm-12 col-xs-12">
											<div class="product-tabs">
												<ul class="nav nav-tabs">
													<!-- ngRepeat: item in ProductTabs -->
													<li role="presentation" class="ng-scope active"><a
														data-toggle="tab" href="#tab1" class="ng-binding">Chi
															tiết sản phẩm</a></li>
													<!-- end ngRepeat: item in ProductTabs -->
												</ul>
												<div class="tab-content">
													<!-- ngRepeat: item in ProductTabs -->
													<textarea name="content" class="editor" id="content"
														rows="4">Hi ah</textarea>
													<!-- end ngRepeat: item in ProductTabs -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
		</div>
		<!-- /. row -->
	</section>
	<button id="doNew" class="btn btn-block btn-primary">${n.i18n.crud_new_button_message}</button>
</div>
<script type="text/javascript">

    $(document).ready(function() {
        $.uploadPreview({
            input_field: "#image-upload",
            preview_box: "#image-preview",
            label_field: "#image-label"
        });
        editor = $('textarea.editor').ckeditor(function(){ 
            CKFinder.setupCKEditor( this, 'assets/ckfinder/' ); 
        });
    });
    $('#doNew').click(function(){
    	addNewProduct();
    });
 
    function addNewProduct(){
    	var obj = new FormData();
    	obj.append("action","");
		obj.append("product_name",$("#product_name").val().trim());
		obj.append("old_price",$("#old_price").val().trim());
		obj.append("new_price",$("#new_price").val().trim());
		obj.append("product_ma",$("#product_ma").val().trim());
		obj.append("product_summary",$("#product_summary").val().trim());
		obj.append("product_link",$("#product_link").val().trim());
		//obj.seo_title=$("#seo_title").val().trim();
		//obj.seo_keyword=$("#seo_keyword").val().trim();
		//obj.seo_description=$("#seo_description").val().trim();
		//obj.do_mem=$("#do_mem").val().trim();
		//obj.do_ben_mau=$("#do_ben_mau").val().trim();
		//obj.mat_do_soi=$("#mat_do_soi").val().trim();
		//obj.ma_hang=$("#ma_hang").val().trim();
		//obj.brand=$("#brand").val().trim();
		//obj.seo_url=$("#seo_url").val().trim();
		obj.append("content", CKEDITOR.instances.content.getData().trim().replace("\r\n","").replace("\n","")); 
		obj.append("avatar",$('#image-upload')[0].files[0]);
		ajaxFunc(obj);
    }
    function ajaxFunc(obj){
		$.ajax({
			url:'product',
			cache: false,
	 		enctype : 'multipart/form-data',
			data : obj,
			processData : false,
			contentType : false,
			method: 'POST',
			success: function(data){
				if (data == "1.0" || data == "1"){
					$('#result').html(''); 
					alert('${n.i18n.crud_new_message}');
					$('#doClear').click();
				}else{
					$('#result').html(data);
				}
			}
		});
	}
</script>
</body>
</html>