<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>profile</title>
<script type="text/javascript">
	function check(){
		$name =　document.getElementById("name");
		if($name.value == ""){
			alert("please enter a name.");
			$name.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>
	<form action="profile/create" method="post" onsubmit="return check();">
		Name:<input type="text" id="name" name="name"> &nbsp; <input
			type="submit" value="Add new">
	</form>
	<table width="100%">
		<thead>
			<td>#</td>
			<td>Name</td>
			<td>&nbsp;</td>
		<thead>
		<tbody>
			<c:forEach items="${profiles }" var="p">
				<tr>
					<td nowrap="nowrap">${p.id }</td>
					<td>${p.name }</td>
					<td><a href="profile/delete/${p.id}">delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>