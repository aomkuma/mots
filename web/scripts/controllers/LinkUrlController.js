angular.module('e-homework').controller('LinkUrlController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
	
	IndexOverlayFactory.overlayShow();
	
	$scope.$parent.menu_selected = 'relatelink';
	
	$scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.LinkUrl = result.data.DATA.LinkUrl;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.load('linkurlView');

});	