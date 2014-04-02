<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>QuickStart:<sitemesh:title /></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${ctx }/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${ctx }/lib/cyperui/css/cyperui.css" rel="stylesheet">
<link href="${ctx }/lib/font-awesome/css/font-awesome.css" rel="stylesheet">
<script src="${ctx }/lib/cyperui/js/cyperui.js" type="text/javascript"></script>
<script src="${ctx }/lib/jquery-1.8.1.min.js" type="text/javascript"></script>

<sitemesh:head />
</head>

<body>
	<%@ include file="/WEB-INF/layouts/header.jsp"%>
	<div class="content">
		<sitemesh:body />
	</div>
	<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	<script src="${ctx }/lib/bootstrap/js/bootstrap.js"></script>
</body>
</html>