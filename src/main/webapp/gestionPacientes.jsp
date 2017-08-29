<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<%@include file="header.jsp" %>
<!-- end navbar -->
<div class="wrapper">
	<div class="header">
	
	</div>
	<div class="main main-raised">
		<div class="container">
			<div class="nav-align-center">
				<ul class="nav nav-pills nav-pills-info nav-justified" role="tablist">
							<br><br>
							<li class="active">
								<a href="#lista" role="tab" data-toggle="pill">
									<i class="material-icons">assignment</i>
									Listado de pacientes
								</a>
							</li>
							<li>
								<a href="#nuevoPaciente" role="tab" data-toggle="pill">
									<i class="material-icons">person_add</i>
									Dar de alta a un paciente   
								</a>
							</li>
						
						</ul>
			
						
			<div class="tab-content">
					 <div id="lista" class="tab-pane fade in active">
						  <br><br>
							<div class="row">
								<div class="col-md-4 col-md-offset-4">
									<h3>Pacientes</h3>
								</div>
						
								<br><br>
								<div class="col-md-4">
									<input id="buscador-pacientes" type="text" name="buscador" placeholder="Buscar paciente" style="background-image: url('img/searchicon2.png')">
								</div>
							</div>
							
							<div id="listado-pacientes">
							</div>
							
							<br><br>
							
							<div id="page-selection">
							</div>
							
					</div>
					
					<br><br>
					
					<div id="nuevoPaciente" class="tab-pane fade">
						<br><br>
						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								<h3>Formulario de Alta</h3>
							</div>
						</div>
						
						<div id="form-alta-paciente">
							<form class="form" onsubmit="return validacionAlta()" method="post" action="altaPaciente">
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="nombre">Nombre</label>
										<input type="text" class="form-control" name="nombre" id="nombre" required="required" placeholder="Nombre">
									  </div>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="apellidos">Primer apellido</label>
										<input type="text" class="form-control" name="apellido1" id="apellido1" required="required" placeholder="Primer apellido">
									  </div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="apellidos">Segundo apellido</label>
										<input type="text" class="form-control" name="apellido2" id="apellido2" placeholder="Segundo apellido">
									  </div>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
										<input class="datepicker form-control" name="fechaN" type="date" required="required" placeholder="Fecha de nacimiento"/>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="DNI">DNI</label>
										<input type="text" class="form-control" name="DNI" id="DNI" required="required" placeholder="DNI">
									  </div>
									</div>
								</div>
								
								<div class="row" id="div-email">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="email">Email</label>
										<input type="text" class="form-control" name="email" id="email" required="required" placeholder="Dirección de email">
									  </div>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="altura">Altura</label>
										<input type="number" min="1" step="0.01" class="form-control" name="altura" id="altura" required="required" placeholder="Altura en metros">
									  </div>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <select class="form-control" name="sexo-paciente" required="required">
										  <option value="hombre">Hombre</option>
										  <option value="mujer">Mujer</option>
									  </select>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
										<input class="datepicker form-control" name="fechaC" type="date" required="required" placeholder="Fecha del consentimiento"/>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="contraseña">Contraseña</label>
										<input type="password" class="form-control" name="contrasena" id="contrasena" required="required" placeholder="Contraseña">
									  </div>
									</div>
								</div>
							  
								<div class="row" id="div-password">
									<div class="col-md-4 col-md-offset-4">
									  <div class="form-group">
										<label class="sr-only" for="repe-contraseña">Repetir contraseña</label>
										<input type="password" class="form-control" id="repe-contrasena" required="required" placeholder="Repetir contraseña">
									  </div>
									</div>
								</div>
							  
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
									  <div class="checkbox">
										<label>
										  <input type="checkbox" required="required">Marque para confirmar el consentimiento del paciente
										</label>
									  </div>
									</div>
								</div>
							  
							    <br><br>
							    <input type="submit" class="btn btn-success btn-round btn-lg" id="boton-alta-paciente" value="Dar de alta">
							</form>
						</div>

					</div>
			</div>
				
			</div>
		</div>
			
		<br><br><br>
	</div>
		
	<%@include file="footer.jsp" %>
	</div>
	
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
	
	<!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript" src="js/jquery.bootpag.min.js"></script>
	
  
  <script>
  function validacionAlta(){
		var pass = $("#contrasena").val();
		var pass2 = $("#repe-contrasena").val();
		var emailP = $("#email").val();
		//var existe;
		
		//$.post("compruebaEmail",{emailP : emailP},function(emailUsado){
				//existe = emailUsado;
		//});
		var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

		if(!emailRegex.test(emailP)) {
			$("#error-pass").hide();
			$("#div-email").append("<div class='col-md-4 col-md-offset-4'><p id='error-email'>Formato de email incorrecto</p></div>");
			return false;
		}
		else if(pass != pass2){
			$("#error-email").hide();
			$("#div-password").append("<div class='col-md-4 col-md-offset-4'><p id='error-pass'>No coinciden las contraseñas</p></div>");
			return false;
		}
		//else if(existe){
			//$("#email").addClass("has-error");
			//return false;
		//}
		else{
			$("#error-email").hide();
			$("#error-pass").hide();
			return true;
		}
 	 }
  </script>
  
  <script>
  $(document).ready(function() {
   
   $('[data-toggle="tooltip"]').tooltip();

     //Recorre el JSON devuelto por la petición GET y muestra la lista de pacientes
	 function rellenaListaPacientes(data) {
		 
		 $.each(data, function(index, paciente) {
			 if(paciente.surname2 != null){
				 $("#listado-pacientes").append("<div class='main main-raised pacientes'><div class='row'>" +
		  				 "<div class='col-md-4'>" +
								"<form method='post' action='datosPaciente'>" +
		 							"<input type='hidden' name='id-paciente' value="+ paciente.id + ">" +
		 							"<input type='hidden' name='nombre-paciente' value="+ paciente.name + ">" +
		 							"<input type='hidden' name='apellido1-paciente' value="+ paciente.surname1 + ">" +
		 							"<input type='hidden' name='apellido2-paciente' value="+ paciente.surname2 + ">" +
		 							"<button type='submit' class='btn btn-primary btn-simple'>"+ paciente.name + " " + paciente.surname1 + " " + paciente.surname2 + "</button>" +
		 					   "</form>" +
		 				"</div>" +
		 				"<div class='col-md-4'>" +
		 					"<p class='infoPaciente'>Paciente desde " + paciente.fechaconsen + "</p>" +
		 				"</div>" +
		 				"<div class='col-md-4'>" +
		 					"<form method='post' action='datosRecomendador'>" +
	 							"<input type='hidden' name='id-paciente' value="+ paciente.id + ">" +
	 							"<input type='hidden' name='nombre-paciente' value="+ paciente.name + ">" +
	 							"<input type='hidden' name='apellido1-paciente' value="+ paciente.surname1 + ">" +
	 							"<input type='hidden' name='apellido2-paciente' value="+ paciente.surname2 + ">" +
	 							"<input id='boton-verRecomendador' class='btn btn-success boton-reco-paciente' type='submit' value='Ver recomendador'>" +
		 					"</form>" +
		 				"</div>" +
		 			"</div></div>" + "<br><br><br><br>");
			 }
			 else{
				 $("#listado-pacientes").append("<div class='main main-raised pacientes'><div class='row'>" +
		  				 "<div class='col-md-4'>" +
								"<form method='post' action='datosPaciente'>" +
		 							"<input type='hidden' name='id-paciente' value="+ paciente.id + ">" +
		 							"<input type='hidden' name='nombre-paciente' value="+ paciente.name + ">" +
		 							"<input type='hidden' name='apellido1-paciente' value="+ paciente.surname1 + ">" +
									"<button type='submit' class='btn btn-primary btn-simple'>"+ paciente.name + " " + paciente.surname1 +"</button>" +
								"</form>" +
		 				"</div>" +
		 				"<div class='col-md-4'>" +
		 					"<p class='infoPaciente'>Paciente desde " + paciente.fechaconsen + "</p>" +
		 				"</div>" +
		 				"<div class='col-md-4'>" +
		 					"<form method='post' action='datosRecomendador'>" +
	 							"<input type='hidden' name='id-paciente' value="+ paciente.id + ">" +
	 							"<input type='hidden' name='nombre-paciente' value="+ paciente.name + ">" +
	 							"<input type='hidden' name='apellido1-paciente' value="+ paciente.surname1 + ">" +
	 							"<input id='boton-verRecomendador' class='btn btn-success boton-reco-paciente' type='submit' value='Ver recomendador'>" +
		 					"</form>" +
		 				"</div>" +
		 			"</div></div>" + "<br><br><br><br>");
			 }

	  			$("#listado-pacientes").css("padding-top", "80px");
	  			$("#listado-pacientes").css("padding-bottom", "18px");
	  		});

	};

	
	
    //Cargar listado de pacientes al cargar la pagina
	window.onload = function() {
		
		$.get("listaPacientes",{num : 1},function(responseJson){
				
			 rellenaListaPacientes(responseJson);
				
		  }).fail(function () {
		        (".alert").show();
		    });
	}

	function contadorPaginas(data) {
		 var num = 0;
		 $.each(data, function(index, paciente) {
			 	num++;
	  		});

		 var total = num / 2;
		 total = Math.round(total);
		 		 
		 $('#page-selection').bootpag({
		       total : total,
		       page : 1
		   }).on("page", function(event, num){
			   $.get("listaPacientes",{num : num},function(responseJson){

				     $("#listado-pacientes").empty();
					 rellenaListaPacientes(responseJson);
						
				  }).fail(function () {
				        (".alert").show();
				    });
		   });
	};
	
    function numeroPaginas(){
    	$.get("numeroPacientes",function(responseJson){
    		
   		 contadorPaginas(responseJson);
   			
   	  }).fail(function () {
   	        (".alert").show();
   	    });
    }
	
	
	 numeroPaginas();
	 
	 
	   
    //Buscar pacientes mediante el buscador
	$("#buscador-pacientes").keyup(function(){

		//Si borramos la búsqueda nos carga el listado entero
		if($("#buscador-pacientes").val().length < 1){
			$.get("listaPacientes",{num : 1}, function(responseJson){

				 $("#listado-pacientes").empty();
				 $('#page-selection').show();
				 rellenaListaPacientes(responseJson);
					
			  }).fail(function () {
			        (".alert").show();
			    });
		}
		else{
			if($("#buscador-pacientes").val().length >= 3){
				var paciente = $("#buscador-pacientes").val();
				$.get("buscaPacientes", {nombrePaciente : paciente}, function(responseJson){

					 $("#listado-pacientes").empty();
					 $('#page-selection').hide();
					 if($.isEmptyObject(responseJson))
						 $("#listado-pacientes").html("<h3>No hay coincidencias</h3>");
					 else
						 rellenaListaPacientes(responseJson);
					 
				  })
			}
			else{
				$("#listado-pacientes").html("<h3>Esperando resultados</h3>");
				$('#page-selection').hide();
			}
		}
		
	});
		
	  
	$('.datepicker').datepicker({
		weekStart:1
	});

});

  </script>

</html>
