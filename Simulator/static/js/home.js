var app = angular.module('app', []);
app.controller('page', function($scope, $http) {

        $scope.rate=function(){
            $http({
              method : "GET",
              url : "/rate",
            }).then(function mySuccess(response) {
                graph(response.data.rate);
            }, function myError(response) {
                graph(0);
            });
        }
        $scope.rate();

        $scope.logout =  function(){
          $http({
              method : "GET",
              url : "/logout",
          }).then(function mySuccess(response) {
                window.location = "/test/login";
            $scope.info = response.data;
          }, function myError(response) {
            $scope.info = response.statusText;
          });
        }

        $scope.view = "Hesaplanıyor. Bu işlem biraz sürebilir...";
        $scope.hesapla =  function(){
          $scope.view = "Hesaplanıyor. Bu işlem biraz sürebilir...";
          $http({
              method : "GET",
              url : "/hesapla",
          }).then(function mySuccess(response) {
                $scope.view = "Hesaplama tamamlandı.";
                $scope.info = response.data;
          }, function myError(response) {
                $scope.view = "Hesaplama esnasında bir hata oluştu.";
                $scope.info = response.statusText;
          });
        }
});

function graph(rate=0){
    var canvas = document.getElementById("graph");
    var ctx = canvas.getContext("2d");
    ctx.fillStyle = "#FFFFFF";
    ctx.beginPath();
    ctx.arc(canvas.width / 2,canvas.height,canvas.height,Math.PI,2*Math.PI);
    ctx.arc(canvas.width / 2,canvas.height,canvas.height / 1.5,2*Math.PI,Math.PI,-1);
    ctx.lineTo(0, canvas.height);
    ctx.fill();
    ctx.stroke();
    var oran = rate;
    var ct = canvas.getContext("2d");
    ct.fillStyle = "#00aaff";
    ct.beginPath();
    ct.arc(canvas.width / 2,canvas.height,canvas.height,Math.PI,(oran /100.0 + 1)*Math.PI);
    ct.arc(canvas.width / 2,canvas.height,canvas.height / 1.5,(oran / 100.0 + 1)*Math.PI,Math.PI,-1);
    ct.lineTo(0, canvas.height);
    ct.fill();
    ct.stroke();
    var c = canvas.getContext("2d");
    c.fillStyle="#ffffff";
    c.font = "30px Arial";
    c.fillText("% " + oran, canvas.width / 2-40, canvas.height);
}
