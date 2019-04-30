angular.module('e-homework').controller('FruitController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    
    $scope.page_type = 'fruit';

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

    $scope.loadMenu('menu/list');
   
    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            $scope.loadList('fruit/list', $scope.condition);
            IndexOverlayFactory.overlayHide();
        });
    }


    $scope.loadList = function(){
        var params = {'condition' : $scope.condition};
        HTTPService.clientRequest('fruit/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data, AttachFile){
        
        var params = {'Data' : Data};
        HTTPService.uploadRequest('fruit/update', params).then(function(result){
            $scope.loadList($scope.condition);
            $scope.PAGE = 'MAIN';
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.removeData = function(id){
        $scope.alertMessage = 'ต้องการลบข้อมูลนี้ ใช่หรือไม่ ?';
        var modalInstance = $uibModal.open({
            animation : true,
            templateUrl : 'views/dialog_confirm.html',
            size : 'sm',
            scope : $scope,
            backdrop : 'static',
            controller : 'ModalDialogCtrl',
            resolve : {
                params : function() {
                    return {};
                } 
            },
        });

        modalInstance.result.then(function (valResult) {
            IndexOverlayFactory.overlayShow();
            var params = {'id' : id};
            HTTPService.clientRequest('fruit/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList($scope.condition);
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.getThaiMonth = function(m){
        if(m!= null){
            return getThaiMonthName(m);
        }else{
            return '';
        }
        
    }

    $scope.updateData = function(data){
        console.log(data);
        if(data != null){
            $scope.Data = angular.copy(data);
            $scope.Data.prepare_to_eat_en = $scope.Data.prepare_to_eat_en.replace(/(?:\r\n|\r|\n)/g, '<br>');;
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
    $scope.MonthList = getMonthList();

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    

});
