<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<table style="width: 100%"
	class="table table-condensed table-striped table-bordered" id="users">
	<tr>
		<th align=center>Ma san pham</th>
		<th align=center>ten san pham</th>
		<th align=center>Ma hang</th>
		<th></th>
		<th></th>
	</tr>
	<c:forEach var="item" items="${users}">
		<tr>
			<td align="left">${item.getProductId()}</td>
			<td align="left">${item.getProductName()}</td>
			<td align="left">${item.getProductMahang()}</td>
			<td align="left" hidden>${item.getOldPrice()}</td>
			<td align="left" hidden>${item.getNewPrice()}</td>
			<td align="left" hidden>${item.getProductSumary()}</td>
			<td align="left" hidden>${item.getProductLink()}</td>
			<td align="left" hidden>${item.getProductAvatar()}</td>
			<td align="left" hidden>${item.getProductDescription()}</td>
			<td align=left style="width: 25px"><button
					onclick="get_edit_dulieu_modal(this)" data-toggle="modal"
					data-target="#sua_dulieu_modal">${n.i18n.action_edit}</button></td>
			<td align=left style="width: 25px"><button
					onclick="get_del_dulieu_modal(this)" data-toggle="modal"
					data-target="#xoa_dulieu_modal">${n.i18n.action_delete}</button></td>
		</tr>
	</c:forEach>
</table>
<script>
	$(function() {
	});

	function get_edit_dulieu_modal(obj) {
		editor = $('textarea.editor').ckeditor(function(){ 
            CKFinder.setupCKEditor( this, '${pageContext.request.contextPath}/assets/ckfinder/' ); 
        });
		dataObj = $(obj).parent().parent();
		var length = dataObj.find('td').length;

		$("#product_mahang").val(dataObj.find('td').eq(2).text());
		$("#product_name").val(dataObj.find('td').eq(1).text());
		$("#old_price").val(dataObj.find('td').eq(3).text());
		$("#new_price").val(dataObj.find('td').eq(4).text());
		$("#product_summary").val(dataObj.find('td').eq(5).text());
		$("#product_link").val(dataObj.find('td').eq(6).text());
		//$("#content").val(dataObj.find('td').eq(8).text());
		CKEDITOR.instances.content.setData(dataObj.find('td').eq(8).html());
	}

	function get_del_dulieu_modal(obj) {
		dataObj = $(obj).parent().parent();
		var length = dataObj.find('td').length;

		for (var i = 0; i < length - 2; i++) {
			$("#modal_delete" + (i + 1)).val(dataObj.find('td').eq(i).text());
		}
	}
</script>
