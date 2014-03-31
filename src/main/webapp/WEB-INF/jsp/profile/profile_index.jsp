<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="${ctx }/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${ctx }/stylesheets/theme.css">
<link rel="stylesheet"
	href="${ctx }/lib/font-awesome/css/font-awesome.css">
<script src="${ctx }/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function check() {
		$name = document.getElementById("name");
		if ($name.value == "") {
			alert("please enter a name.");
			$name.focus();
			return false;
		}

		return true;
	}
	function confirmDelete(id) {
		$("#btnDelete").data("postid", id);
		$("#myModal").modal("show");
	}
	function deleteMe(btn) {
		var postid = $(btn).data("postid");
		window.location = 'profile/delete/' + postid;
	}
</script>
</head>
<body>

	<div class="navbar">
		<div class="navbar-inner">
			<ul class="nav pull-right">

				<li><a href="#" class="visible-tablet visible-desktop"
					role="button">Settings</a></li>
				<li id="fat-menu" class="dropdown"><a href="#" role="button"
					class="dropdown-toggle" data-toggle="dropdown"> <i
						class="icon-user"></i> Cyper Yin <i class="icon-caret-down"></i>
				</a>

					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">My Account</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
						<li class="divider visible-phone"></li>
						<li><a tabindex="-1" href="sign-in.html">Logout</a></li>
					</ul></li>

			</ul>
			<a class="brand" href="index.html"><span class="first">Cyper</span>
				<span class="second">Data Studio</span></a>
		</div>
	</div>



	<div class="sidebar-nav">
		<form class="search form-inline">
			<input type="text" placeholder="Search...">
		</form>

		<a href="#accounts-menu" class="nav-header" data-toggle="collapse">
		<i class="icon-briefcase"></i>Account</a>
        <ul id="accounts-menu" class="nav nav-list collapse in">
            <li class="active"><a href="${ctx }/profile">Profile</a></li>
            <li><a href="#">Password</a></li>
        </ul>
        
		<a href="#relation-menu" class="nav-header" data-toggle="collapse">
		<i class="icon-beaker"></i>Relationship<span class="label label-info">+5</span></a>
		<ul id="relation-menu" class="nav nav-list collapse in">
			<li><a href="${ctx }/m2o">Many2one</a></li>
			<li><a href="#">One2one</a></li>
			<li><a href="#">One2many</a></li>
			<li><a href="#">Many2many</a></li>
			<li><a href="#">Recursive</a></li>

		</ul>
		
	</div>

	<div class="content">
		<div class="header">

			<h1 class="page-title">Profiles</h1>
		</div>

		<ul class="breadcrumb">
			<li><a href="${ctx }">Home</a><span class="divider">/</span></li>
			<li class="active">Profile</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
					<c:if test="${not empty success }">
					<div class="alert alert-success">
					<button data-dismiss="alert" class="close" type="button">×</button>
					${success }</div>
					</c:if>
					<form action="profile/create" method="post"
						onsubmit="return check();" class="form-search">
						<label for="name">Name:</label> <input type="text" id="name"
							name="name" placeholder="Name">

						<button type="submit" class="btn btn-primary">Add new</button>
					</form>
					<table
						class="table table-striped table-bordered table-hover table-condensed">
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
									<td><a href="javascript:confirmDelete('${p.id}')"><i
											class="icon-trash"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<div class="pagination">
					<ul>
						<li><a href="#">Prev</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>

				<div class="modal small hide fade" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabel">Delete Confirmation</h3>
					</div>
					<div class="modal-body">
						<p class="error-text">
							<i class="icon-warning-sign modal-icon"></i>Are you sure you want
							to delete the profile?
						</p>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
						<button class="btn btn-danger" data-dismiss="modal" id="btnDelete"
							data-postid="" onclick="deleteMe(this)">Delete</button>
					</div>
				</div>

				<footer>
					<hr>
					<!-- Purchase a site license to remove this link from the footer: http://www.portnine.com/bootstrap-themes -->
					<p class="pull-right">
						A <a href="http://www.portnine.com/bootstrap-themes"
							target="_blank">Free Bootstrap Theme</a> by <a
							href="http://www.portnine.com" target="_blank">Portnine</a>
					</p>

					<p>
						&copy; 2014 
					</p>
				</footer>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
		
	</script>
</body>
</html>