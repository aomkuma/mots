angular.module('e-homework').controller('PolicyController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! Policy page');
	$scope.$parent.menu_selected = 'policy';
    $scope.$parent.menu_selected_th = 'นโยบายและยุทธศาสตร์';
    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.Policies = result.data.DATA.Policy;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.FileList = [];
    $scope.Policy = {'contents':null};

    $scope.load('policies');
});