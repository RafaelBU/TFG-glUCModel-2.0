<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>glUCModel</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />

	<!--Fonts and icons     -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />

	<!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/material-kit.css" rel="stylesheet"/>
	<link href="css/cssPropioApp.css" rel="stylesheet"/>
	
	<link rel="stylesheet" href="AdminLTE-2.3.7/bootstrap/css/bootstrap.min.css">
  	<link rel="stylesheet" href="AdminLTE-2.3.7/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="AdminLTE-2.3.7/dist/css/skins/_all-skins.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	
</head>

<body class="fondoDefault">
	
	<%
		HttpSession sesion = request.getSession();
		if(sesion.getAttribute("login") == null)
			response.sendRedirect("inicio.jsp");
	%>

<nav id ="navHeader" class="navbar navbar-info navbar-absolute" role="navigation">
  <!-- El logotipo y el icono que despliega el menú se agrupan
       para mostrarlos mejor en los dispositivos móviles -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse"
            data-target=".navbar-ex1-collapse">
      <span class="sr-only">Desplegar navegación</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="indexMedico.jsp">glUCModel</a>
  </div>
 
  <!-- Agrupar los enlaces de navegación, los formularios y cualquier
       otro elemento que se pueda ocultar al minimizar la barra -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
	<ul class="nav navbar-nav">
		<li>
			<a href="indexMedico.jsp">
				<i class="material-icons">assignment</i>
				Recomendaciones
			</a>
		</li>
		<li>
			<a href="gestionPacientes.jsp">
				<i class="material-icons">group</i>
				Gestión de pacientes    
			</a>
		</li>
		<li>
			<a href="#documentos">
				<i class="material-icons">folder</i>
				Gestión de documentos
			</a>
		</li>
						
		<!--</ul>-->
		<li>
			<a class ="navbar-brand" href="http://educacion.dacya.ucm.es/moodle">
			<i class="material-icons">school</i>
			Educación para la diabetes   
			</a>
		</li>
	</ul>
	
    <ul class="nav navbar-nav navbar-right">
	  <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="img\icono-doctor.png" class="user-image" alt="User Image">
            <span class="hidden-xs">
            <%
            String nombre = (String)sesion.getAttribute("usuario");
            String apellido1 = (String)sesion.getAttribute("apellido1");
            String apellido2 = (String)sesion.getAttribute("apellido2");
            if(apellido2 == null)
        		out.println(nombre + " " + apellido1); 
            else
            	out.println(nombre + " " + apellido1 + " " + apellido2); 
        	
        		
        	%></span>
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header menu-medico">
              <img src="img\icono-doctor.png" class="img-circle" alt="User Image">
              <p>
                <%
                if(apellido2 == null)
            		out.println(nombre + " " + apellido1); 
                else
                	out.println(nombre + " " + apellido1 + " " + apellido2); 
                %> 
              </p>
            </li>
            <li class="user-footer">
              <div class="pull-left">
                <a href="perfilMedico.jsp" class="btn btn-default btn-flat">Perfil</a>
              </div>
              <div class="pull-right">
                <a href="logout" class="btn btn-default btn-flat">Cerrar Sesión</a>
              </div>
            </li>
          </ul>
        </li>
    </ul>
  </div>
</nav>