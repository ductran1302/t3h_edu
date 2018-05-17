<%@include file="base_fragment/header.jsp"%>
<script type="text/javascript"
	src="assets/bootstrap/js/jquery.uploadPreview.min.js"></script>
<style type="text/css">
#image-preview {
	width: 100%;
	height: 20%;
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
<!-- Content Wrapper. Contains page content -->
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
									${n.i18n.crud_search_button_message } </b>
							</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-box-tool" data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
								<div class="btn-group">
									<button class="btn btn-box-tool dropdown-toggle"
										data-toggle="dropdown">
										<i class="fa fa-wrench"></i>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#">Action</a></li>
										<li><a href="#">Another action</a></li>
										<li><a href="#">Something else here</a></li>
										<li class="divider"></li>
										<li><a href="#">Separated link</a></li>
									</ul>
								</div>
								<button class="btn btn-box-tool" data-widget="remove">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<div id="main">
								<div id="managerment_wrapper">
									<div id="parameters">
										<div class="panel panel-primary">
											<div class="panel-body">
												<div id="controlPanelClass">
													<form id="criteria" role="form" class="form-horizontal"
														method="post">
														<div class="form-group">
															<div id="policyIdParam" class="">
																<label for="policy" class="control-label col-sm-2"
																	title="Click to select a policy">Mã sản phẩm</label>
																<div class="col-sm-4">
																	<input type="text" class="form-control"
																		name="product_id" id="product_id"><span
																		id="product_id_msg"></span>
																</div>
															</div>
															<div id="messageTypes">
																<label for='${n.i18n.users_first_name}'
																	class="control-label col-sm-2"
																	title='Click to select a product_name'>
																	product_name </label>
																<div class="col-sm-4">
																	<input type="text" class="form-control"
																		name="product_name" id="product_name"><span
																		id="product_name_msg"></span>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div id="policyIdParam" class="">
																<label for="policy" class="control-label col-sm-2"
																	title="Click to select ">product_mahang </label>
																<div class="col-sm-4">
																	<input type="text" class="form-control"
																		name="product_mahang" id="product_mahang"><span
																		id="product_mahang_msg"></span>
																</div>
															</div>
															<div id="messageTypes"></div>
														</div>
													</form>
												</div>

												<div class="row">
													<div class="col-sm-12">
														<div class="col-sm-2 col-xs-4">
															<!-- /.description-block -->
														</div>
														<!-- /.col -->
														<div class="col-sm-3 col-xs-4">
															<!-- /.description-block -->
														</div>
														<!-- /.col -->
														<div class="col-sm-2 col-xs-4">
															<span id="result"></span>
															<button id="doSearch" class="btn btn-block btn-primary">
																${n.i18n.crud_search_button_message}</button>
															<!-- /.description-block -->
														</div>
														<!-- /.col -->
														<div class="col-sm-3 col-xs-4">
															<!-- /.description-block -->
														</div>
														<div class="col-sm-2 col-xs-4">
															<!-- /.description-block -->
														</div>
													</div>
												</div>
												<!-- /.row -->
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--  -->
						</div>
						<div class="modal" id="sua_dulieu_modal" role="dialog"
							tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">x</button>
										<h4 class="modal-title">${n.i18n.modal_title_edit}</h4>
									</div>

									<div class="modal-body">
										<form class="form-horizontal" role="form">
											<div class="row">
												<div class="col-md-3 col-sm-3">
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
															<input class="form-control"
																placeholder="Nhập mã sản phẩm" id="product_mahang"></input>
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
																style='resize: vertical;' id="product_sumary"> san pham</textarea>
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
															<li role="presentation"><a
																data-toggle="tab" href="#tab1">Chi
																	tiết sản phẩm</a></li>
															<!-- end ngRepeat: item in ProductTabs -->
														</ul>
														<div class="tab-content">
															<!-- ngRepeat: item in ProductTabs -->
															<textarea name="content" class="editor" id="content"
																rows="4"></textarea>
															<!-- end ngRepeat: item in ProductTabs -->
														</div>
													</div>
												</div>
											</div>

										</form>
									</div>
									<div class="modal-footer">
										<span id="result_edit"></span>&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary"
											onclick="modal_update()" id="btn_modal_update">
											${n.i18n.crud_edit_button_message}</button>
										<button type="button" class="btn btn-primary"
											onclick="modal_reset()" id="btn_modal_reset">
											${n.i18n.crud_reset_button_message}</button>
									</div>
								</div>
							</div>
						</div>

						<div class="modal fade" id="xoa_dulieu_modal" role="dialog"
							tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">Ã</button>
										<h4 class="modal-title">${n.i18n.crud_delete_button_message}</h4>
									</div>

									<div class="modal-body">
										<form class="form-horizontal" role="form">
											<div class="form-group">
												<label class="col-md-2 control-label"
													for="modal_users_user_name">${n.i18n.users_user_name}
												</label>
												<div class="col-md-3">
													<input type="text" disabled="disabled" class="form-control"
														id="modal_delete1"
														placeholder='${n.i18n.crud_input} ${n.i18n.users_user_name}' />
												</div>
												<label class="col-md-3 control-label"
													for="modal_role_role_name">${n.i18n.users_first_name}</label>
												<div class="col-md-3">
													<input type="text" disabled="disabled" class="form-control"
														id="modal_delete2"
														placeholder='${n.i18n.crud_input} ${n.i18n.users_first_name}' />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label"
													for="modal_role_description">${n.i18n.users_last_name}</label>
												<div class="col-md-3">
													<input type="text" disabled="disabled" class="form-control"
														id="modal_delete3"
														placeholder='${n.i18n.crud_input} ${n.i18n.users_last_name}' />
												</div>
												<label class="col-md-3 control-label"
													for="modal_role_description">${n.i18n.users_user_email}</label>
												<div class="col-md-3">
													<input type="text" disabled="disabled" class="form-control"
														id="modal_delete4"
														placeholder='${n.i18n.crud_input} ${n.i18n.users_user_email}' />
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-2 control-label"
													for="modal_role_description">${n.i18n.users_user_phone}</label>
												<div class="col-md-3">
													<input type="text" disabled="disabled" class="form-control"
														id="modal_delete5"
														placeholder='${n.i18n.crud_input} ${n.i18n.users_user_phone}' />
												</div>
											</div>
										</form>
									</div>
									<div class="modal-footer">
										<span id="result_delete"></span>&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-primary"
											onclick="modal_delete()" id="btn_modal_update">
											${n.i18n.action_delete}</button>
										<button type="button" class="btn btn-primary"
											onclick="modal_goback()" id="btn_modal_reset">
											${n.i18n.action_back}</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<section>
						<div class="row">
							<div class="col-sm-3">
								<div id="div_page_section1"></div>
							</div>
							<!-- /.col -->
							<div class="col-sm-2">
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-2">
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3">
								<!-- /.description-block -->
							</div>
							<div class="col-sm-2">
								<button class="btn btn-block btn-primary" id="goNew">
									${n.i18n.crud_new_button_message}</button>
								<!-- /.description-block -->
							</div>
						</div>

						<div class="box box-primary">
							<div class="no-padding" id='data-list'
								style="overflow: auto; margin: auto"></div>
							<div id="div_page_section2"></div>
						</div>
					</section>

					<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- /. row -->
	</section>
</div>

<script type="text/javascript">
	//doan nay de khoi tao cach viet theo phan trang
	var record_per_page = 3, page = 1, nor = 0;
	var getData //= onGetData(page,record_per_page);
	var objPage1 = new pageTemplates('', 'div_page_section1', 'pClick', getData);
	var objPage = new pageTemplates('', 'div_page_section2', 'pClick',
			'onGetData');
	objPage.setRecPerPage(record_per_page);
	objPage.setTypeTemplate('BOOTSTRAP');
	objPage1.setRecPerPage(record_per_page);
	objPage1.setTypeTemplate('BOOTSTRAP');
	$(function() {
		$('#doSearch').click(function() {
			$('#result').html('${n.i18n.crud_process_message}');
			$.ajax({
				url : 'product?action=listProduct',
				method : 'GET',
				data : getParams(-1, record_per_page),
				success : function(data) {
					eval('data=' + data);
					nor = data.NOR * 1;
					//$('#data-list').html(data);
					$('#result').html('');
					onStartSearch(data.NOR);
				}
			});
		});
		$('#doSearch').click();
		$('#goNew').click(function() {
			window.location.href = 'product.jsp';
		});
	});

	function pClick(ps_page_id, ps_rec_per_page) {
		objPage.setCurrentPage(ps_page_id);
		objPage.setRecPerPage(ps_rec_per_page);
		objPage.returnDataCount(objPage.getTotalRec());
		objPage1.setCurrentPage(ps_page_id);
		objPage1.setRecPerPage(ps_rec_per_page);
		objPage1.returnDataCount(objPage.getTotalRec());
	}
	//Ham nay tu dong duoc goi sau khi click vao cac so...:
	function onGetData(page, size) {
		$.ajax({
			url : 'product?action=listProduct',
			data : getParams(page, record_per_page),
			method : 'GET',
			success : function(data) {
				if (data != '') {
					$('#data-list').html(data);
					$('#result').html('');
				}
				if (nor == 0 && data != '') {
					$('#result').html('${n.i18n.no_data}');
				}
			}
		});
	}
	//Ham tra ve chuoi parameters, truyen vao ajax de lay nop, nor va du lieu hien thi
	function getParams(page, record_per_page) {
		var exec = {
			"product_id" : $('#product_id').val(),
			"product_name" : $('#product_name').val(),
			"product_mahang" : $('#product_mahang').val(),
			//"email" : $('#modal_update4').val(),
			//"phone" : $('#modal_update5').val(),
			"record_per_page" : record_per_page,
			"page_index" : page,
		//"userID" : "",
		//"userIP" : ""
		};
		return exec;
	}

	function onStartSearch(total) {
		objPage.setCurrentPage(1);
		objPage.returnDataCount(total);
		objPage1.setCurrentPage(1);
		objPage1.returnDataCount(total);
	}

	function modal_update() {
		editor = $('textarea.editor').ckeditor(function(){ 
            CKFinder.setupCKEditor( this, '${pageContext.request.contextPath}/assets/ckfinder/' ); 
        });
		var param = {
			"user_name" : $('#modal_update1').val(),
			"firstName" : $('#modal_update2').val(),
			"lastName" : $('#modal_update3').val(),
			"email" : $('#modal_update4').val(),
			"phone" : $('#modal_update5').val()
		}
		if (!confirm('${n.i18n.crud_confirm_message}')) {
			return;
		}
		$.ajax({
			url : 'product?action=edit',
			method : 'POST',
			data : param,
			success : function(data) {
				if (data == "1.0" || data == "1") {
					$('#result_edit').html('${n.i18n.crud_edit_message}');

					$('.modal-backdrop').toggle();
					$('#doSearch').click();

				} else {
					$('#result_edit').html(data);
				}
				console.log(data.replace("\r\n", ""));
			}
		});
		//$("#sua_dulieu_modal").css("display", "block");
	}

	function modal_reset() {
		dataObj = $("#users");
		var length = dataObj.find('td').length;

		for (var i = 0; i < length - 2; i++) {
			$("#modal_update" + (i + 1)).val(dataObj.find('td').eq(i).text());
		}
	}

	function modal_delete() {
		var param = {
			"user_name" : $('#modal_delete1').val(),
			"record_per_page" : record_per_page,
			"page_index" : page,
		}
		if (!confirm('${n.i18n.crud_confirm_message}')) {
			return;
		}
		$.ajax({
			url : 'product?action=delete',
			data : param,
			method : 'POST',
			success : function(data) {
				if (data == "1.0" || data == "1") {
					$('#result_delete').html('${n.i18n.crud_delete_message}');
					$("#xoa_dulieu_modal").css("display", "block");
				} else {
					$('#result_delete').html(data);
				}
				console.log(data.replace("\r\n", ""));
			}
		});
	}

	function modal_goback() {
		$("#xoa_dulieu_modal").modal('toggle');
	}
	$(document).ready(function() {

	});
	$.ajaxSetup({
		beforeSend : function() {
			//$(".modal").show();
			console.log("show");
		},
		complete : function() {
			//$(".modal").hide();
			console.log("hide");
		}
	});
	
    $(document).ready(function() {
        $.uploadPreview({
            input_field: "#image-upload",
            preview_box: "#image-preview",
            label_field: "#image-label"
        });
        //CKEDITOR.replace('editor');

        
        //var editor = CKEDITOR.replace( 'editor' );
        //var editor = CKEDITOR.replace('editor');
        //CKFinder.setupCKEditor(editor, '/assets/ckfinder/');
        
        
        
    });
</script>
<!-- ./wrapper -->

<%@include file="base_fragment/footer.jsp"%>
