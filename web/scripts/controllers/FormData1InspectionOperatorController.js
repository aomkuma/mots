angular.module('e-homework').controller('FormData1InspectionOperatorController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    
    $scope.page_type = $routeParams.page_type;

    $scope.page_type = 'operator-list';

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

    $scope.loadIsoAll = function(){
        var params = {'type' : 'all'};
        HTTPService.clientRequest('form-data1/list/iso', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.IsoList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(condition){
        var con = angular.copy(condition);
        IndexOverlayFactory.overlayShow();
        if(con.start_date != null && con.start_date != ''){
            con.start_date = makeSQLDate(con.start_date);
        }
        if(con.end_date != null && con.end_date != ''){
            con.end_date = makeSQLDate(con.end_date);
        }

        var params = {'condition' : con, 'menu_type' : 'certification-list'};
        HTTPService.clientRequest('form-data1/list', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
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

    $scope.condition = {'keyword':'', 'iso':null};
    $scope.UsageStatusList = [];
    $scope.PAGE = 'MAIN';

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList($scope.condition);
    $scope.loadIsoAll();

});