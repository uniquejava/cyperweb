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
<!-- Le styles -->
<link rel="stylesheet" href="${ctx }/assets/css/bootstrap.css">
<link rel="stylesheet" href="${ctx }/css/custom-theme/jquery-ui-1.10.3.custom.css">
<link rel="stylesheet" href="${ctx }/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="${ctx }/lib/cyperui/css/cyperui.css">
<script src="${ctx }/assets/js/vendor/jquery-1.9.1.min.js" type="text/javascript"></script>
<sitemesh:head />
</head>


<body>
	<%@ include file="/WEB-INF/layouts/header.jsp"%>
	<div class="content">
		<sitemesh:body />
	</div>
	<%@ include file="/WEB-INF/layouts/footer.jsp"%>
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${ctx }/assets/js/vendor/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="${ctx }/assets/js/vendor/holder.js" type="text/javascript"></script>
	<script src="${ctx }/assets/js/vendor/bootstrap.js" type="text/javascript"></script>
	<script src="${ctx }/assets/js/vendor/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
	<script src="${ctx }/lib/cyperui/js/cyperui.js" type="text/javascript"></script>
</body>
</html>