<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
<%@include file="header.jsp" %>
<!-- end navbar -->

<div class="wrapper">
	<div class="header">
	
	</div>
	<div class="main main-raised">
		<div class="container">
			<div class="nav-align-center">
				<br><br>
				<img class="img-circle img-responsive img-raised perfilPaciente" src="img\icono-doctor.png">
				<br><br><br><br><br><br>
				
				<div class="main main-raised perfil-medico">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<br>
							<%
								String nombreMedico = (String)sesion.getAttribute("usuario");
								nombreMedico = nombreMedico.toUpperCase();
								String apellido1Medico = (String)sesion.getAttribute("apellido1");
								apellido1Medico = apellido1Medico.toUpperCase();
								
								if(sesion.getAttribute("apellido2") != null){
									String apellido2Medico = (String)sesion.getAttribute("apellido2");
									apellido2Medico = apellido2Medico.toUpperCase();
									out.println("<h4 id='nombre-perfil'>" + nombreMedico + " " + apellido1Medico + " " + apellido2Medico + "</h4>");
								}
								else{
									out.println("<h4 id='nombre-perfil'>" + nombreMedico + " " + apellido1Medico + "</h4>");
								}
							%>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%
								String email = (String)sesion.getAttribute("email-medico");
								
								out.println("<h4><span class='label-perfil'>Correo electrónico: </span>"+email+"</h4>");
					
							%>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%
								String numeroColegiado = (String)sesion.getAttribute("numero-colegiado");
								out.println("<h4><span class='label-perfil'>Número de colegiado: </span>"+numeroColegiado+"</h4>");
							%>
						</div>
					</div>
				</div>
				<br>
				
			</div>
			<br><br><br><br><br><br>
		</div>
		
		
	</div>
	<%@include file="footer.jsp" %>
</div>


</body>

	<!--   Core JS Files   -->
	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/material.min.js"></script>

	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="js/nouislider.min.js" type="text/javascript"></script>

	<!--  Plugin for the Datepicker, full documentation here: http://www.eyecon.ro/bootstrap-datepicker/ -->
	<script src="js/bootstrap-datepicker.js" type="text/javascript"></script>

	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="js/material-kit.js" type="text/javascript"></script>
	
  
</html>
