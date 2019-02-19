var app = angular.module('app', []);
app.controller('login', function($scope, $http) {

    $scope.submit =  function(){
          $http({
              method : "POST",
              dataType: "json",
              url : "login",
              data: {"username": $scope.username, "pass": $scope.pass},
              headers:{
              "Content-Type": "application/json",
              }
          }).then(function mySuccess(response) {
                window.location = "/menu";
            $scope.info = response.data;
          }, function myError(response) {
            $scope.info = response.statusText;
          });


  }
});
