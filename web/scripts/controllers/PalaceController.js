angular.module('e-homework').controller('PalaceController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('Hello ! Palace page');
	
    $scope.$parent.menu_selected = 'palace';
    $scope.$parent.menu_selected_th = 'ทำเนียบ CIO กระทรวง';

    $scope.palace_type = $routeParams.palace_type;

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

    $scope.load = function(action){
        var params = {'palace_type':$scope.palace_type, 'actives' : 'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            
            $scope.Palace = null;
            $scope.PalaceList = result.data.DATA.Palace;
            console.log($scope.PalaceList);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.checkHistory = function(palace_type){
        return palace_type.indexOf('history') > -1;
    }

    $scope.checkMenuType = function(menu_type){
        return menu_type.split('-')[0];
    }

    $scope.getDateTimeFormat = function(d){
        if(d != null && d != ''){
            return convertSQLDateTimeToReportDate(d);
        }
        return '';
    }

    $scope.AttachFile = null;
    $scope.Palace = null;
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

    // $scope.page_type = 'palace';
    // $scope.MenuName = getMenuName($scope.page_type);
    // console.log($scope.MenuName);

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.palace_type);
    $scope.load('palaces/list');

});