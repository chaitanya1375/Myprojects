var myapp=angular.module('computer',['ng-Route'])
.config(['$routeProvider',function($routeProvider){
	$routeProvider.
	when("/main",{
        templateUrl:"main.html",
		controller:"MainCtrl"
    });
}])
.controller('MainCtrl',[function(){
	console.log("this is MainCtrl");

}]);