var app = angular.module('app', []);
app.controller('page', function($scope, $http) {

        $scope.list = [];

        $scope.showPage = false;

        $scope.getList =  function(search){
          $http({
              method : "GET",
              url : "/urunsorgula/getlist/" + search,
          }).then(function mySuccess(response) {
                $scope.list = response.data;
          }, function myError(response) {
                $scope.list = ["Hata oluştu"];
          });
        }

        $scope.getList("");

        $scope.select=function(item){
            $scope.search = item;
        }

        $scope.groups = [
            {'id': '1', 'name': '', 'strateji': true},
            {'id': '2', 'name': 'Arabalar', 'strateji': false},
            {'id': '3', 'name': 'Tekerlekler', 'strateji': true},
            {'id': '4', 'name': 'Arka Tekerlek', 'strateji': false},
        ];

        $scope.submit = function(){
            $http({
                method : "GET",
                url : "/urunsorgula/sorgula/" + $scope.search,
            }).then(function mySuccess(response) {
                $scope.showPage = true;
                //window.location = "/test/urunsorgula2";
            }, function myError(response) {
                alert("Hata oluştu.");
            });
        };
});
