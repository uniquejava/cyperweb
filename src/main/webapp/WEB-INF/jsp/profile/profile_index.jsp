<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
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
		showConfirm({
			message : "Are you sure to delete " + id + "?",
			ok : function() {
				window.location = 'profile/delete/' + id;
			}
		});

	}

	function preUpdate(id) {
		$.get("profile/update/" + id + ".json?ts=" + new Date().getTime(),
				function(data) {
					var t = data['o'];
					var keys = [ 'id', 'name' ];
					for ( var i = 0; i < keys.length; i++) {
						var key = keys[i];
						$("#" + key).val(t[key]);

					}

					$('#profile_dialog').dialog('open');
					$('.ui-button:contains("Save")').show();
					$('.ui-button:contains("Add")').hide();
				}, "json");

	}

	$(document).ready(function() {
		$("#profile_dialog").dialog({
			autoOpen : false,
			modal : true,
			buttons : {
				"Add" : function() {
					$(this).dialog("close");
					showBusy();
					var form_data = $('#profile_form').serialize();
					$.post('profile/create.json', form_data, function(data) {
						showInfo({
							message : data['msg'],
							reload : true
						});
					}).done(function() {
						hideBusy();
					});
				},
				"Save" : function() {
					$(this).dialog("close");
					showBusy();
					var form_data = $('#profile_form').serialize();
					$.post('profile/update.json', form_data, function(data) {
						showInfo({
							message : data['msg'],
							reload : true
						});
					}).done(function() {
						hideBusy();
					});
				},
				"Cancel" : function() {
					$(this).dialog("close");
				}
			}
		});

		$("#btnCreate").click(function() {
			var keys = [ 'id', 'name' ];
			for ( var i = 0; i < keys.length; i++) {
				var key = keys[i];
				$("#" + key).val("");
			}
			$('#profile_dialog').dialog('open');
			$('.ui-button:contains("Add")').show();
			$('.ui-button:contains("Save")').hide();
			return false;
		});

	});
</script>
</head>
<body>
	<ul class="breadcrumb">
		<li><a href="${ctx }">Home</a></li>
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

			<div class="mywell">
				<span class="pull-right">
					<form id="searchForm" action="#">
						<input type="hidden" id="pageIndex" name="pageIndex" value="1">
						<input type="hidden" id="paginationSize" name="paginationSize">

						<input type="text" name="filter_LIKES_name" placeholder="name"
							value="${param.filter_LIKES_name}">

						<button class="btn btn-default " type="submit">
							<i class="icon-search"></i> Go!
						</button>
					</form>
				</span> 
				
				<span class="pull-left">
					<button class="btn btn-primary" id="btnCreate">
						<i class="icon-plus"></i> New
					</button>
					<button class="btn btn-danger" >
						<i class="icon-trash"></i>&nbsp;Delete
					</button>
					<button class="btn btn-warning" >
						<i class="icon-pencil"></i>&nbsp;Modify
					</button>
					<button class="btn">Import</button>
					<button class="btn">Export</button>
					<div class="btn-group"></div>
				</span>
			</div>

			<div class="mywell">

				<table width="100%" class="table table-hover table-striped">
					<thead>
						<tr>
							<th width="40"><input id="btnSelectAll" type="checkbox" />
							<th>#</th>
							<th>Name</th>
							<th>&nbsp;</th>
						</tr>
					<thead>
					<tbody>
						<c:forEach items="${page.content }" var="p">
							<tr>
								<td nowrap="nowrap"><input id="btnSelectAll"
									id="checkbox_${p.id }" type="checkbox" /></td>
								<td>${p.id }</td>
								<td>${p.name }</td>
								<td><a href="javascript:confirmDelete('${p.id}')"><i
										class="icon-trash"></i></a> &nbsp; <a
									href="javascript:preUpdate('${p.id}')"><i
										class="icon-pencil"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<tags:pagination page="${page}" paginationSize="5" />

			<%@include file="../include/cyperui.jsp"%>
			<div title="Profile" id="profile_dialog" style="display: none;">
				<form id="profile_form">
					<fieldset>
						<table>
							<tr>
								<td>Name:</td>
								<td><input type="text" name="name" id="name" size="20" />
									<input type="hidden" name="id" id="id" /></td>
							</tr>
						</table>
					</fieldset>
				</form>
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
				<p class="pull-right">
					A cyper ui by <a href="http://my.oschina.net/uniquejava"
						target="_blank">Cyper</a>
				</p>

				<p>&copy; 2014</p>
			</footer>

		</div>
	</div>

</body>
</html>