<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>profile</title>
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
					${success }
				</div>
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

				<p>&copy; 2014</p>
			</footer>

		</div>
	</div>

</body>
</html>