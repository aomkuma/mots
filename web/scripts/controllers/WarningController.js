angular.module('e-homework').controller('WarningController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'warning';

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
    
    $scope.loadData = function(){
        IndexOverlayFactory.overlayShow();
        var params = {'url' : 'http://warning.acfs.go.th/th/early-warning/rss.json'};
        HTTPService.clientRequest('warning/get', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.data;
                for(var i = 0; i <= $scope.DataList.length; i++){
                    if($scope.DataList[i].date != undefined && $scope.DataList[i].date != null && $scope.DataList[i].date != ''){
                        $scope.DataList[i].date = convertDateToFullThaiDateIgnoreTime(new Date($scope.DataList[i].date*1000));    
                    }
                }
            }else{
                alert('ไม่สามารถดึงข้อมูลข่าวเตือนภัยได้ กรุณาลองใหม่ภายหลัง');
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadData();
    

});
