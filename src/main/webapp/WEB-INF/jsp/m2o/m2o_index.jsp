<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>Many2One</title>
<script type="text/javascript">
	function confirmDelete(id) {
		showConfirm({
			message : "Are you sure to delete " + id + "?",
			ok : function() {
				window.location = 'm2o/delete/' + id;
			}
		});

	}
	function preUpdate(id) {
		$.get("m2o/update/" + id + ".json?ts=" + new Date().getTime(),
				function(data) {
					var t = data['e'];
					var keys = [ 'id', 'name', 'salary', 'type' ];
					for ( var i = 0; i < keys.length; i++) {
						var key = keys[i];
						$("#" + key).val(t[key]);

						//nested object
						if (key == 'type') {
							$("#" + key).val(t["employeeType"]["id"]);
						}
					}

					$('#emp_dialog').dialog('open');
					$('.ui-button:contains("Save")').show();
					$('.ui-button:contains("Add")').hide();
				}, "json");

	}

	$(document).ready(function() {
		$("#emp_dialog").dialog({
			autoOpen : false,
			modal : true,
			buttons : {
				"Add" : function() {
					$(this).dialog("close");
					showBusy();
					var form_data = $('#emp_form').serialize();
					$.post('m2o/create.json', form_data, function(data) {
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
					var form_data = $('#emp_form').serialize();
					$.post('m2o/update.json', form_data, function(data) {
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
			var keys = [ 'id', 'name', 'salary', 'type' ];
			for ( var i = 0; i < keys.length; i++) {
				var key = keys[i];
				$("#" + key).val("");
			}
			$('#emp_dialog').dialog('open');
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
		<li class="active">ManyToOne</li>
	</ul>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="alert alert-success" id="messageDiv"
				style="display: none">
				<button data-dismiss="alert" class="close" type="button">×</button>
				<span id="messageText">${success }</span>
			</div>

			<div class="mywell">
				<button class="btn btn-primary" id="btnCreate">
					<i class="icon-plus"></i> New Employee
				</button>
				<button class="btn">Import</button>
				<button class="btn">Export</button>
				<div class="btn-group"></div>
			</div>

			<div class="mywell">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Name</th>
							<th>Salary</th>
							<th>Type</th>
							<th>&nbsp;</th>
						</tr>
					<thead>
					<tbody>
						<c:forEach items="${employees }" var="p">
							<tr>
								<td nowrap="nowrap">${p.id }</td>
								<td>${p.name }</td>
								<td>${p.salary }</td>
								<td>${p.employeeType.name }<br></td>
								<td><a href="javascript:confirmDelete('${p.id}')"><i
										class="icon-trash"></i></a> &nbsp; <a
									href="javascript:preUpdate('${p.id}')"><i
										class="icon-pencil"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<jsp:include page="../include/cyperui.jsp" />

			<div title="Employee" id="emp_dialog" style="display: none;">
				<form id="emp_form">
					<fieldset>
						<input type="hidden" name="id" id="id" />
						<table>
							<tr>
								<td>Name:</td>
								<td><input type="text" name="name" id="name" size="20" /></td>
							</tr>
							<tr>
								<td>Salary:</td>
								<td><input type="text" name="salary" id="salary" size="20" /></td>
							</tr>
							<tr>
								<td>Type:</td>
								<td><select id="type" name="employeeType.id">
										<c:forEach items="${types }" var="t">
											<option value="${t.id }">${t.name }</option>
										</c:forEach>
								</select></td>
							</tr>
						</table>
					</fieldset>
				</form>
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
