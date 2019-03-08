var app = angular.module('app', []);
app.controller('page', function($scope, $http) {

        $scope.list = [];

        $scope.groups = [ {'id': '0', 'name': '.', 'strateji': true}];

        $scope.showPage = false;

        $scope.getList =  function(search){
          var groupId =$scope.groups[$scope.groups.length -1];
          $http({
              method : "GET",
              url : "/urunsorgula/getlist/" + groupId + "/" + search,
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

        $scope.grouplist = [];

        $scope.getGruplar = function(){
            $scope.grouplist.clear();
            $http({
                method : "GET",
                url : "/urunsorgula/gruplar/" + $scope.groups[$scope.groups.length -1]['id'],
            }).then(function mySuccess(response) {
                $scope.groups.push(response.data)
            }, function myError(response) {
                alert("Hata oluştu.");
            });
        };

        $scope.addGroup = function(group){
            $scope.groups.push(group);
        };

        $scope.swicth = function(groupId){
            for(var i = 0; i < $scope.groups.length; i++){
                D = $scope.groups.pop();
                if (D["id"] == groupId){
                    $scope.groups.push(D);
                    return;
                }
            }
        };

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
