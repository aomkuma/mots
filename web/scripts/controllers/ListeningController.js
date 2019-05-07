angular.module('e-homework').controller('ListeningController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'listening';

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

    $scope.loadDataList = function(action, listening_type, condition){
        $scope.listening_type = listening_type;
        var params = {'listening_type' : listening_type, 'view_type':'view', 'actives' : 'Y', 'condition' : condition};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.Listening;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.search = function(condition){
        $scope.loadDataList('listening/list' ,$scope.listening_type, condition);
    }

    $scope.getThaiDate = function(date){
        // console.log('check date :'+date);
        if(date != undefined){
            
            return convertDateToFullThaiDateIgnoreTime(new Date(date));
        }
    }

    IndexOverlayFactory.overlayHide();
    $scope.FileList = [];
    $scope.listening_type = 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร';
    
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadDataList('listening/list' ,$scope.listening_type, null);

});
