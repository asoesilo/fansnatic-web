angular.module 'mitt.app', ['ui.router', 'ngResource']
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: './views/main.html'
        controller: 'mainController'
        controllerAs: 'mainCtrl'
      .state 'partial',
        url: '/partial'
        templateUrl: './views/partial.html'
