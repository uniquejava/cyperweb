<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div id="loading" style="display:none">
	<img src="${ctx }/images/ajaxloaderq.gif" />
</div>	

<form id="utilityForm" method="post" action="" style="display:none">
	<input name="ids" id="ids" value=""/>
	<input type="submit" value="submit"/>
</form>

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