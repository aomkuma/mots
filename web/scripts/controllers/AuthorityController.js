angular.module('e-homework').controller('AuthorityController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! Authority page');
	$scope.$parent.menu_selected = 'authority';
    $scope.$parent.menu_selected_th = 'อำนาจหน้าที่ของ CIO';
    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.Authority = result.data.DATA.Authority;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.FileList = [];
    $scope.Authority = {'contents':null};

    $scope.load('authorities');
});