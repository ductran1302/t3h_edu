<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="assets/bootstrap/plugins/jQuery/jQuery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src="assets/ckeditor/ckeditor.js"></script>
	<script type="text/javascript"
	src="assets/ckfinder/ckfinder.js"></script>
</head>
<body>
	<div id="editor" style="visibility: hidden; display: none;">
		<h1>Hello world!</h1>
		<p>
			I'm an instance of <a href="https://ckeditor.com">CKEditor</a>.
		</p>
	</div>
	<!-- end ngRepeat: item in ProductTabs -->
	<script>
		var editor = CKEDITOR.replace('editor');
		CKFinder.setupCKEditor(editor,'/assets/ckfinder/');
	</script>
</body>
</html>