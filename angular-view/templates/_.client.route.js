ApplicationModules.push (angular) ->
	$stateProvider.
			state '<%= slugifiedName %>', 
				url: '/<%= slugifiedRoutePath %>',
				templateUrl: 'modules/<%= slugifiedModuleName %>/views/<%= slugifiedName %>.client.view.html'