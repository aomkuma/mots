angular.module('e-homework').controller('ProjectController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! Project page');
	$scope.$parent.menu_selected = 'project';
    $scope.$parent.menu_selected_th = 'โครงการ';
    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.ProjectList = result.data.DATA.Project;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.FileList = [];
    $scope.ProjectList = [];

    $scope.load('projects/view');
});