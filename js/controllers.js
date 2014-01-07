'use strict';

/* Controllers */

var phonecatApp = angular.module('coffrefortApp', []);

phonecatApp.controller('FacturesListCtrl', ['$scope', '$http', function($scope, $http) {

 $scope.directories = angularData;
  $scope.orderProp = 'timestamp';

}]);

