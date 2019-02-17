var app = angular.module('app', []);
app.controller('login', function($scope, $http) {

    $scope.submit =  function(){
          $http({
            method : "POST",
              url : "login",
              data: {"username": $scope.username, "pass": $scope.pass}
          }).then(function mySuccess(response) {
                //window.location = "/menu";
            $scope.info = response.data;
          }, function myError(response) {
            $scope.info = response.statusText;
          });
  }
});
