var app = angular.module('app', []);
app.controller('page', function($scope, $http) {

    $scope.submit =  function(){
          $http({
              method : "POST",
              dataType: "json",
              url : "/login",
              data: {"username": $scope.username, "password": $scope.password},
              headers:{
              "Content-Type": "application/json",
              }
          }).then(function mySuccess(response) {
                $scope.info = response.data;
                if(response.data.length == 0)
                {
                    window.location = "/test/home";
                }
          }, function myError(response) {
                $scope.info = response.statusText;
          });


  }
});
