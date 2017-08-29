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
				
				<br><br>
				<!-- ALERTA DE CONFIRMACION -->
				<div class="alert alert-success" style="display:none;">
					<div class="container-fluid">
					  <div class="alert-icon">
						<i class="material-icons">check</i>
					  </div>
					  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					  </button>
					  <b><h5>Recomendación añadida con éxito</h5></b> 
					</div>
				</div>
				<!---------------------------------->
				
				<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%
								String nombrePaciente = (String)sesion.getAttribute("nombre-paciente");
								String apellido1Paciente = (String)sesion.getAttribute("apellido1-paciente");
								
								if(sesion.getAttribute("apellido2-paciente") != null){
									String apellido2Paciente = (String)sesion.getAttribute("apellido2-paciente");
									out.println("<h3>Recomendador " + nombrePaciente + " " + apellido1Paciente + " " + apellido2Paciente + "</h3>");
								}
								else{
									out.println("<h3>Recomendador " + nombrePaciente + " " + apellido1Paciente + "</h3>");
								}
							%>
						</div>
				</div>
				
				<br><br>
					
					<div id="colum-reco-auto-paciente" class="ui-widget-content ui-state-default">
						<h4 class="ui-widget-header"> Recomendaciones Sugeridas</h4>
						<div class="contenedor-tarjetas">
							<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
							</ul>
						</div>
					</div>
					
					<div id="colum-reco-manual" class="ui-widget-content ui-state-default">
						<h4 class="ui-widget-header"> Recomendaciones Manuales</h4>
						<div class="contenedor-tarjetas">
							<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
							</ul>
						</div>
						  
						 <br>
						 <button type="button" class="add-reco btn btn-success btn-fab btn-fab-mini btn-round boton-modal" data-toggle="modal" data-target="#modal-reco-manual"><i class="material-icons">add_circle</i></button>
					</div>
					
					
					<div id="colum-reco-historial-paciente" class="ui-widget-content ui-state-default">
						<h4 class="ui-widget-header">Enviadas</h4>
						<div class="contenedor-tarjetas">
							<ul id="gallery" class="gallery ui-helper-reset ui-helper-clearfix">
							</ul>
						</div>
					</div>
					
					<br><br><br><br><br><br><br><br><br><br><br><br><br>
			
			</div>
			<br><br><br><br>
		</div>
		
		
	</div>
	
	<%@include file="footer.jsp" %>
</div>

<!-- Modal -->

<div id="contenedor-recomendaciones">
	 
</div>

<div class="modal fade" id="modal-reco-manual" role="dialog">
   <div class="modal-dialog">
   
     <!-- Modal content-->
     <div class="modal-content">
       <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal">&times;</button>
         <h4 class="modal-title">Recomendación Manual</h4>
       </div>
       
       <div class="modal-body">
    	<form role="form">
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
			
			<br><br><br><br><br><br>

		</form>
	
       </div>
      
       <div class="modal-footer">
       	 <button type="button" class="add-reco btn btn-primary" id="modal-add-reco" disabled>Añadir</button>
       </div>
     </div>
     
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
	
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	
  <script>
  $( function() {
		
  //Recorre el JSON devuelto por la petición POST y carga la lista de recomendaciones manuales
	 function rellenaListaRecomendaciones(data) {
		 $.each(data, function(index, recomendacion) {
			 
			 $("#colum-reco-manual .contenedor-tarjetas ul").append("<li class='ui-widget-content ui-corner-tr'>" +
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
					         "<button type='button' class='btn btn-success boton-cerrar' data-dismiss='modal'>Cerrar</button>" +
					       "</div>" +
					     "</div>" + 
					   "</div>" +
					 "</div>"
					  );

	  		});
	  		
		 var $anchoColum = $(".contenedor-tarjetas").width() - 14;
		 $(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");
		 $( "#colum-reco-manual li").draggable({
			  axis: "x",
			  cancel: "a.ui-icon", // clicking an icon won't initiate dragging
			  revert: "invalid", // when not dropped, the item will revert back to its initial position
			  containment: "document",
			  helper: "clone",
			  cursor: "move"
		  });

	};


	//Recorre el JSON devuelto por la petición POST y carga la lista de recomendaciones automáticas
	function rellenaListaRecomendacionesAuto(data) {
		 $.each(data, function(index, recomendacion) {
			 
			 $("#colum-reco-auto-paciente .contenedor-tarjetas ul").append("<li class='ui-widget-content ui-corner-tr'>" +
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
					         "<button type='button' class='btn btn-success boton-cerrar' data-dismiss='modal'>Cerrar</button>" +
					       "</div>" +
					     "</div>" + 
					   "</div>" +
					 "</div>"
					  );

			  		});

	  		
				 var $anchoColum = $(".contenedor-tarjetas").width() - 14;
				 $(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");
				 $( "#colum-reco-auto-paciente li").draggable({
					  axis: "x",
					  cancel: "a.ui-icon", // clicking an icon won't initiate dragging
					  revert: "invalid", // when not dropped, the item will revert back to its initial position
					  containment: "document",
					  helper: "clone",
					  cursor: "move"
				  });
	};

	//Recorre el JSON devuelto por la petición POST y carga la lista de recomendaciones que ya han sido enviadas
	function rellenaListaRecomendacionesEnviadas(data) {
		 $.each(data, function(index, recomendacion) {
			 
			 $("#colum-reco-historial-paciente .contenedor-tarjetas ul").append("<li class='ui-widget-content ui-corner-tr'>" +
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
										"<h4 class='titulo-explicacion'>Explicación</h4>" +
										"<p>"+recomendacion[1].texto+"</p>" +
									"</div>" +
								"</div>" +
								"<br>" +
								"<h4 class='titulo-actividad'>Actividad</h4>" +
								"<hr>" +
								"<div class='activity-feed'>" +
								  "<div class='feed-item'>" +
									"<div class='date'>"+recomendacion[2].fechaActividad +"</div>" +
									"<div class='text'>"+recomendacion[2].accion +"</div>" +
								  "</div>" +
								"</div>" +
					       "</div>" +
					       "<div class='modal-footer'>" +
					         "<button type='button' class='btn btn-default boton-cerrar' data-dismiss='modal'>Cerrar</button>" +
					       "</div>" +
					     "</div>" + 
					   "</div>" +
					 "</div>"
					  );

			  		});
				 var $anchoColum = $(".contenedor-tarjetas").width() - 14;
				 $(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");
	};

	function rellenaListaSoluciones(data) {

		 $("#soluciones").append("<option selected disabled hidden>Elija una solución</option>");
		 $.each(data, function(index, solucion) {
			 
				 $("#soluciones").append("<option value=" + solucion.idSol +">" + solucion.texto + "</option>");
			 
			 
	  		});
		  
	};

	$.post("recomendadorAutomatico",function(responseJson){

		 rellenaListaRecomendacionesAuto(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });

    
    $.post("cargaRecomendador",function(responseJson){

		 rellenaListaRecomendaciones(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });

    
    $.post("cargaListaEnviadas",function(responseJson){

		 rellenaListaRecomendacionesEnviadas(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });

    $.get("cargaSoluciones",function(responseJson){

		 rellenaListaSoluciones(responseJson);
			
	  }).fail(function () {
	        (".alert").show();
	    });

    $("#modal-add-reco").prop("disabled", true);
    $('select').change(function () {
        $("#modal-add-reco").prop("disabled", false );
    });
   
	//Ajuste inicial de las tarjetas
	window.onload = function() {
		var $anchoInicial = $(".contenedor-tarjetas").width() - 14;
		$(".ui-widget-content.ui-corner-tr").css("width", $anchoInicial+"px");
	}
	
	var $gallery = $( ".gallery" ),
      $columauto = $( "#colum-reco-auto-paciente" ),
	  $colummanual = $("#colum-reco-manual"),
	  $columhistorial = $("#colum-reco-historial-paciente");
 
	$( "#colum-reco-auto-paciente li").draggable({
	  axis: "x",
      cancel: "a.ui-icon", // clicking an icon won't initiate dragging
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
	
	$( "#colum-reco-manual li").draggable({
	  axis: "x",
      cancel: "a.ui-icon", // clicking an icon won't initiate dragging
      revert: "invalid", // when not dropped, the item will revert back to its initial position
      containment: "document",
      helper: "clone",
      cursor: "move"
    });
	
 
	$columhistorial.droppable({
	  accept : ".contenedor-tarjetas  ul li",
      classes: {
        "ui-droppable-active": "ui-state-highlight"
      },
      drop: function( event, ui ) {
		enviaRecomendacion(ui.draggable.find("input").attr("id"));
        deleteImage2( ui.draggable );
        
      }
    });
 
    // Image deletion function
    function deleteImage1( $item ) {
      $item.fadeOut(function() {
        var $list = $( "ul", $columauto ).length ?
          $( "ul", $columauto ) :
          $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $columauto );
 
        $item.appendTo( $list ).fadeIn(function() {
          $item
            .animate({ width: "84%" }); //420px
        });
      });
    }
	
	function deleteImage2( $item ) {
      $item.fadeOut(function() {
        var $list = $( "ul", $columhistorial ).length ?
          $( "ul", $columhistorial ) :
          $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $columhistorial );
		  
		
		var $anchoColum = $(".contenedor-tarjetas").width() - 14;
		($list).prepend($item);
		$($item).draggable( "option", "disabled", true );
		($item).fadeIn(function(){
          $item
            .animate({ width: $anchoColum+"px" });
        });
      });
    }

    function enviaRecomendacion(info){
    	$.post("enviaRecomendacion",{infoRecomendacion : info});
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
	   }
	   else{
			$( ".ui-widget-content.ui-corner-tr" ).draggable( "option", "axis", "x" );
	   }
	   
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

	 
	//Añadir la nueva tarjeta creada y cerrar el formulario 
	 $("#modal-add-reco").on( "click", function() {
	  var $anchoColum = $(".contenedor-tarjetas").width() - 14;
	  var $idSol = $( "#soluciones option:selected" ).val();
	  var $texto = $( "#soluciones option:selected" ).text();
	  
	  $.post("añadeRecomendacionManual", {idSol : $idSol }, function(recomendacion){
		  $("#colum-reco-manual .contenedor-tarjetas ul").prepend(
					"<li class='ui-widget-content ui-corner-tr'>" +
					 "<button type='button' class='btn btn-success btn-sm boton-modal' data-toggle='modal' data-target=#modal"+recomendacion[0].id.idRec+">" +
						"<input type='hidden' id="+recomendacion[0].id.idRec+","+recomendacion[2].idSol+","+recomendacion[0].idPac+","+recomendacion[0].idDes+","+recomendacion[0].idActi+ ">" +
							"Ver recomendación" +
						"</button>" +
						"<br><br>" +
						"<div class='descripcion-mini'>" +
							"<p class='titulo-explicacion'>Explicación</p>" +
							"<p>"+recomendacion[2].texto.substr(0,10)+"....</p>" +
						"</div>" +
						"<div class='actividad-mini'>" +
							"<p class='titulo-actividad'>Actividad</p>" +
							"<div class='activity-feed'>" +
							  "<div class='feed-item'>" +
								"<div class='date'>"+recomendacion[1].fechaActividad +"</div>" +
								"<div class='text'>"+recomendacion[1].accion.substr(0,10)+"....</div>" +
							  "</div>" +
							"</div>" +
						"</div>" +
					  "</li>"

					);

			 $("#contenedor-recomendaciones").append(
					  "<div class='modal fade' id=modal"+recomendacion[0].id.idRec+" role='dialog'>" +
					   "<div class='modal-dialog'>" +
					     "<div class='modal-content'>" +
					       "<div class='modal-header'>" +
					         "<h4 class='modal-title'>Recomendación</h4>" +
					       "</div>" +
					       "<div class='modal-body'>" +
								"<br>" +
								"<br>" +
								"<div class='row'>" +
									"<div class='col-md-8'>" +
									"<h4 class='titulo-explicacion'>Explicación</h4>" +
										"<p>"+recomendacion[2].texto+"</p>" +
									"</div>" +
								"</div>" +
								"<br>" +
								"<h4 class='titulo-actividad'>Actividad</h4>" +
								"<div class='activity-feed'>" +
								  "<div class='feed-item'>" +
									"<div class='date'>"+recomendacion[1].fechaActividad +"</div>" +
									"<div class='text'>"+recomendacion[1].accion +"</div>" +
								  "</div>" +
								"</div>" +
					       "</div>" +
					       "<div class='modal-footer'>" +
					         "<button type='button' class='btn btn-success boton-cerrar' data-dismiss='modal'>Cerrar</button>" +
					       "</div>" +
					     "</div>" + 
					   "</div>" +
					 "</div>"
					  );
		
			 var $anchoColum = $(".contenedor-tarjetas").width() - 14;
			 $(".ui-widget-content.ui-corner-tr").css("width", $anchoColum+"px");
			 $( "#colum-reco-manual li").draggable({
				  axis: "x",
				  cancel: "a.ui-icon", // clicking an icon won't initiate dragging
				  revert: "invalid", // when not dropped, the item will revert back to its initial position
				  containment: "document",
				  helper: "clone",
				  cursor: "move"
			  });
		  }).fail(function () {
		        (".alert").show();
		    });
	  
      $("#modal-reco-manual .close").click()
		  $(".alert").show();
	    });
	
  } );
  
  </script>

</html>
