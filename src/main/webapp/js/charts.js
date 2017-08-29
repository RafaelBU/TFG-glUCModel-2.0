function grafica_peso() {

	var opciones = {
		title: {
            text: 'Peso',
            x: -20 //center
        },
        subtitle: {
            text: 'A lo largo del tiempo',
            x: -20 //center
        },
        xAxis: {
        	title: {
                text: 'Fecha'
            },
            type: 'datetime'
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
            data: [{}]
        }]
	};
	
	var url_file = "json_examples/pesos_paciente.json";
	var url_server = "http://localhost:8080/glucmodel/api/doctor/peso/123";
	$.getJSON(url_server, function(data) {

		var datos = data;
		
		// Los proceso:
		for (var i in datos) {
			datos[i][0] = Date.parse(datos[i][0]);
		}
		
        opciones.series[0].data = datos;
        $('#grafica-peso').highcharts(opciones);
    });
	
}

function grafica_glucemias() {

	var opciones = {
		title: {
            text: 'Glucemias',
            x: -20 //center
        },
        subtitle: {
            text: 'A lo largo del tiempo',
            x: -20 //center
        },
        xAxis: {
        	title: {
                text: 'Fecha'
            },
            type: 'datetime'
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
            data: [{}]
        }]
	};
	
	var url_file = "json_examples/glucemias_paciente.json";
	var url_server = "http://localhost:8080/glucmodel/api/doctor/glucemias/123";
	
	$.getJSON(url_server, function(data) {

		var datos = data;
		
		// Los proceso:
		for (var i in datos) {
			datos[i][0] = Date.parse(datos[i][0]);
		}
		
        opciones.series[0].data = datos;
        $('#grafica-glucemias').highcharts(opciones);
    });
	
}

function grafica_insulina() {

	var opciones = {
		title: {
            text: 'Insulina',
            x: -20 //center
        },
        subtitle: {
            text: 'A lo largo del tiempo',
            x: -20 //center
        },
        xAxis: {
        	title: {
                text: 'Fecha'
            },
            type: 'datetime'
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
            data: [{}]
        }]
	};
	
	var url_file = "json_examples/insulinas_paciente.json";
	var url_server = "http://localhost:8080/glucmodel/api/doctor/insulina/123";
	
	$.getJSON(url_server, function(data) {

		var datos = data;
		
		// Los proceso:
		for (var i in datos) {
			datos[i][0] = Date.parse(datos[i][0]);
		}
		
        opciones.series[0].data = datos;
        $('#grafica-insulina').highcharts(opciones);
    });
	
}

function grafica_ejercicio() {
    $('#grafica-ejercicio').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Stacked column chart'
        },
        xAxis: {
            categories: ['L', 'M', 'X', 'J', 'V', 'S', 'D']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Ponderación'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.x + '</b><br/>' +
                    this.series.name + ': ' + this.y + '<br/>' +
                    'Total: ' + this.point.stackTotal;
            }
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                }
            }
        },
        series: [{
            name: 'Intensidad',
            data: [5, 3, 4, 7, 2, 4, 5]
        }, {
            name: 'Duración',
            data: [20, 20, 30, 20, 10, 40, 50]
        }]
    });
}