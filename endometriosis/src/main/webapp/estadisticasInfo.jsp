<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Estadisticas, informacion</title>
		<link rel="stylesheet" href="css/registroPreguntaStyle.css">
	</head>
	<body>
		
		<!-- INICIO contenedor de la pagina entera -->
		<div class="formularioRegistroPregunta">
		
			<!-- INICIO contenedor buscador -->
			<div id="contenedorBuscador">
			  	<fieldset>
			  	<legend>Buscar:</legend>
	            <form action="ServletCrearDiagraBarrasHorizontal" method="post">
	            	<div class="contenedorFilaEnunciados">
	            		<label>Sobre que pregunta desea realizar la consulta:</label>
	            	</div>
	            	<div class="contenedorFilaDatos">
	            	
	            		<!-- 				SELECTOR DE PREGUNTAS			 -->
		            	<select name="selectPregunta" id="selectPregunta">
		            	<option class="option" value="-1">---</option>
		            	<c:forEach items="${preguntas}" var="pregunta">
		            		<option class="option" value="${pregunta.idpregunta}">${pregunta.descripcion}</option>
	            		</c:forEach>
	            		</select>
            			<!-- 			FIN	SELECTOR DE PREGUNTAS			 -->
	            	</div>
	            	
	            	<!-- 				SELECTOR DE PAIS			 -->
	            	<div class="contenedorFilaEnunciados">
	            		<label>Pais:</label>
            		</div>
            		 <select name="selectPais" id="selectPais" onChange="mostrarComunidad();">
	            	<option class="option" value="-1">---</option>
	            	<c:forEach items="${paises}" var="pais">
	            		<option class="option" value="${pais.id}">${pais.nombre}</option>
	            	</c:forEach>
	          		</select>
	            	<!-- 			FIN	SELECTOR DE PAIS			 -->
	            	
	            	<!-- 				SELECTOR DE COMUNIDAD			 -->
	            	<div id='comunidades'>            	
		            	<div class="contenedorFilaEnunciados">
		            		<label>Comunidad:</label>
	            		</div>
			            <select name="selectcomunidades" id="selectcomunidades" onChange="mostrarMunicipios();" >
			            	<option class="option" value="-1">------</option>
			            </select>
	          		</div>
	            	<!-- 			FIN	SELECTOR DE COMUNIDAD			 -->
	            	
	            	<!-- 				SELECTOR DE LOCALIDAD			 -->
	            	<div id='municipios'>	
			            <div class="contenedorFilaEnunciados">
		            		<label>Localidad:</label>
	            		</div>
			            <select name="selectMunicipios" id="selectMunicipios">
			          	  <option class="option" value="-1">------</option>
			            </select>
	          		</div>
	            	
	            	<!-- 			FIN	SELECTOR DE LOCALIDAD			 -->
	            	
	            	
	            	<!-- 	CAMPO EDAD		 -->
	            	<div class="contenedorFilaEnunciados">
	            		<label>Edad:</label>
            		</div>
            		<div class="filaDatos">
            			<input type="text">
            		</div>
	            	<!-- 	FIN CAMPO EDAD		 -->
	            	
	            	
	            	
	            	<!--	 CAMPO DESDE FECHA	 -->
	            	<div><label>Desde:</label></div>
	            	<div>
		            	<input id="campofechaDesde" type="date" name="campoFechaDesde">
	            	</div>
	            	<!--	 FIN CAMPO DESDE FECHA	 -->
	            	
	            	<!--	 CAMPO HASTA FECHA	 -->
	            	<div><label>Hasta:</label></div>
	            	<div>
	            		<input id="campofechaHasta" type="date" name="campoFechaHasta">
	            	</div>
	            	<!--	 FIN CAMPO HASTA FECHA	 -->
	            	<button type="submit" value="VerDatos">Ver Datos</button>
	            	<button type="submit" value="GeneraInforme">Generar Informe</button>
	            </form>
	            </fieldset>
			</div>
            <!-- FIN contenedor buscador -->
	         
		</div>
		<!-- FIN contenedor de la pagina entera -->
		
		
<%-- 		<canvas id="myChart" width="800" height="500"></canvas> --%>
<%-- 		<canvas id="myChart" width="400" height="250"></canvas> --%>
		<br/>
<!-- 		<button id="botonVolver" onclick="location.href='endometriosis.jsp'">Volver al menu</button> -->
		<button id="btnVolverEstadist" onclick="location.href='endometriosis.jsp'">Volver al menu</button>
		
		
		<!-- 	 	JQUERY IMPORT LIBRARY	 -->
		<script type="text/javascript" src="./jquery/jquery.js"></script>
		<!--  		JS 	IMPORT LIBRARY		 -->
		<script src="./js/Chart.js"></script>
		<!--    	JQUERY   				 -->
		<script src="./jquery/crearDiagramaBarras.js"></script>
		<script type="text/javascript" src="./jquery/registroJQ.js"></script>
		<!--  		JS 						-->
		<script src="./js/registro.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
		
		<!--  Nota: al agregar la libreria registro.js se genera
				un error de javascript porque en la pagina de estadisticas
				no se encuentra un elemento que se instancia al comienzo del fichero
				tratar de generar logica para parchear el error (validar si existe) -->
		
	</body>
</html>