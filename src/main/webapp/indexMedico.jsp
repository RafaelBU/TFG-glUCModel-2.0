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
					<div id="alerta-success" class="alert alert-success" style="display:none;">
						<div class="container-fluid">
						  <div class="alert-icon">
							<i class="material-icons">check</i>
						  </div>
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true"><i class="material-icons">clear</i></span>
						  </button>
						  <h5><b>Recomendación añadida con éxito</b></h5>
						</div>
				   </div>
				   
				   <div id="alerta-warning" class="alert alert-warning" style="display:none;">
					    <div class="container-fluid">
						  <div class="alert-icon">
							<i class="material-icons">warning</i>
						  </div>
						  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
							<span aria-hidden="true"><i class="material-icons">clear</i></span>
						  </button>
					      <h5><b>Los criterios definidos no son válidos para ningún paciente</b></h5>
					    </div>
				   </div>
				  
					<br>
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<h3>Recomendador</h3>
						</div>
					</div>
						<div class="row">
							<div class="col-md-4 col-md-offset-4">
								<div id="infoRecomendador">
									<h4><small>Rellene el formulario y pulse sobre el botón guardar para generar una nueva recomendación</small></h4>
								</div>
							</div>
						</div>
					<br><br>
					
					
					<div id="formulario-recomendaciones">
						<form class="form-horizontal" role="form">
						<div class="panel panel-default">
							<div class="panel-heading"><h4>Descripción</h4></div>
							<div class="panel-body" style="padding-bottom: 0px;">
							
							  <div class="form-group ">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-ade" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Antes del desayuno</label>
								<div class="col-lg-4">
								  <input class="form-control" id="antesDHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="antesDHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <div class="form-group">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-dd" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Después del desayuno</label>
								<div class="col-lg-4">
								  <input class="form-control" id="despuesDHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="despuesDHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <div class="form-group">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-mm" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Media mañana</label>
								<div class="col-lg-4">
								  <input class="form-control" id="mediaMaHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="mediaMaHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <div class="form-group">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-dco" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Después de comer</label>
								<div class="col-lg-4">
								  <input class="form-control" id="despuesCoHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="despuesCoHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <div class="form-group">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-m" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Merienda</label>
								<div class="col-lg-4">
								  <input class="form-control" id="meriendaHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="meriendaHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <div class="form-group">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-dce" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Después de cenar</label>
								<div class="col-lg-4">
								  <input class="form-control" id="despuesCeHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="despuesCeHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <div class="form-group">
								<div class="checkbox col-lg-1">
									<label>
										<input id="checkbox-ado" type="checkbox" name="optionsCheckboxes" class="checkbox-campos">
									</label>
							    </div>
								<label class="col-lg-3 control-label">Antes de dormir</label>
								<div class="col-lg-4">
								  <input class="form-control" id="antesDorHiper" placeholder="Hiperglucemias" disabled>
								</div>
								<div class="col-lg-4">
								  <input class="form-control" id="antesDorHipo" placeholder="Hipoglucemias" disabled>
								</div>
							  </div>
							  
							  <br><br>
							  <div class="checkbox">
								<label>
									<input id="checkbox-fondo" type="checkbox" name="optionsCheckboxes">
									Último fondo de ojos hace más de un año
								</label>
							  </div>
							 
							  <div class="form-group">
								<label for="imc" class="col-lg-4 control-label">Ultimo valor de IMC</label>
								<div class="col-lg-4">
								  <input type="number" min="1" step="0.1" class="form-control" id="imc">
								</div>
							  </div>
							  
							  <br>
						</div>
						</div>
					

							<div class="panel panel-default">
								<div class="panel-heading"><h4>Solución</h4></div>
								<div class="panel-body">
									<div class="form-group">
										<div class="col-lg-10">
											<input class="form-control " id="nueva-solucion" placeholder="Nueva solución">
										</div>
										<div class="col-lg-2">
											<button type="button" id="btn-anadir-sol" class="btn btn-success btn-fab btn-fab-mini btn-round btn-xs"><i class="material-icons">add_circle</i></button>
										</div>
										<br><br><br><br>
										<select name="soluciones" id="soluciones" size="5">
										</select>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-4 col-md-offset-4">
									<button class="btn btn-success btn-round btn-fab btn-fab-mini" id="anadir-documento" disabled><i class="material-icons" >attach_file</i></button>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 col-md-offset-4">
									<button class="btn btn-success btn-round btn-lg" id="guardar-reco" disabled>GUARDAR</button>
								</div>
							</div>
					
							 <br><br>
							 
						</form>
					</div>
					
					
					
					
					<div id="colum-reco-index" class="ui-widget-content ui-state-default">
						<h4 class="ui-widget-header"> Recomendaciones</h4>
						<div class="contenedor-tarjetas">
							<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
							  
							 </ul>
						</div>
					</div>
					
					<br><br><br><br><br><br>
					
			</div>
			<br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		
		
	</div>
	<%@include file="footer.jsp" %>
</div>

<div id="contenedor-recomendaciones">
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
	
  <script>
  $(document).ready(function() {
   
   //Recorre el JSON devuelto por la petición y carga la lista de recomendaciones sin enviar
	 function rellenaListaRecomendaciones(data) {
		 $.each(data, function(index, recomendacion) {
			 
			 $("#colum-reco-index .contenedor-tarjetas ul").append("<li class='ui-widget-content ui-corner-tr'>" +
					 "<button type='button' class='btn btn-success btn-sm boton-modal' data-toggle='modal' data-target=#modal"+recomendacion[3].id.idRec+">" +
				"<input type='hidden' id="+recomendacion[3].id.idRec+","+recomendacion[1].idSol+","+recomendacion[3].idPac+","+recomendacion[0].idDes+","+recomendacion[2].idActi+ ">" +
					"Ver recomendación" +
				"</button>" +
				"<br><br>" +
				"<div class='descripcion-mini'>" +
					"<p class='titulo-explicacion'>Explicación</p>" +
					"<p>"+recomendacion[1].texto.substr(0,10)+"....</p>" +
				"</div>" +
				"<div class='actividad-mini'>" +
					"<p class='titulo-actividad'>Actividad</p>" +
					"<div class='activity-feed'>" +
					  "<div class='feed-item'>" +
						"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
						"<div class='text'>"+recomendacion[2].accion.substr(0,10)+"....</div>" +
					  "</div>" +
					"</div>" +
				"</div>" +
			  "</li>");

			  if(recomendacion[4].surname2 != null){
				  $("#contenedor-recomendaciones").append(
						  "<div class='modal fade' id=modal"+recomendacion[3].id.idRec+" role='dialog'>" +
						   "<div class='modal-dialog'>" +
						     "<div class='modal-content'>" +
						       "<div class='modal-header'>" +
						         "<button type='button' class='close' data-dismiss='modal'>&times;</button>" +
						         "<h4 class='modal-title'>Recomendación</h4>" +
						       "</div>" +
						       "<div class='modal-body'>" +
									"<br>" +
									"<br>" +
									"<div class='row'>" +
										"<div class='col-md-8'>" +
											"<h4 class='titulo-paciente'>Paciente</h4>" +
											"<p>"+recomendacion[4].name+ " " +recomendacion[4].surname1+ " " +recomendacion[4].surname2+"</p>" +
										"</div>" +
									"</div>" +
									"<div class='row'>" +
										"<div class='col-md-8'>" +
											"<h4 class='titulo-explicacion'>Explicación</h4>" +
											"<p>"+recomendacion[1].texto+"</p>" +
										"</div>" +
									"</div>" +
									"<br>" +
									"<h4 class='titulo-actividad'>Actividad</h4>" +
									"<div class='activity-feed'>" +
									  "<div class='feed-item'>" +
										"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
										"<div class='text'>"+recomendacion[2].accion +"</div>" +
									  "</div>" +
									"</div>" +
						       "</div>" +
						       "<div class='modal-footer'>" +
							       "<form class='form-enviorecomendacion' method='post' action='enviaRecomendacionIndex'>"+
							       		"<input type='hidden' name='infoRecomendacion' value="+recomendacion[3].id.idRec+","+recomendacion[1].idSol+","+recomendacion[3].idPac+","+recomendacion[0].idDes+","+recomendacion[2].idActi+ ">" +
							         	"<button type='submit' class='btn btn-success boton-enviar-index'>Enviar</button>" +
						         	"</form>"+
						       "</div>" +
						     "</div>" + 
						   "</div>" +
						 "</div>"
						  );

			   }
			   else{
				   $("#contenedor-recomendaciones").append(
							  "<div class='modal fade' id=modal"+recomendacion[3].id.idRec+" role='dialog'>" +
							   "<div class='modal-dialog'>" +
							     "<div class='modal-content'>" +
							       "<div class='modal-header'>" +
							         "<button type='button' class='close' data-dismiss='modal'>&times;</button>" +
							         "<h4 class='modal-title'>Recomendación</h4>" +
							       "</div>" +
							       "<div class='modal-body'>" +
										"<br>" +
										"<br>" +
										"<div class='row'>" +
											"<div class='col-md-8'>" +
												"<h4 class='titulo-paciente'>Paciente</h4>" +
												"<p>"+recomendacion[4].name+ " " +recomendacion[4].surname1+"</p>" +
											"</div>" +
										"</div>" +
										"<div class='row'>" +
											"<div class='col-md-8'>" +
												"<h4 class='titulo-explicacion'>Explicación</h4>" +
												"<p>"+recomendacion[1].texto+"</p>" +
											"</div>" +
										"</div>" +
										"<br>" +
										"<h4 class='titulo-actividad'>Actividad</h4>" +
										"<div class='activity-feed'>" +
										  "<div class='feed-item'>" +
											"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
											"<div class='text'>"+recomendacion[2].accion +"</div>" +
										  "</div>" +
										"</div>" +
							       "</div>" +
							       "<div class='modal-footer'>" +
							       "<form class='form-enviorecomendacion' method='post' action='enviaRecomendacionIndex'>"+
							       		"<input type='hidden' name='infoRecomendacion' value="+recomendacion[3].id.idRec+","+recomendacion[1].idSol+","+recomendacion[3].idPac+","+recomendacion[0].idDes+","+recomendacion[2].idActi+ ">" +
							         	"<button type='submit' class='btn btn-success boton-enviar-index'>Enviar</button>" +
						         	"</form>"+
							       "</div>" +
							     "</div>" + 
							   "</div>" +
							 "</div>"
							  );
					  }
			  

	  		});
	  		
		 var $anchoColum = $(".contenedor-tarjetas").width() - 14;
		 $(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");

	};


	$.post("cargaRecomendadorIndex",function(responseJson){

		 rellenaListaRecomendaciones(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });
   
   
   function rellenaListaSoluciones(data) {
		 
		 $.each(data, function(index, solucion) {
			 
				 $("#soluciones").append("<option value=" + solucion.idSol +">" + solucion.texto + "</option>");
			 
			 
	  		});
		  
	};

	$("#guardar-reco").prop("disabled", true);
    $('select').change(function () {
        $("#guardar-reco").prop("disabled", false );
    });
    //Ajuste inicial de las tarjetas
	window.onload = function() {
		var $anchoInicial = $(".contenedor-tarjetas").width() - 14;
		$(".ui-widget-content.ui-corner-tr").css("width", $anchoInicial+"px");
		
	}
	
    
	
	
	
	
	/////Redimensionar tarjetas cuando la ventana cambia de tamaño////
	
	//Activar solo cuando la venta termine de moverse
	$(window).resize(function() {
	   if(this.resizeTO) clearTimeout(this.resizeTO);
	   this.resizeTO = setTimeout(function() {
		  $(this).trigger('resizeEnd');
	   }, 500);
	});
	
	//Realizar la acción
	$(window).bind("resizeEnd", function() {
	   // Acción
	   var $anchoColum = $(".contenedor-tarjetas").width() - 14;
	   $(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");
	});
	
	
	/////Cambiar eje de desplazamiento de tarjetas segun el tamaño de pantalla/////
	$(window).resize(function() {
	   if($(window).width() < 767){
			$( ".ui-widget-content.ui-corner-tr" ).draggable( "option", "axis", "y" );
			 var $anchoColum = $(".contenedor-tarjetas").width() - 14;
			 $("#formulario-recomendaciones").css("width", $anchoColum+"px");
	   }
	   else{
			$( ".ui-widget-content.ui-corner-tr" ).draggable( "option", "axis", "x" );
			$("#formulario-recomendaciones").css("width", "40%");
	   }
	   
	  
	});
	 
    /********************************************************/
    /***  Habilitar y desabilitar campos del formulario *****/
    /********************************************************/
    
    $('#checkbox-ade').change(function() {
        if(this.checked) {
        	$("#antesDHiper").prop("disabled", false );
        	$("#antesDHipo").prop("disabled", false );
        }
        else{
        	$("#antesDHiper").prop("disabled", true );
        	$("#antesDHipo").prop("disabled", true );
        }     
    });

    $('#checkbox-dd').change(function() {
        if(this.checked) {
        	$("#despuesDHiper").prop("disabled", false );
        	$("#despuesDHipo").prop("disabled", false );
        }
        else{
        	$("#despuesDHiper").prop("disabled", true );
        	$("#despuesDHipo").prop("disabled", true );
        }     
    });

    $('#checkbox-mm').change(function() {
        if(this.checked) {
        	$("#mediaMaHiper").prop("disabled", false );
        	$("#mediaMaHipo").prop("disabled", false );
        }
        else{
        	$("#mediaMaHiper").prop("disabled", true );
        	$("#mediaMaHipo").prop("disabled", true );
        }     
    });

    $('#checkbox-dco').change(function() {
        if(this.checked) {
        	$("#despuesCoHiper").prop("disabled", false );
        	$("#despuesCoHipo").prop("disabled", false );
        }
        else{
        	$("#despuesCoHiper").prop("disabled", true );
        	$("#despuesCoHipo").prop("disabled", true );
        }     
    });

    $('#checkbox-m').change(function() {
        if(this.checked) {
        	$("#meriendaHiper").prop("disabled", false );
        	$("#meriendaHipo").prop("disabled", false );
        }
        else{
        	$("#meriendaHiper").prop("disabled", true );
        	$("#meriendaHipo").prop("disabled", true );
        }     
    });

    $('#checkbox-dce').change(function() {
        if(this.checked) {
        	$("#despuesCeHiper").prop("disabled", false );
        	$("#despuesCeHipo").prop("disabled", false );
        }
        else{
        	$("#despuesCeHiper").prop("disabled", true );
        	$("#despuesCeHipo").prop("disabled", true );
        }     
    });

    $('#checkbox-ado').change(function() {
        if(this.checked) {
        	$("#antesDorHiper").prop("disabled", false );
        	$("#antesDorHipo").prop("disabled", false );
        }
        else{
        	$("#antesDorHiper").prop("disabled", true );
        	$("#antesDorHipo").prop("disabled", true );
        }     
    });
	
	$( "#guardar-reco" ).on( "click", function(event) {
	  event.preventDefault(); //Para que el boton no recargue la página
	  var $fondoOjos;

	  if($("#checkbox-fondo").is(':checked')){
		  $fondoOjos = true;
	  }
	  else{
		  $fondoOjos = false;
	  }
	  
	  var arrayMediciones = [$("#antesDHiper").val(),
		 					 $("#antesDHipo").val(),
	  						 $("#despuesDHiper").val(),
	  						 $("#despuesDHipo").val(),
	  						 $("#mediaMaHiper").val(),
	  						 $("#mediaMaHipo").val(),
	  						 $("#despuesCoHiper").val(),
	  						 $("#despuesCoHipo").val(),
	  						 $("#meriendaHiper").val(),
	  						 $("#meriendaHipo").val(),
	  						 $("#despuesCeHiper").val(),
	  						 $("#despuesCeHipo").val(),
	  						 $("#antesDorHiper").val(),
	  						 $("#antesDorHipo").val()
							];

	  arrayMediciones = JSON.stringify(arrayMediciones);
	  
	  var $imc = $("#imc").val();
	  var $idSol = $("#soluciones option:selected" ).val();
	  var $textoSolucion = $("#soluciones option:selected" ).text();
	  var $respuestaVacia = false;
	  $.get("añadeRecomendacionIndex",{array : arrayMediciones, imc : $imc, idSol : $idSol, fondoOjos : $fondoOjos},function(data){

		  if($.isEmptyObject(data)){
				$respuestaVacia = true;
		  }
		  
		  $.each(data, function(index, recomendacion) {
			 $("#colum-reco-index .contenedor-tarjetas ul").prepend("<li class='ui-widget-content ui-corner-tr'>" +
					 "<button type='button' class='btn btn-success btn-sm boton-modal' data-toggle='modal' data-target=#modal"+recomendacion[3].id.idRec+">" +
					"Ver recomendación" +
				"</button>" +
				"<br><br>" +
				"<div class='descripcion-mini'>" +
					"<p class='titulo-explicacion'>Explicación</p>" +
					"<p>"+recomendacion[1].texto.substr(0,10)+"....</p>" +
				"</div>" +
				"<div class='actividad-mini'>" +
					"<p class='titulo-actividad'>Actividad</p>" +
					"<div class='activity-feed'>" +
					  "<div class='feed-item'>" +
						"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
						"<div class='text'>"+recomendacion[2].accion.substr(0,10)+"....</div>" +
					  "</div>" +
					"</div>" +
				"</div>" +
			  "</li>");

			  if(recomendacion[4].surname2 != null){
				  $("#contenedor-recomendaciones").append(
						  "<div class='modal fade' id=modal"+recomendacion[3].id.idRec+" role='dialog'>" +
						   "<div class='modal-dialog'>" +
						     "<div class='modal-content'>" +
						       "<div class='modal-header'>" +
						         "<button type='button' class='close' data-dismiss='modal'>&times;</button>" +
						         "<h4 class='modal-title'>Recomendación</h4>" +
						       "</div>" +
						       "<div class='modal-body'>" +
									"<br>" +
									"<br>" +
									"<div class='row'>" +
										"<div class='col-md-8'>" +
											"<h4 class='titulo-paciente'>Paciente</h4>" +
											"<p>"+recomendacion[4].name+ " " +recomendacion[4].surname1+ " " +recomendacion[4].surname2+"</p>" +
										"</div>" +
									"</div>" +
									"<div class='row'>" +
										"<div class='col-md-8'>" +
											"<h4 class='titulo-explicacion'>Explicación</h4>" +
											"<p>"+recomendacion[1].texto+"</p>" +
										"</div>" +
									"</div>" +
									"<br>" +
									"<h4 class='titulo-actividad'>Actividad</h4>" +
									"<div class='activity-feed'>" +
									  "<div class='feed-item'>" +
										"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
										"<div class='text'>"+recomendacion[2].accion +"</div>" +
									  "</div>" +
									"</div>" +
						       "</div>" +
						       "<div class='modal-footer'>" +
						       	"<form class='form-enviorecomendacion' method='post' action='enviaRecomendacionIndex'>"+
						       		"<input type='hidden' name='infoRecomendacion' value="+recomendacion[3].id.idRec+","+recomendacion[1].idSol+","+recomendacion[3].idPac+","+recomendacion[0].idDes+","+recomendacion[2].idActi+ ">" +
						         	"<button type='submit' class='btn btn-success boton-enviar-index'>Enviar</button>" +
						         "</form>"+
						       "</div>" +
						     "</div>" + 
						   "</div>" +
						 "</div>"
						  );

			   }
			   else{
				   $("#contenedor-recomendaciones").append(
							  "<div class='modal fade' id=modal"+recomendacion[3].id.idRec+" role='dialog'>" +
							   "<div class='modal-dialog'>" +
							     "<div class='modal-content'>" +
							       "<div class='modal-header'>" +
							         "<button type='button' class='close' data-dismiss='modal'>&times;</button>" +
							         "<h4 class='modal-title'>Recomendación</h4>" +
							       "</div>" +
							       "<div class='modal-body'>" +
										"<br>" +
										"<br>" +
										"<div class='row'>" +
											"<div class='col-md-8'>" +
												"<h4 class='titulo-paciente'>Paciente</h4>" +
												"<p>"+recomendacion[4].name+ " " +recomendacion[4].surname1+"</p>" +
											"</div>" +
										"</div>" +
										"<div class='row'>" +
											"<div class='col-md-8'>" +
												"<h4 class='titulo-explicacion'>Explicación</h4>" +
												"<p>"+recomendacion[1].texto+"</p>" +
											"</div>" +
										"</div>" +
										"<br>" +
										"<h4 class='titulo-actividad'>Actividad</h4>" +
										"<div class='activity-feed'>" +
										  "<div class='feed-item'>" +
											"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
											"<div class='text'>"+recomendacion[2].accion +"</div>" +
										  "</div>" +
										"</div>" +
							       "</div>" +
							       "<div class='modal-footer'>" +
								       "<form class='form-enviorecomendacion' method='post' action='enviaRecomendacionIndex'>"+
								       		"<input type='hidden' name='infoRecomendacion' value="+recomendacion[3].id.idRec+","+recomendacion[1].idSol+","+recomendacion[3].idPac+","+recomendacion[0].idDes+","+recomendacion[2].idActi+ ">" +
								         	"<button type='submit' class='btn btn-success boton-enviar-index'>Enviar</button>" +
							         	"</form>"+
							       "</div>" +
							     "</div>" + 
							   "</div>" +
							 "</div>"
							  );
					  }

			  		
			  		var $anchoColum = $(".contenedor-tarjetas").width() - 14;
					$(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");
		 		 });
	 		 
				  $('html, body').animate( {scrollTop : 0}, 800 );
				  if($respuestaVacia){
					  $("#alerta-success").hide();
					  $("#alerta-warning").show();
				  }
				  else{
					  $("#alerta-warning").hide();
					  $("#alerta-success").show();
				  }
				
		  }).fail(function () {
		        (".alert").show();
		    });
	  	
    });

    
	$.get("cargaSoluciones",function(responseJson){

		 rellenaListaSoluciones(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });
    
	$("#btn-anadir-sol").on( "click", function(event) {
	  event.preventDefault(); //Para que el boton no recargue la página
	  var textoSolucion = $("#nueva-solucion").val();

	  $.get("añadeSolucion", {solucion: textoSolucion}, function(id){

		  $("#soluciones").append("<option value="+ id +">"+ textoSolucion +"</option>");

		  }
	  	);
	 
	  $("#nueva-solucion").val("");
    });
	
});

  </script>

</html>
