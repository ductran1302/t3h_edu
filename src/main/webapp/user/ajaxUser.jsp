<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<table style="width: 100%"
	class="table table-condensed table-striped table-bordered" id="users">
	<tr>
		<th align=center>${n.i18n.users_user_name}</th>
		<th align=center>${n.i18n.users_first_name}</th>
		<th align=center>${n.i18n.users_last_name}</th>
		<th align=center>${n.i18n.users_user_email}</th>
		<th align=center>${n.i18n.users_user_phone}</th>
		<th></th>
		<th></th>
	</tr>
	<c:forEach var="item" items="${users}">
		<tr>
			<td align="left">${item.getUserName()}</td>
			<td align="left">${item.getFirstName()}</td>
			<td align="left">${item.getLastName()}</td>
			<td align="left">${item.getEmail()}</td>
			<td align="left">${item.getUserPhone()}</td>
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
		dataObj = $(obj).parent().parent();
		var length = dataObj.find('td').length;

		for (var i = 0; i < length - 2; i++) {
			$("#modal_update" + (i + 1)).val(dataObj.find('td').eq(i).text());
		}
	}

	function get_del_dulieu_modal(obj) {
		dataObj = $(obj).parent().parent();
		var length = dataObj.find('td').length;

		for (var i = 0; i < length - 2; i++) {
			$("#modal_delete" + (i + 1)).val(dataObj.find('td').eq(i).text());
		}
	}
</script>
