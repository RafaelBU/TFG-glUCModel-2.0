$(function() {
    

    function redimension_btn(id) {
        
        var arg = "#paciente" +  id + " .td-recomendacion div:first-child";
        arg.toString();

        $(arg).bind("click", function() {
            console.log("clickbtn");
            var aux = $("#paciente" + id + " .td-acciones > div");
            aux.toString();
            aux.toggleClass("col-xs-6");
            aux.toggleClass("col-xs-3");
            //
            var db2 = $(aux).find(".btn-success").toggleClass("float-right");
            console.log("Seleccion 1:");
            console.log(db2);
            db2 = $(aux).find(".btn-danger").toggleClass("float-left");
            console.log("Seleccion 2:");
            console.log(db2);
        });
    }
    
    // Una generalización del algoritmo:
    function add_actions() {
        var id, pacientes, total;
        
        pacientes = $(".tabla-pacientes .tr-paciente");
        total = pacientes.size();

        console.log("Hay " + total + " pacientes: ");

        for(i = 0; i < total; i++) {
            redimension_btn(i);
        }
    }
    add_actions();

    /* Ordenación de pacientes por fecha */
    /*function sortByDate() {

        function parseDate(input) {
          var parts = input.match(/(\d+)/g);
          // new Date(year, month [, date [, hours[, minutes[, seconds[, ms]]]]])
          return new Date(parts[0], parts[1]-1, parts[2], parts[3], parts[4], parts[5]); //     months are 0-based
        }

        var elems = $.makeArray($(".td-fecha > div")); //!!!
        elems.sort(function(a, b) {
            console.log( parseDate( $(a).text() ) );
            return parseDate( $(a).text() ) < parseDate( $(b).text() );
        });
        var axu2 = $("#tabla-pacientes");
        axu2.html(elems);
    }

	/* Incialización de los botones de ordenacion */
    /*var sort = $(".selectpicker").selectpicker();
    sort.onChange(function() {
        console.log("Ha cambiado");
    })*/

    /**/

}); 