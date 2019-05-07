angular.module('e-homework').controller('DocPeopleController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    $scope.page_type = $routeParams.page_type;
    
    $scope.loadMenu = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            //console.log(result);
            $scope.Menu = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
            $(document).ready(function(){
                // console.log('asd');
              $('a.test').on("click", function(e){
                // alert('aa');
                // $('ul.dropdown-menu').hide();
                $(this).next('ul').toggle();
                e.stopPropagation();
                e.preventDefault();
              });
            });

            // $scope.load('menu/page/get', $scope.ID);
            
        });
    }

    $scope.page_type = 'doc-people';

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }


    $scope.loadPatrolList = function(){
        var params = {'menu_type' : 'patrol', 'actives' : 'Y'};
        HTTPService.clientRequest('attachfile-multi/get/type', params).then(function(result){
            console.log(result);
            $scope.DataListPatrol = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPermissionList = function(){
        var params = {'menu_type' : 'permission', 'actives' : 'Y'};
        HTTPService.clientRequest('attachfile-multi/get/type', params).then(function(result){
            console.log(result);
            $scope.DataListPermission = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.updateData = function(data){
        console.log(data);
        $scope.Data = {'menu_type' : $scope.page_type};
        if(data != null){
            $scope.Data = angular.copy(data);
            
        }
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }

    $scope.popup1 = {
        opened: false
    };

    $scope.popup2 = {
        opened: false
    };

    $scope.open1 = function() {
        $scope.popup1.opened = true;
    };

    $scope.open2 = function() {
        $scope.popup2.opened = true;
    };

    $scope.PAGE = 'MAIN';

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadPatrolList();
    $scope.loadPermissionList();
    

});
