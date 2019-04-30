angular.module('e-homework').controller('CertificationCodeController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! AttachFile Multi page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'authority';

    $scope.page_type = $routeParams.page_type;

    $scope.MenuPermission =  angular.fromJson(sessionStorage.getItem('MenuPermission'));
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
            $scope.Menu = $filter('MenuPermission')($scope.MenuPermission, $scope.Menu);     
            // $scope.load('menu/page/get', $scope.ID);
            
        });
    }

    $scope.loadMenu('menu/list');
   
    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            $scope.loadList('certification-code/list', $scope.condition);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadProvince = function(region_id){
        var params = {'qtype' : 'PROVINCES', 'keyword' : region_id};
        HTTPService.clientRequest('autocomplete', params).then(function(result){
            console.log(result);
            $scope.ProvinceList = result.data.DATA;
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

    $scope.saveData = function(Data){
        
        if(Data.start_date != null && Data.start_date != undefined && Data.start_date != ''){
            Data.start_date = makeSQLDate(Data.start_date);
        }
        if(Data.end_date != null && Data.end_date != undefined && Data.end_date != ''){
            Data.end_date = makeSQLDate(Data.end_date);
        }
        var params = {'Data' : Data};
        HTTPService.uploadRequest('certification-code/update', params).then(function(result){
            alert('บันทึกสำเร็จ');
            $scope.loadList();
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
            HTTPService.clientRequest('certification-code/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
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

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    $scope.loadProvince('');
    

});
