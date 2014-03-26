<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="${ctx }/css/bootstrap.css" rel="stylesheet">
<link href="${ctx }/css/bootstrap-responsive.css" rel="stylesheet">
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

	<div class="container">
		<div class="navbar navbar-inverse">
			<div class="navbar-inner">
				<a class="brand">Cyper Web Studio</a>
				<ul class="nav">
					<li class="active"><a href="${ctx }">Home</a></li>
					<li><a href="https://github.com/uniquejava/cyperweb">Github</a></li>
					<li><a href="http://git.oschina.net/uniquejava/cyperweb">OSChina</a></li>
					<li><a href="${ctx }/about">About</a></li>
				</ul>
			</div>
		</div>
		
		<ul class="breadcrumb">
			<li><a href="${ctx }">Home</a><span class="divider">&raquo;</span></li>	
			<li>Profile</li>	
		</ul>
	
		<form action="profile/create" method="post" onsubmit="return check();" class="form-search">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" placeholder="Name"> 
			
		<button type="submit" class="btn btn-primary">Add new</button>
		</form>
		<table class="table table-striped table-bordered table-hover table-condensed">
			<thead>
				<tr>
					<th>#</th>
					<th>Name</th>
					<th>&nbsp;</th>
				</tr>
			<thead>
			<tbody>
				<c:forEach items="${profiles }" var="p">
					<tr>
						<td nowrap="nowrap">${p.id }</td>
						<td>${p.name }</td>
						<td><a href="profile/delete/${p.id}" title="delete"><i class="icon-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>