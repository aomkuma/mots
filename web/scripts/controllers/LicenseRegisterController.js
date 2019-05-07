angular.module('e-homework').controller('LicenseRegisterController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {

    $scope.page_type = 'license-register';

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

    $scope.loadData = function(condition){
        var params = {'condition': condition};
        HTTPService.clientRequest('license-register/get', params).then(function(result){
            $scope.DataList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data, AttachFile){
        $scope.alertMessage = 'ต้องการบันทึกข้อมูล ใช่หรือไม่ ?';
        var modalInstance = $uibModal.open({
            animation : false,
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
            var params = {'Data' : Data, 'AttachFile' : AttachFile};
            HTTPService.uploadRequest('license-register/request', params).then(function(result){
                if(result.data.STATUS == 'OK'){
                    $scope.PAGE = 'RESULT';
                    $scope.RequestResult = result.data.DATA;
                }
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.requestData = function(){
        $scope.Data = null;
        $scope.AttachFile = null;
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancel = function(page){
        if(page == 'MAIN' && $scope.PAGE == 'RESULT'){
            $scope.DataList = null;
            $scope.condition = {'keyword' : ''};
        }
        $scope.PAGE = page;
    }

    $scope.PAGE = 'MAIN';

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type', $scope.page_type);
    

});