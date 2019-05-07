angular.module('e-homework').controller('PurchaseController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.loadDataList = function(action, page_type, condition){
        var params = {'page_type' : page_type, 'actives' : 'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.search = function(condition){
        $scope.loadDataList('purchase/list' ,$scope.listening_type, condition);
    }

    $scope.viewDetail = function(data){
        $scope.Detail = angular.copy(data);
        var modalInstance = $uibModal.open({
            animation : false,
            templateUrl : 'purchase-detail.html',
            size : 'lg',
            scope : $scope,
            controller : 'ModalDialogCtrl',
            resolve : {
                params : function() {
                    return {};
                } 
            },
        });

        modalInstance.result.then(function (valResult) {
            
        });
    }

    $scope.getThaiDate = function(date){
        // console.log(date);
        if(date != null || date != ''){
            return convertDateToFullThaiDateIgnoreTime(new Date(date));    
        }else{
            return '';
        }
        
    }

    IndexOverlayFactory.overlayHide();
    $scope.FileList = [];
    
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadDataList('purchase/list' ,$scope.page_type);

});
