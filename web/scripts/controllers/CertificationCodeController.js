angular.module('e-homework').controller('CertificationCodeController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }
    
    $scope.loadList = function(){
        var params = {'condition' : $scope.condition, 'page_type' : $scope.page_type};
        HTTPService.clientRequest('certification-code/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.updateData = function(data){
        console.log(data);
        $scope.Data = {'page_type' : $scope.page_type};
        if(data != null){
            $scope.Data = angular.copy(data);
            if($scope.Data.start_date != null && $scope.Data.start_date != undefined && $scope.Data.start_date != ''){
                $scope.Data.start_date = makeDate($scope.Data.start_date);
            }
            if($scope.Data.end_date != null && $scope.Data.end_date != undefined && $scope.Data.end_date != ''){
                $scope.Data.end_date = makeDate($scope.Data.end_date);
            }
            
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
    $scope.loadList();
    

});
