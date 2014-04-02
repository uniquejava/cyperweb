<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>Many2One</title>
<script type="text/javascript">
	function confirmDelete(id) {
		$("#btnDelete").data("postid", id);
		$("#myModal").modal("show");
	}

	function preCreate() {
		var keys = [ 'id', 'name', 'salary', 'type' ];
		for ( var i = 0; i < keys.length; i++) {
			var key = keys[i];
			$("#" + key).val("");
		}
		$("#btnAdd").show();
		$("#btnSave").hide();
		$("#emp_dialog").modal("show");
	}
	function preUpdate(id) {
		$.get("m2o/update/" + id + ".json?ts="+ new Date().getTime(), function(data) {
			var t = data['e'];
			var keys = ['id', 'name', 'salary', 'type' ];
			for ( var i = 0; i < keys.length; i++) {
				var key = keys[i];
				$("#" + key).val(t[key]);
				
				//nested object
				if(key == 'type'){
					$("#" + key).val(t["employeeType"]["id"]);
				}
			}
			
			$("#btnAdd").hide();
			$("#btnSave").show();
			$("#emp_dialog").modal("show");
		}, "json");
		
	}

	function create() {
		showBusy();
		var form_data = $('#emp_form').serialize();
		$.post('m2o/create.json', form_data, function(data) {
			if(data.ok == 'true'){
				showAlert(data.msg,function(){
					window.location.reload();
				});
			}else{
				showAlert(data.msg);
			}
			
		}).done(function() {
			hideBusy();
		});
	}
	
	function update() {
		showBusy();
		var form_data = $('#emp_form').serialize();
		$.post('m2o/update.json', form_data, function(data) {
			if(data.ok == 'true'){
				showAlert(data.msg,function(){
					window.location.reload();
				});
			}else{
				showAlert(data.msg);
			}
			
		}).done(function() {
			hideBusy();
		});
	}
	
	$(function() {
		showMsg();
		$("#btnDelete").click(function(){
			var postid = $("#btnDelete").data("postid");
			window.location = 'm2o/delete/' + postid;
			
		});
		
	});
</script>
</head>
<body>

		

		<ul class="breadcrumb">
			<li><a href="${ctx }">Home</a><span class="divider">/</span></li>
			<li class="active">@ManyToOne</li>
		</ul>

		<div class="container-fluid">
			<div class="row-fluid">
				<div class="alert alert-success" id="messageDiv"
					style="display: none">
					<button data-dismiss="alert" class="close" type="button">×</button>
					<span id="messageText">${success }</span>
				</div>

				<div class="btn-toolbar">
					<button class="btn btn-primary" onclick="javascript:preCreate()">
						<i class="icon-plus"></i> New Employee
					</button>
					<button class="btn">Import</button>
					<button class="btn">Export</button>
					<div class="btn-group"></div>
				</div>

				<div class="well">
					<table class="table table-striped">
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
								<td>
								<a href="javascript:confirmDelete('${p.id}')"><i
											class="icon-trash"></i></a>
								&nbsp;
								<a href="javascript:preUpdate('${p.id}')"><i
											class="icon-pencil"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
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
				
				<jsp:include page="../include/cyperui.jsp"/>
				
				<div class="modal small hide fade" id="emp_dialog" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 id="myModalLabel">Employee Info</h3>
					</div>
					<div class="modal-body">
					<form id="emp_form">
						<fieldset>
							<input type="hidden" name="id" id="id"/>
							<table>
								<tr>
									<td>Name: </td>
									<td><input type="text" name="name" id="name" size="20" /></td>
								</tr>
								<tr>
									<td>Salary:</td>
									<td><input type="text" name="salary" id="salary" size="20" /></td>
								</tr>
								<tr>
									<td>Type:</td>
									<td>
									<select id="type" name="employeeType.id">
										<c:forEach items="${types }" var="t">
											<option value="${t.id }">${t.name }</option>
										</c:forEach>
									</select>
									</td>
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
