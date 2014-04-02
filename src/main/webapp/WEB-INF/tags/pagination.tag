<%@tag pageEncoding="UTF-8"%>
<%@ attribute name="page" type="smartcrud.common.orm.Page" required="true"%>
<%@ attribute name="paginationSize" type="java.lang.Integer" required="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
int current =  page.getPageIndex();
int begin = Math.max(1, current - paginationSize/2);
long end = Math.min(begin + (paginationSize - 1), page.getPageCount());

request.setAttribute("current", current);
request.setAttribute("begin", begin);
request.setAttribute("end", end);
%>

<div class="pagination">
	<ul>
		 <% if (page.hasPrevPage){%>
               	<li><a onclick="jumpPage(1)" href="javascript:void(0)">&lt;&lt;</a></li>
                <li><a onclick="jumpPage(${page.prevPage})" href="javascript:void(0)">&lt;</a></li>
         <%}else{%>
                <li class="disabled"><a href="#">&lt;&lt;</a></li>
                <li class="disabled"><a href="#">&lt;</a></li>
         <%} %>
 
		<c:forEach var="i" begin="${begin}" end="${end}">
            <c:choose>
                <c:when test="${i == current}">
                    <li class="active"><a onclick="jumpPage(${i})" href="javascript:void(0)">${i}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a onclick="jumpPage(${i})" href="javascript:void(0)">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
	  
	  	 <% if (page.hasNextPage){%>
               	<li><a onclick="jumpPage(${page.nextPage})" href="javascript:void(0)">&gt;</a></li>
                <li><a onclick="jumpPage(${page.lastPage})" href="javascript:void(0)">&gt;&gt;</a></li>
         <%}else{%>
                <li class="disabled"><a href="#">&gt;</a></li>
                <li class="disabled"><a href="#">&gt;&gt;</a></li>
         <%} %>

	</ul>
</div>

