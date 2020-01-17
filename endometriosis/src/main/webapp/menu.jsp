<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<c:choose>
       <c:when test = "${null != sessionScope.idUserAdmin}">
<!--         	<span style="color: red;">Usuario identificado, redirigiendo a la web endometriosis</span> -->
			<meta http-equiv="refresh" content="0; url=endometriosis.jsp">
       </c:when>
       
       <c:when test = "${null != sessionScope.user.id}">
<!--           	<span style="color: red;">Usuario identificado, redirigiendo a la web endometriosis</span> -->
			<meta http-equiv="refresh" content="0; url=endometriosis.jsp">
       </c:when>
       
       <c:otherwise>
<!--          	<span style="color: red;">Debes identificarte para acceder al sitio web</span> -->
			<meta http-equiv="refresh" content="0; url=login.jsp">
       </c:otherwise>
</c:choose>





<!-- SI  HAY UNA SESION ADMIN LOCALIZADA SE REDIRIGIRÁ AL USUARIO  -->
<%-- <c:if test="${null != sessionScope.idUserAdmin.id}"> --%>
<!-- 	<span style="color: red;">Usuario identificado, redirigiendo a la web endometriosis</span> -->
<!-- 	<meta http-equiv="refresh" content="10; url=endometriosis.jsp"> -->
<%-- </c:if>	 --%>

<!-- SI  HAY UNA SESION LOCALIZADA SE PODRÁ MOVER AL SIGUIENTE PUNTO -->
<%-- <c:if test="${ sessionScope.user.id != null }"> --%>
<%-- <c:if test="${null != sessionScope.user.id}"> --%>
<!-- 	<span style="color: red;">Usuario identificado, redirigiendo a la web endometriosis</span> -->
<!-- 	<meta http-equiv="refresh" content="10; url=endometriosis.jsp"> -->
<%-- </c:if>	 --%>


<!-- SI NO HAY UNA SESION LOCALIZADA SE REDIRIGIRÁ AL USUARIO UNA Y OTRA VEZ A LOGIN -->
<%-- <c:if test="${ sessionScope.user.id == null }"> --%>
<%-- <c:if test="${null == sessionScope.user}"> --%>
<!-- 	<span style="color: red;">Debes identificarte para acceder al sitio web</span> -->
<!-- 	<meta http-equiv="refresh" content="1; url=login.jsp"> -->
<%-- </c:if> --%>
