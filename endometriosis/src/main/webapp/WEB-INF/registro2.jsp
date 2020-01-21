<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
	<head>
<!-- 		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- 		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<!-- 		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="css/registro.css">
		
		
		<c:if test='${null != dataUserReg} '> 
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

		<!------ Include the above in your HEAD tag ---------->
		<div class="container register" id="contenedor">
                <div class="row contenedorRegistro">
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>Bienvenida</h3>
                        <p>¡Estas a 30 segundos de ayudar a muchas mujeres en el mundo!</p>
<!--                         <input type="submit" name="" value="Login"/><br/> -->
                    </div>
                    <div class="col-md-9 register-right">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Registrate como nueva usuaria</h3>
                                
                                <form action="ServletRegistroUsuario"	 method="post">
                                <div class="row register-form">
                                	
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Nombre *" name="campoNombre" value="${nombreRec}" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Apellidos *" name="campoApellidos" value="${apeRec}" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Usuario *" name="campoUsuario" value="${userRec}" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Contraseña *" name="campoPassword" required />
                                        </div>
                                        <!-- 					SELECTOR DE PAISES			 -->
                                        <div class="form-group">
                                            <select class="form-control" name="selectPais" id="selectPais" onChange="mostrarComunidad();">
                                                <option class="hidden"  selected disabled>Selecciona tu pais</option>
                                                <c:forEach items="${paises}" var="pais">
							            			<option class="option" value="${pais.id}">${pais.nombre}</option>
							            		</c:forEach>
                                            </select>
                                        </div>
                                        <!-- 						FIN PAISES				 -->
                                        <!-- 					SELECTOR DE LOCALIDADES			 -->
                                          <div class="form-group" id='municipios'>
                                            <select class="form-control" name="selectMunicipios" id="selectMunicipios">
                                                <option class="hidden"  selected disabled>Selecciona tu localidad</option>
                                            </select>
                                        </div>
                                        <!-- 					FIN LOCALIDADES					 -->
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" name="campoEmail" value="${emailRec}" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="text"  class="form-control" placeholder="DNI *" name="campoDNI" value="${dniRec}" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="text"  class="form-control" placeholder="Año nacimiento *" data-date-format="DD MMMM YYYY" onfocus="(this.type='date')" onblur="(this.type='text')" name="campoFechaNacimiento"  value="${fechaRec}" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control"  placeholder="Repite contraseña *" name="campoRepetirPassword" required />
                                        </div>
                                        <!-- 					SELECTOR DE PROVINCIAS			 -->
                                        <div class="form-group" id='comunidades'>
                                            <select class="form-control" name="selectcomunidades" id="selectcomunidades" onChange="mostrarMunicipios();" >
                                                <option class="hidden"  selected disabled>Selecciona tu comunidad</option>
                                            </select>
                                        </div>
                                        <!-- 						FIN PROVINCIAS				 -->
                                         <div class="form-group">
                                            <input type="checkbox" name="aceptar_terminos" id="aceptar_terminos" value="aceptar_terminos" required />
                                            <label class="form-control" id="terminoslbl">He leído y acepto la <a href="#" target="_blank">Política de Privacidad</a></label>
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Register"/>
                                    </div>
                                </div>
                                </form>
                                
                                
                            </div>
                            <div class="tab-pane fade show" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Apply as a Hirer</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Last Name *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Usuario *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" maxlength="10" minlength="10" class="form-control" placeholder="Phone *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="checkbox" class="form-control" name="aceptar_terminos" id="aceptar_terminos" value="aceptar_terminos" required />
                                            <label class="form-control" id="terminoslbl">He leído y acepto la <a href="#" target="_blank">Política de Privacidad</a></label>
                                        </div>


                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" placeholder="Confirm Password *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="date"  class="form-control" placeholder="Año nacimiento *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <select class="form-control">
                                                <option class="hidden"  selected disabled>Please select your Sequrity Question</option>
                                                <option>What is your Birthdate?</option>
                                                <option>What is Your old Phone Number</option>
                                                <option>What is your Pet Name?</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="`Answer *" value="" />
                                        </div>
                                        <input type="submit" class="btnRegister"  value="Registrar"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
	
		<!--  JQUERY -->
		<script type="text/javascript" src="./jquery/jquery.js"></script>
		<script type="text/javascript" src="./jquery/registroJQ.js"></script>
		
		<!--  JS -->
		<script src="./js/NuevoRegistro.js"></script>
	
	</body>
</html>