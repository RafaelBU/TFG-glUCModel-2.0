$(document).ready(function() {

//$(function() {

    // =======================================================================
    // ==   Funciones relacionadas con la tabla de enviar recomendaciones   ==
    // =======================================================================

    // 1. Funciones generales
    // -----------------------------------------------------------------------
    /*function recorreRecomendaciones(funcion) {

    }*/
    // 2. Mostrar/Ocultar el campo para el periodo de las rec. automáticas
    // -----------------------------------------------------------------------
	function redimension_btn(id) {
        
        var checkbox = "#recomendacion" +  id + " .checkbox-auto";
        checkbox.toString();

        $(checkbox).bind("click", function() {
            // Show / Hid textfield
            var tf_dias = $("#recomendacion" + id + " .tf-auto");
            tf_dias.toString();
            $(tf_dias).toggleClass("hidden");

            // Change Checkbox Width
            var div_checkbox = $("#recomendacion" + id + " .td-auto > div:first-child");
            $(div_checkbox).toggleClass("col-xs-12 col-xs-3");  
        });
    }

    // Una generalización del algoritmo:
    function add_actions() {
        var id, recomendaciones, total;
        
        // Seleccionamos la lista de recomendaciones (obtenemos cuantas hay)
        recomendaciones = $(".tabla-rec-enviar .tr-recomendacion");
        total = recomendaciones.size();
        console.log("Hay " + total + " recomendaciones");

        // Recorremos la lista
        for(i = 0; i < total; i++) {
            redimension_btn(i);
        }
    }
    add_actions();

    
    // 3.  Mostrar/Ocultar descripción de la recomendacion
    // -----------------------------------------------------------------------
    
    function toggleDescripcion(recID) {
        var titulo = $(recID + " .titulo-rec");
        var descripcion = $(recID + " .detalle-rec");

        $(titulo).bind("click", function () {
            console.log("Click titulo");
            $(descripcion).toggleClass("hidden");
        });
    }

    function addToggleDescripcion() {
        var recID = "recomendacion";
        var recomendaciones = $(".tr-recomendacion");
        var total = recomendaciones.size();

        for (var i = 0; i < total; i++) {
            recID = "#recomendacion" + i;
            recID.toString();
            toggleDescripcion(recID);
        }
    }
    addToggleDescripcion();

    // 4.  Botones de enviar/eliminar una recomendacion de la lista
    // -----------------------------------------------------------------------
    function addComportamientoBoton() {
        var recID = "recomendacion";
        var recomendaciones = $(".tr-recomendacion");
        var total = recomendaciones.size();

        for (var i = 0; i < total; i++) {
            recID = "#recomendacion" + i;
            recID.toString();

            // Añadir comportamiento al boton de enviar
            var btnSend = $(recID + " .btn-send-rec");
            $(btnSend).bind("click", function(evt) {
                evt.preventDefault(); // Para que de momento no se envía el form.
                // 1. Añadir a la BD
                // ...
                // 2. Eliminar el HTML
                var tr_rec = this.parentNode.parentNode.parentNode;
                $(tr_rec).remove();
                total--;
            });

            // Añadir comportamiento al boton de elminar
            var btnDel = $(recID + " .btn-del-rec");
            $(btnDel).bind("click", function() {
                // 1. Eliminar de la BD
                // ...
                // 2. Eliminar el HTML
                var tr_rec = this.parentNode.parentNode.parentNode;
                $(tr_rec).remove();
                total--;
            });
        }
    }
    addComportamientoBoton();

    // =======================================================================
    // ==       Funciones de la tabla de recomendaciones automatizadas      ==
    // =======================================================================


    // =======================================================================
    // ==       Funciones de la tabla del histórico de recomendaciones      ==
    // =======================================================================


    // =======================================================================
    // ==       Funciones de la tabla de crear nueva recomendación          ==
    // =======================================================================
    function addRecText(rec_number, rec_title, rec_text) {
        //console.log("recTemplate("+rec_number+", "+rec_title+", "+rec_text+")");
        var lugar = $(".tabla-rec-enviar tr:last");
        $(lugar).after('<tr class="tr-recomendacion" id="recomendacion' + rec_number + '"><form> <td class="td-tipo"> Sugerida </td> <td class="td-recomendacion"> <div data-toggle="collapse" class="titulo-rec">' + rec_title + '</div> <div class="collapse in detalle-rec hidden">' +  rec_text +'</div> </td> <td class="td-prioridad"> <div class="form-group"> <select class="form-control" id="sel_priodidad"> <option>Urgente</option> <option>Importante</option> <option>Normal</option> </select> </div> </td> <td class="td-auto"> <div class="col-xs-12"> <input type="radio" name="automatizar" value="male" class="checkbox-auto"> </div> <div class="col-xs-9 tf-auto hidden"> Periodo: <input type="text" name="firstname" size="3" placeholder="nº días"> </div> </td> <td class="td-acciones"> <div class="col-md-6 col-xs-12"> <button type="button" class="btn btn-danger btn-sm btn-del-rec"> <span class="glyphicon glyphicon-trash align-both"></span> </button> </div> <div class="col-md-6 col-xs-12"> <button type="submit" class="btn btn-success btn-sm btn-send-rec"> Enviar </button> </div> </td> </form> </tr>');
    }
    
    function createNewRec(title, description, cause) {
        
        // 1. Obtener nº rec. actuales
        var recomendaciones = $(".tr-recomendacion");
        var num_recs = recomendaciones.size();

        // 2. Añadir texto a la página
        addRecText(num_recs, title, description);

        // 3. Actualizar BD de recomendaciones
        // ...
    }

    function initSubmitBtn() {
        //console.log($("#form-new-rec").toString());
        $("#form-new-rec").bind("submit", function(evt) {
            console.log("enviado");

            // get all the inputs into an array.
            var $inputs = $('#form-new-rec :input');

            // get an associative array of just the values.
            var values = {};
            $inputs.each(function() {
                values[this.name] = $(this).val();
            });
            
            console.log(values);
            createNewRec(values["titulo_rec"], values["descripcion_rec"], null);
            evt.preventDefault();    
        });
    }
    initSubmitBtn();
}); 