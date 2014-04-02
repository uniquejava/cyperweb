<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
			<li><a href="${ctx }/m2o">Many2one</a></li>
			<li><a href="${ctx }/o2o">One2one</a></li>
			<li><a href="${ctx }/o2m">One2many</a></li>
			<li><a href="${ctx }/m2m">Many2many</a></li>
			<li><a href="${ctx }/r">Recursive</a></li>

		</ul>

	</div>
	
	<script type="text/javascript">
		//highlight selected menu item
		var activeA = $(".sidebar-nav a[href$='${pageContext.request.requestURI}']");
		activeA.eq(0).parent().addClass("active");
		$(".sidebar-nav a").not(activeA).eq(0).parent().removeClass("active");
		
	</script>