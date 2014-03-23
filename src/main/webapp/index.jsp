<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>Cyper's App</title>
</head>
<body>
<h3><a href="${ctx }/about">About</a></h3>
<h3><a href="${ctx }/profile">simple CRUD</a></h3>
</body>
</html>
