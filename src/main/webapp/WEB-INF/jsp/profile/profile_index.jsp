<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
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
	function preCreate(){
		var keys = [ 'id', 'name'];
		for ( var i = 0; i < keys.length; i++) {
			var key = keys[i];
			$("#" + key).val("");
		}
		$("#btnAdd").show();
		$("#btnSave").hide();
		$("#profile_dialog").modal("show");
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
			
			<div class="btn-toolbar">
				<span class="pull-left">
					<form id="searchForm" class="form-search" action="#">
						<input type="hidden" id="pageIndex" name="pageIndex" value="1"> 
						<div class="input-group">
							name： <input type="text" name="filter_LIKES_name" class="form-control icon-search" placeholder="name" value="${param.filter_LIKES_name}">
							<span class="input-group-btn">
						        <button class="btn btn-info " type="submit">Go!</button>
						    </span>
					    </div>
					</form>
				</span>
				
				<span class="pull-right">
					<button class="btn btn-primary" onclick="javascript:preCreate()">
						<i class="icon-plus"></i> New Profile
					</button>
					<button class="btn">Import</button>
					<button class="btn">Export</button>
					<div class="btn-group"></div>
				</span>
			</div>
		
		
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
					<c:forEach items="${page.content }" var="p">
						<tr>
							<td nowrap="nowrap">${p.id }</td>
							<td>${p.name }</td>
							<td><a href="javascript:confirmDelete('${p.id}')"><i
									class="icon-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<tags:pagination page="${page}" paginationSize="5"/>


			<div class="modal small hide fade" id="profile_dialog" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabel">Profile Info</h3>
					</div>
					<div class="modal-body">
					<form id="profile_form">
						<fieldset>
							<input type="hidden" name="id" id="id"/>
							<table>
								<tr>
									<td>Name: </td>
									<td><input type="text" name="name" id="name" size="20" /></td>
								</tr>
							</table>
						</fieldset>
					</form>
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
						<button class="btn btn-info" data-dismiss="modal" id="btnAdd"
							data-postid="" onclick="create(this)">Add</button>
							
						<button class="btn btn-info" data-dismiss="modal" id="btnSave"
							data-postid="" onclick="update(this)">Save</button>
					</div>
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