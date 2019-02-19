var app = angular.module('app', []);
app.controller('menu', function($scope, $http) {

        $scope.logout =  function(){
          $http({
              method : "GET",
              url : "logout",
          }).then(function mySuccess(response) {
                window.location = "/";
            $scope.info = response.data;
          }, function myError(response) {
            $scope.info = response.statusText;
          });

  }
});
