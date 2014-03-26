<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Cyper's App</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link href="${ctx }/css/bootstrap.css" rel="stylesheet">
<link href="${ctx }/css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="hero-unit">
			<h1>Hello, Bluemix!</h1>
			<p>This is a simple Spring CRUD demo deployed on bluemix.</p>
			<p>
				<a href="${ctx }/profile" class="btn btn-primary btn-large">Learn
					more</a>
			</p>
		</div>
	</div>
</body>
</html>
