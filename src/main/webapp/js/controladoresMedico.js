'use strict';

/* Controlador para el médico */

var appMedico = angular.module('appMedico', []);

appMedico.controller('ControladorMedico', ['$scope', '$http', function($scope, $http) {
	
	/* Recuperación de la lista de pacientes */
	$http.get('json_examples/lista_pacientes.json').success(function(data) {
		$scope.pacientes = data;
	});
	
	/* Recuperación de la lista de recomendaciones sugeridas */
	$http.get('json_examples/lista_recs_sugeridas.json').success(function(data) {
		$scope.lista_recs = data;
	});

	$scope.ordenRecs = 'date';
	
	/* Recuperación de la ficha básica de un paciente */
	$http.get('json_examples/info_ficha_paciente.json').success(function(data) {
		$scope.ficha_pac = data;
	});
  
}]);