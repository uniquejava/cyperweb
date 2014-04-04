<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div id="loading" style="display:none">
	<img src="${ctx }/images/ajaxloaderq.gif" />
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
		<button class="btn btn-danger" data-dismiss="modal" id="btnDelete" data-postid="" >Delete</button>
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


<div id="confirmDialog" style="display: none">
	<div class="ui-state-highlight ui-corner-all"
		style="margin-top: 20px; margin: 0 auto; padding: 0 .7em;">
		<p>
			<span class="ui-icon ui-icon-info"
				style="float: left; margin-right: .3em;"></span> 
				<span id="confirmMessage"></span>
		</p>
	</div>
	<div style="margin: 0 auto; padding: .7em .7em; text-align: center;">
	</div>
</div>