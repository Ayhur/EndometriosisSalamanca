<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html;"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;">
		<title>Registrate para entrar en la pagina web</title>
		<!-- CSS -->
		<link rel="stylesheet" href="css/style.css">
		<link rel="stylesheet" href="css/registrostyle.css">
		
		
		<c:if test='${null != dataUserReg} }'> 
<%-- 			<c:set value="someclass" var="in"></c:set> --%>
			<c:set var = "nombreRec" value = "${dataUserReg.nombre}"/>
			<c:set var = "apeRec" value = "${dataUserReg.apellidos}"/>
			<c:set var = "fechaRec" value = "${dataUserReg.fechaNacimiento}"/>
<%-- 			<c:set var = "dniRec" value = "${dataUserReg.dni}"/> --%>
			<c:set var = "emailRec" value = "${dataUserReg.email}"/>
			<c:set var = "userRec" value = "${dataUserReg.usuario}"/>
<%-- 			<c:set var = "passRec" value = "${dataUserReg.password}"/> --%>
<%-- 			<c:set var = "coincPassRec" value = "${dataUserReg.nombre}"/> --%>
		</c:if> 
		
		
		
	</head>
	
	<body>
		 <div class="registro">
	      	<div id="RegistroUsuario">
	
		
		      <!-- VALIDACIONES POR CARLOS -->
<!-- 		  @Ayhur: Voy a comentar ciertos campos por temas de estilo y obsolescencia (required evita que ciertas validaciones sean necesarias) -->
				
				
				
				
<%-- 				<div class="alert" style="color:red">${mensajenombre}</div> --%>
<%-- 				<div class="alert" style="color:red">${mensajeapellido}</div> --%>
<%-- 				<div class="alert" style="color:red">${mensajefechanacimiento}</div> --%>
<%-- 				<div class="alert" style="color:red">${mensajeemail}</div> --%>
<%-- 				<div class="alert" style="color:red">${mensajeusuario}</div> --%>
<%-- 				<div class="alert" style="color:red">${mensajepassword}</div> --%>
<%-- 				<div class="alert" style="color:red">${mensajeconconrdancia}</div> --%>
			  <!--  FIN VALIDACIONES CARLOS -->
			  
		      
	        <form action="ServletRegistroUsuario"	 method="post">
			<div id="contenedor-interno">
	          <fieldset class="clearfix">
	          	<div class="datosFila">
		          	<div class="element1">
			          	<div class="alert" style="color:red">${mensajenombre}</div>
			            <label class="label">Nombre:</label>
		            <input type="text" name="campoNombre" value="${nombreRec}" required>
	            </div>
	            
	            <div class="element2">
		            <div id="alert2" style="color:red">${mensajeapellido}</div>
		            <label id="labelSegundoCampo">Apellidos:</label>
		            <input type="text" name="campoApellidos" value="${apeRec}" required>
	            </div>
	            </div> <!-- Fin div datos fila -->
	            
	            <div class="datosFila">
	            	<div class="element1">
			            <div class="alert" style="color:red">${mensajefechanacimiento}</div>
			            <label class="label">Fecha de nacimiento:</label>
			            <input id="campofecha" type="date" name="campoFechaNacimiento"  value="${fechaRec}" required>
		            </div>
		            
		            <div class="element2">
			            <label id="labelSegundoCampo">DNI:</label>
			            <input type="text" name="campoDNI" value="${dniRec}" required>
		            </div>
				</div>
					            
	            <!-- 					SELECTOR DE PAISES			 -->
	            <div class="datosFila">
	            <label class="label">Pais:</label>
	            <select name="selectPais" id="selectPais" onChange="mostrarComunidad();">
	            	<option class="option" value="-1">---</option>
	            	<c:forEach items="${paises}" var="pais">
	            		<option class="option" value="${pais.id}">${pais.nombre}</option>
	            	</c:forEach>
	            </select>
	            </div>
	            <!-- 						FIN PAISES			 -->
	            
	            <!-- 					SELECTOR DE PROVINCIAS			 -->
	            <div id='comunidades'>            	
	            	<label class="label">Provincia:</label>
		            <select name="selectcomunidades" id="selectcomunidades" onChange="mostrarMunicipios();" >
		            	<option class="option" value="-1">------</option>
		            </select>
	            </div>
	            <!-- 						FIN PROVINCIAS			 -->
	            
	            <!-- 					SELECTOR DE LOCALIDADES			 -->
	            <div id='municipios'>	
		            <label class="label">Municipio:</label>
		            <select name="selectMunicipios" id="selectMunicipios">
		          	  <option class="option" value="-1">------</option>
		            </select>
	            </div>
	             <!-- 					FIN LOCALIDADES				 -->
	            
	            <div class="alert" style="color:red">${mensajeemail}</div>
	            <label class="label">Email:</label>
	            <input type="email" name="campoEmail" value="${emailRec}" required>
	           	<br>
	           	
	           	<div class="alert" style="color:red">${mensajeusuario}</div>
	            <label class="label">Usuario:</label>
	            <input type="text" name="campoUsuario" value="${userRec}" required>
	            <br/>
	            
	            <div class="alert" style="color:red">${mensajepassword}</div>
	            <label class="label">Contraseña:</label>
	            <input type="password" name="campoPassword" required>
	             <br/>
	           
	            <div class="alert" style="color:red">${mensajeconconrdancia}</div>
			    <label class="label">Repita la contraseña:</label>
	            <input type="password" name="campoRepetirPassword" required>
	             <br/>
	           	
	           	<input type="checkbox" name="aceptar_terminos" id="aceptar_terminos" value="aceptar_terminos" required /> 
	           	<label id="terminoslbl">He leído y acepto la <a href="#" target="_blank">Política de Privacidad</a></label>
	           	 <br/>
				<input type="submit" id="btnEnviar" value="Registrarse" disabled>
	
	          </fieldset>
			</div>
	        </form>
	
	      </div> <!-- end login -->
	    </div>
		
		<!--  JQUERY -->
		<script type="text/javascript" src="./jquery/jquery.js"></script>
		<script type="text/javascript" src="./jquery/registroJQ.js"></script>
		
		<!--  JS -->
		<script src="./js/registro.js"></script>
		
	</body>
</html>