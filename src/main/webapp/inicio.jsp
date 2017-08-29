<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>glUCModel</title>

	<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'  />

	<!--     Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/material-kit.css" rel="stylesheet"/>
	<link href="css/cssPropioLogin.css" rel="stylesheet"/>
</head>

<body style="background-image: url('img/imagenFondo.jpg'); background-size: cover; background-position: top center;">

<!-- Navbar will come here -->


<nav class="navbar navbar-transparent navbar-absolute" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
    </button>
    <a class="navbar-brand" href="#">glUCModel</a>
  </div>
</nav>


<!-- end navbar -->

<div class="wrapper">
	<div class="header"></div>
	
		<div class="container">	
			<div class="row">
				<div class="col-md-4 col-md-offset-4 col-md-4 col-md-4">
					<div class="card card-signup" id="card-login">
						<form class="form" onsubmit="return validacionLogin()" action="login" method="post">
							<div id="header-login" class="header header-primary text-center">
								<h3>Iniciar Sesión</h3>
							</div>
							
							<div class="content">
								<div class="input-group">
									<span class="input-group-addon">
										<i class="material-icons">email</i>
									</span>
									<div class="form-group is-empty" id="div-email">
										<input type="text" class="form-control" required="required" id="email" name="email" placeholder="Email">
										<span class="material-input"></span>
									</div>
								</div>
									
								<div class="input-group">
									<span class="input-group-addon">
										<i class="material-icons">lock</i>
									</span>
									<div class="form-group is-empty" id="div-pass">
										<input type="password" class="form-control" required="required" id="password" name="password" placeholder="Contraseña">
										<span class="material-input"></span>
									</div>
								</div>
							</div>
							
							<div class="footer text-center">
								<% 
									HttpSession sesion = request.getSession();
								    if(sesion.getAttribute("fallo") != null){
								    	boolean fallo = (boolean)sesion.getAttribute("fallo");
									 	if(fallo){
									 		out.println("<div id='fallo-inicio'>");
										 	out.println("<br>");
										 	out.println("<p id='error-login'>Fallo en el inicio de sesión</p>");
										 	out.println("</div>");
									 	}
								    }
								 	
								 	
								%>
								<div id="fallo-email" style="display: none;">
									<br>
									<p id="error-email">Introduzca un formato de email válido</p>
								</div>
								<div id="fallo-espacios" style="display: none;">
									<br>
									<p id="error-espacios">Introduzca un cadena sin espacios</p>
								</div>		
								<input id="boton-login" class="btn btn-simple btn-primary btn-lg" type="submit" value="Entrar">
							</div>
						</form>
					</div>

				</div>
				
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
	
	<script>
		function validacionLogin(){
			var email = $("#email").val();
			var pass = $("#password").val();
			var emailRegex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

			if(/^\s+$/.test(email) ) {
				  $("#fallo-espacios").show();
				  $("#fallo-espacios").css("color", "red");
				  $("#div-email").append("<span class='material-icons form-control-feedback'>clear</span>");
				  $("#fallo-email").hide();
				  return false;
			}
			else if(/^\s+$/.test(pass) ) {
				  $("#fallo-espacios").show();
				  $("#fallo-espacios").css("color", "red");
				  $("#div-pass").append("<span class='material-icons form-control-feedback'>clear</span>");
				  $("#fallo-email").hide();
				  return false;
			}
			else if(!emailRegex.test(email)){
				$("#fallo-email").show();
				$("#fallo-email").css("color", "red");
				$("#div-email").append("<span class='material-icons form-control-feedback'>clear</span>");
				$("#fallo-espacios").hide();
				return false;
			}
			else{
				$("#fallo-espacios").hide();
				$("#fallo-email").hide();
				return true;
			}
	
		}

	</script>
	
</html>
