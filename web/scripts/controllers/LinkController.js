angular.module('e-homework').controller('LinkController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! About page');
	
    console.log($scope.DEFAULT_LANGUAGE);
    $scope.$parent.menu_selected = 'about';
    $scope.$parent.menu_selected_th = 'เกี่ยวกับซีไอโอ';
    
    $scope.$parent.menu_selected_th = 'อำนาจหน้าที่ของ CIO';
    $scope.load = function(action, link_type){
        var params = {'link_type': link_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            window.open('../' + result.data.DATA.Link.file_path);
            history.back();
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.link_type = $routeParams.linktype;
    // $scope.MenuName = getMenuName($scope.link_type);
    console.log($scope.MenuName);
    $scope.load('links', $scope.link_type);
    

});