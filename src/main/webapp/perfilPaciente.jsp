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
				
				<br><br><br><br><br><br><br>
				<div class="main main-raised perfil-pacientes">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<br>
							<%
								String nombrePaciente = (String)sesion.getAttribute("nombre-paciente");
								nombrePaciente = nombrePaciente.toUpperCase();
								String apellido1Paciente = (String)sesion.getAttribute("apellido1-paciente");
								apellido1Paciente = apellido1Paciente.toUpperCase();
								
								if(sesion.getAttribute("apellido2-paciente") != null){
									String apellido2Paciente = (String)sesion.getAttribute("apellido2-paciente");
									apellido2Paciente = apellido2Paciente.toUpperCase();
									out.println("<h4 id='nombre-perfil'>" + nombrePaciente + " " + apellido1Paciente + " " + apellido2Paciente + "</h4>");
								}
								else{
									out.println("<h4 id='nombre-perfil'>" + nombrePaciente + " " + apellido1Paciente + "</h4>");
								}
							%>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%
								double altura = (double)sesion.getAttribute("altura");
								double peso = (double)sesion.getAttribute("peso");
								int edad = (int)sesion.getAttribute("edad");
								
								out.println("<h4><span class='label-perfil'> Edad: </span>"+edad+" años</h4>");
					
							%>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%
							if((double)sesion.getAttribute("peso") != -1)
								out.println("<h4><span class='label-perfil'>Peso: </span>"+peso+" Kg</h4>");
							else
								out.println("<h4><span class='label-perfil'>Peso: Sin registros</span></h4>");
							%>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%out.println("<h4><span class='label-perfil'>Altura: </span>"+altura+" m</h4>"); %>
						</div>
					</div>
				</div>
				
				<br>
				<br>
				<hr>
				<br>
				
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<h3>Variables bajo seguimiento</h3>	
						<br>				
					</div>
				</div>
				
				<!-- Carousel Card -->
						<div class="card card-raised card-carousel">
							<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
								<div class="carousel slide" data-ride="carousel">

									<!-- Indicators -->
									<ol class="carousel-indicators">
										<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
										<li data-target="#carousel-example-generic" data-slide-to="1"></li>
										<li data-target="#carousel-example-generic" data-slide-to="2"></li>
									</ol>

									<!-- Wrapper for slides -->
									<div class="carousel-inner">
										<div class="item active">
											<div id="grafica-peso" width='100%'></div>
										</div>
										<div class="item">
											<div id="grafica-glucemias" width='100%'></div>
										</div>
										<div class="item">
											<div id="grafica-insulina" width='100%'></div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Carousel Card -->
			</div>
		</div>
			<br><br><br><br><br><br>
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
	
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
  <script>
  $(document).ready(function() {

	function grafica_peso(data) {

		var now = new Date(Date.now());
		var anyo = now.getFullYear();
		var opciones = new Highcharts.Chart({
			chart: {
			    renderTo: 'grafica-peso'
			},
			title: {
				text: 'Peso',
				x: -20 //center
			},
			subtitle: {
				text: 'A lo largo del año',
				x: -20 //center
			},
			xAxis: {
				title: {
					text: 'Fecha'
				},
				type: 'datetime',
				 maxZoom: 48 * 3600 * 1000
			},
			yAxis: {
				title: {
					text: 'Peso (en Kg)'
				},
				plotLines: [{
					value: 0,
					width: 1,
					color: '#808080'
				}]
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: 'Peso',
				data : data,
				pointStart: Date.UTC(anyo, 0),
				pointInterval : 24 * 3600 * 1000 * 31
			}]

		 
		});
	}
	
	function grafica_glucemias(data) {

	var opciones = new Highcharts.Chart({
		chart: {
			    renderTo: 'grafica-glucemias'
		},
		title: {
            text: 'Glucemias',
            x: -20 //center
        },
        subtitle: {
            text: 'A lo largo del día',
            x: -20 //center
        },
        xAxis: {
        	title: {
                text: 'Hora'
            },
			 categories: ['7:00', '10:00', '13:00', '15:00', '19:00', '22:00', '0:00']
        },
        yAxis: {
            title: {
                text: 'Glucemias'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Glucemia',
            data : data
        }]
	});
	
}

function grafica_insulina(data) {

	var opciones = new Highcharts.Chart({
		chart: {
		    renderTo: 'grafica-insulina'
		},
		title: {
            text: 'Insulina',
            x: -20 //center
        },
        subtitle: {
            text: 'A lo largo del día',
            x: -20 //center
        },
        xAxis: {
        	title: {
                text: 'Hora'
            },
            categories: ['7:00', '10:00', '13:00', '15:00', '19:00', '22:00', '0:00']
        },
        yAxis: {
            title: {
                text: 'Insulina'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Insulina',
            data : data
        }]
	});
	
}
	
	$.post("cargaPesos",function(responseJson){

		 grafica_peso(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });

	$.post("cargaGlucemias",function(responseJson){

		 grafica_glucemias(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });

	$.post("cargaInsulinas",function(responseJson){

		 grafica_insulina(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });
  } );
  </script>

</html>
