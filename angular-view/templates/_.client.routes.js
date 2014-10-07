ApplicationModules.push (angular) ->
	#Setting up route
	angular.module('<%= slugifiedModuleName %>').config ['$stateProvider',
		($stateProvider) ->
			# <%= humanizedModuleName %> state routing
			$stateProvider.
			state '<%= slugifiedName %>', 
				url: '/<%= slugifiedRoutePath %>',
				templateUrl: 'modules/<%= slugifiedModuleName %>/views/<%= slugifiedName %>.client.view.html'
	]