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
	href="${ctx }/stylesheets/cyper-theme.css">
<link rel="stylesheet"
	href="${ctx }/lib/font-awesome/css/font-awesome.css">
<style type="text/css">
#line-chart {
	height: 300px;
	width: 800px;
	margin: 0px auto;
	margin-top: 1em;
}

.brand {
	font-family: georgia, serif;
}

.brand .first {
	color: #ccc;
	font-style: italic;
}

.brand .second {
	color: #fff;
	font-weight: bold;
}
#loading{
	z-index:1000;
	position:fixed;
	top:0;
	bottom:0;
	left:0;
	width:100%;
	height:100%;
	background:#000;
	opacity:0.2;
	-moz-opacity:0.2;
	filter:alpha(opacity=2);
	font-weight: bold;
	text-align: center;
 	font-size: 2em;
 	color: gray;
}
#loading>img {
	margin-top: 200px;
}
</style>
<script src="${ctx }/lib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function showBusy(){
		$("#loading").show();
	}
	function hideBusy(){
		$("#loading").hide();
	}
	
	function showMsg(msg) {
		if (msg) {
			$("#messageText").text(msg);
		}

		if ($("#messageText").text().trim().length > 0) {
			$("#messageDiv").show();
			setTimeout("$('#messageDiv').fadeOut()", 1500);
		}
	}
	
	function showAlert(msg, callback) {
		if (msg) {
			$("#alertText").text(msg);
		}

		$("#alertBox").modal({
			show : true,
			keyboard : false,
			backdrop : true
		});
		$('<div class="modal-backdrop.fade"></div>').appendTo(document.body);
		$("#btnAlert").click(function() {
			$("#alertBox").modal("hide");
			if (callback) {
				callback();
			}
			$(".modal-backdrop.fade").remove();
		});
	}

	function confirmDelete(id) {
		$("#btnDelete").data("postid", id);
		$("#myModal").modal("show");
	}

	function deleteMe(btn) {
		var postid = $(btn).data("postid");
		window.location = 'm2o/delete/' + postid;
	}

	function preCreate(id) {
		$("#emp_dialog").modal("show");
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
	$(function() {
		showMsg();
	});
</script>
</head>
<body>
	<div id="loading" style="display:none">
		<img src="${ctx }/images/ajaxloaderq.gif" />
	</div>
	
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
			<i class="icon-briefcase"></i>Account
		</a>
		<ul id="accounts-menu" class="nav nav-list collapse in">
			<li><a href="${ctx }/profile">Profile</a></li>
			<li><a href="#">Password</a></li>
		</ul>

		<a href="#relation-menu" class="nav-header" data-toggle="collapse">
			<i class="icon-beaker"></i>Relationship<span class="label label-info">+5</span>
		</a>
		<ul id="relation-menu" class="nav nav-list collapse in">
			<li class="active"><a href="#">Many2one</a></li>
			<li><a href="${ctx }/m2o">One2one</a></li>
			<li><a href="#">One2many</a></li>
			<li><a href="#">Many2many</a></li>
			<li><a href="#">Recursive</a></li>

		</ul>

	</div>

	<div class="content">
		<div class="header">

			<h1 class="page-title">Employee</h1>
		</div>

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
								<td><a href="javascript:confirmDelete('${p.id}')"><i
											class="icon-trash"></i></a>
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
				
				<div class="modal small hide" id="alertBox" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-header">
						<h3 id="myModalLabel">Information</h3>
					</div>
					<div class="modal-body">
						<p class="info-text">
							<i class="icon-info-sign modal-icon"></i>
							<span id="alertText"></span>
						</p>
					</div>
					<div class="modal-footer">
						<button class="btn" aria-hidden="true" id="btnAlert">OK</button>
					</div>
				</div>
				
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
	</div>

	<script src="${ctx }/lib/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$("[rel=tooltip]").tooltip();
	</script></
						body>
</html>