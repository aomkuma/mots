angular.module('e-homework').controller('ListeningCommentController', function($scope, $compile, $cookies, $uibModal, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    console.log('asdasd');
    $scope.page_type = 'listening';
    $scope.ID = $routeParams.id;
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

    $scope.loadProvince = function(action){
        var params = {'masterType' : 'Province'};
        HTTPService.clientRequest('masterfile/get', params).then(function(result){
            console.log(result);
            $scope.ProvinceList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.updateData = function(action, Data){
        
        $scope.alertMessage = 'ต้องการบันทึกข้อมูลความคิดเห็นนี้ ใช่หรือไม่ ?';
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
            var params = {'id' : $scope.ID, 'Data' : Data};
            HTTPService.clientRequest(action, params).then(function(result){
                console.log(result);
                if(result.data.STATUS == 'OK'){
                    alert('ระบบบันทึกความคิดเห็นของท่านแล้ว ขอบคุณสำหรับการแสดงความคิดเห็น');
                    window.location.replace('#/listening');
                }
                IndexOverlayFactory.overlayHide();
            });
        });
    }

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadProvince();
    
});