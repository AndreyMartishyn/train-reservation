<%@ include file="/view/static/basic_context.jsp" %>
<html>
<head>
<%@ include file="/view/static/meta.jsp" %>
</head>
<body>
<%@ include file="/view/static/header.jsp" %>
<br>
<div class="wrapper">
 		    <div id="formContent-table">
		 <h2><fmt:message key="stations"/></h2>
		  <span style ="text-align: center; color:red; font-family:courier; font-size:80%;">${noEntries}</span>
        <table class="table table-striped table-responsive-md btn-table" >
        <thead>
                        <tr>
                          <th scope="col"><fmt:message key="admin.page.station.number"/></th>
                          <th scope="col"><fmt:message key="admin.page.station.name"/></th>
                          <th scope="col"><fmt:message key="admin.page.station.code"/></th>
                          <th scope="col"><fmt:message key="admin.page.action"/></th>
                        </tr>

        </thead>
        <tbody>
        <c:forEach items="${paginatedEntries}" var="station" >
        <tr>
        <td><c:out value="${station.id}"/> </td>
        <td><c:out value="${station.name}"/> </td>
        <td><c:out value="${station.code}"/> </td>
        <td>
           <a href="station-edit.command?id=<c:out value='${station.id}' />" class="btn btn-dark"><fmt:message key="admin.page.edit"/></a>
           <a href="station-delete.command?id=<c:out value='${station.id}' />" class="btn btn-dark"><fmt:message key="admin.page.delete"/></a>
        </td>
        </tr>
        </c:forEach>
        </tbody>
        </table>
                                  <a href="station-add.command" class="btn btn-dark"><fmt:message key="admin.page.station.add"/></a>
        <br><br>
                 <%--For displaying Previous link except for the 1st page --%>
                 <c:if test="${currentPage != 1}">
                     <td><a href="stations-page.command?page=${currentPage - 1}">Previous</a></td>
                 </c:if>
                            <table style = "border:1px solid black;margin-left:auto;margin-right:auto;" cellpadding="5" cellspacing="5" >
                            <tr>
                             <c:forEach begin="1" end="${noOfPages}" var="i">
                             <c:choose>
                             <c:when test="${currentPage eq i}">
                             <td>${i}</td>
                                                         </c:when>
                                                         <c:otherwise>
                                                             <td><a href="stations-page.command?page=${i}">${i}</a></td>
                                                         </c:otherwise>
                                                     </c:choose>
                                                 </c:forEach>
                                             </tr>
                                         </table>

                                         <%--For displaying Next link --%>

                <c:if test="${currentPage lt noOfPages}">
                <td><a href="stations-page.command?page=${currentPage + 1}">Next</a></td>
                </c:if>

                 </div>
                 </div>
               </html>
               </body>
               </html>

