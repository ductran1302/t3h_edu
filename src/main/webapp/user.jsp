<%@include file="base_fragment/header.jsp"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="main content-header">
	    <h1>
	        ${n.i18n.crud_new_button_message}
	    </h1>
	</section>
	<div class="box-body">
		<div id="main">
			<div id="managerment_wrapper">
				<div id="parameters">
					<div class="panel panel-primary">
						<div class="panel-body">
							<div id="controlPanelClass">
								<form class="form-horizontal" role="form">
									<div class="form-group">
										<label class="col-md-2 control-label" for="users_user_name">${n.i18n.users_user_name}
										</label>
										<div class="col-md-3">
											<input type="text" class="form-control" id="user_name"
												placeholder='${n.i18n.crud_input} ${n.i18n.users_user_name}' />
										</div>
										<label class="col-md-3 control-label" for="users_first_name">${n.i18n.users_first_name}</label>
										<div class="col-md-3">
											<input type="text" class="form-control" id="first_name"
												placeholder='${n.i18n.crud_input} ${n.i18n.users_first_name}' />
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="users_last_name">${n.i18n.users_last_name}</label>
										<div class="col-md-3">
											<input type="text" class="form-control" id="last_name"
												placeholder='${n.i18n.crud_input} ${n.i18n.users_last_name}' />
										</div>
										<label class="col-md-3 control-label" for="users_password">${n.i18n.users_password}</label>
										<div class="col-md-3">
											<input type="password" class="form-control" id="users_password"
												placeholder='${n.i18n.crud_input} ${n.i18n.users_password}' />
										</div>

									</div>
									<div class="form-group">
										<label class="col-md-2 control-label" for="users_user_email">${n.i18n.users_user_email}</label>
										<div class="col-md-3">
											<input type="text" class="form-control" id="user_email"
												placeholder='${n.i18n.crud_input} ${n.i18n.users_user_email}' />
										</div>
										<label class="col-md-3 control-label" for="users_user_phone">${n.i18n.users_user_phone}</label>
										<div class="col-md-3">
											<input type="text" class="form-control" id="user_phone"
												placeholder='${n.i18n.crud_input} ${n.i18n.users_user_phone}' />
										</div>
									</div>
								</form>
							</div>

							<div class="row">
								<div class="col-sm-12">
									<div class="col-sm-3 col-xs-4">
										<span id="result"></span>
									</div>
									<!-- /.col -->
									<div class="col-sm-2 col-xs-4">
										<button id="doNew" class="btn btn-block btn-primary">
											${n.i18n.crud_new_button_message}</button>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-2 col-xs-4">
										<button id="doClear" class="btn btn-block btn-primary">
											${n.i18n.crud_reset_button_message}</button>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-2 col-xs-4">
										<button id="goSearch" class="btn btn-block btn-primary">
											${n.i18n.crud_back_button_message}</button>
										<!-- /.description-block -->
									</div>
									<div class="col-sm-3 col-xs-4">
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
</div>
<!-- /.content-wrapper -->
<!-- ./wrapper -->
<script type="text/javascript">
	$(function(){
		$('#doNew').click(function(){
			if( !confirm('${n.i18n.crud_confirm_message}') ){return;}
			var param = {
		            "user_name": $('#user_name').val(),
		            "firstName": $('#first_name').val(),
		            "lastName": $('#last_name').val(),
		            "password" : $('#users_password').val(),
		            "email": $('#user_email').val(),
		            "phone": $('#user_phone').val()
		    };
			$('#result').html('${n.i18n.crud_process_message}');
			$.ajax({
				url: 'UserController',
				data: param,
				method:'POST',
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
		});
		$('#doClear').click(function(){
			$("input:text").each(function(){$(this).val('')});
			$("textarea").each(function(){$(this).val('')});
			$("select").each(function(){$(this).attr('selectedIndex', 0);});
		});
		$('#goSearch').click(function(){
			window.location.href='listUser.jsp';
		});
		
	});
	$(document).ready(function(){
	});
</script>
<%@include file="base_fragment/footer.jsp"%>