<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Cyper's App</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx }/assets/css/bootstrap.css">
</head>
<body>
	<div class="jumbotron">
		<h1>Hello, Bluemix!</h1>
		<p>This is a full-featured Spring web application deployed on bluemix.</p>
		<p>
			<a href="${ctx }/profile" class="btn btn-primary btn-lg">Learn
				more</a>
		</p>
	</div>
</body>
</html>
