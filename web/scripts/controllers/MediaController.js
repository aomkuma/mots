angular.module('e-homework').controller('MediaController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {

    $scope.page_type = 'media';

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

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(action){
        var params = {'actives': 'Y', 'page_type' : $scope.page_type};
        HTTPService.clientRequest(action, params).then(function(result){
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    
    $scope.viewDetail = function(data){
        var params = {'id' : data.id};
        HTTPService.clientRequest('media/visit-count/update', params).then(function(result){
            $scope.Detail = angular.copy(data);    
            IndexOverlayFactory.overlayHide();
        });
        $scope.PAGE = 'DETAIL';
    }

    

    $scope.PAGE = 'MAIN';

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type', $scope.page_type);
    $scope.loadList('media/list');
    

});