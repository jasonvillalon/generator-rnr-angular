require [
  "angular"
  "jquery"
  "jquery_ujs"
  "restangular"
  "angular-animate"
  "angular-ui-router"
  "bindonce"
  "ui-bootstrap-tpls"
  "lodash"
  "bootstrap"
], (angular) ->
  "use strict"

  window.ApplicationConfiguration =
    applicationModuleName : 'businesscard7'
    applicationModuleVendorDependencies : [
      "ui.router"
      "restangular"
      "ui.bootstrap"
      "ngAnimate"
      "pasvaz.bindonce"
    ]
    registerModule : (moduleName) ->
      angular.module(moduleName, [])
      angular.module(this.applicationModuleName).requires.push(moduleName)

  #App Module
  angular.element(document).ready ->

    #smart works go here
    $html = angular.element("html")

    window.App = angular;
    angular.module(
      window.ApplicationConfiguration.applicationModuleName, window.ApplicationConfiguration.applicationModuleVendorDependencies
    ).config ["$urlRouterProvider", "$provide", ($urlRouterProvider, $provide) ->
      $urlRouterProvider.otherwise "/"

      # change configure to use [[ to be the interpolation ([[2 + 2]])

      #$interpolateProvider.startSymbol('[[');
      #$interpolateProvider.endSymbol(']]');

      # add safeApply function for $rootScope - called by $scope.$root.safeApply(fn)
      $provide.decorator "$rootScope", ["$delegate", ($delegate) ->
        $delegate.safeApply = (fn) ->
          phase = $delegate.$$phase
          if phase is "$apply" or phase is "$digest"
            fn() if fn and typeof fn is "function"
          else
            $delegate.$apply fn
          return

        return $delegate
      ]
    ]

    angular.module(
      window.ApplicationConfiguration.applicationModuleName
    ).config ['$locationProvider', ($locationProvider) ->
      $locationProvider.hashPrefix "!"
    ]

    _.each window.RegisterModule, (module) ->
      window.ApplicationConfiguration.registerModule module
    _.each window.ApplicationModules, (module) ->
      module angular

    if window.location.hash is "#_=_"
      window.location.hash = '#!';

    #bootstrap model
    angular.bootstrap $html, [window.ApplicationConfiguration.applicationModuleName]