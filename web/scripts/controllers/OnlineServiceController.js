angular.module('e-homework').controller('OnlineServiceController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    $scope.page_type = 'online-service';
    
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

    $scope.updateData = function(Data, ServiceTypeList){
        $scope.alertMessage = 'ต้องการส่งคำขอนี้ ใช่หรือไม่ ?';
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
            var params = {'Data' : Data, 'ServiceTypeList' : ServiceTypeList};
            HTTPService.clientRequest('online-service/request', params).then(function(result){
                console.log(result);
                window.location.href = '#/';
                IndexOverlayFactory.overlayHide();
            });
        });
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }

    $scope.toggleServiceTypeList = function(index, checked){
        if($scope.ServiceTypeList[index].checked == false){
            $scope.ServiceTypeList[index].checked = true;
        }else{
            $scope.ServiceTypeList[index].checked = false;
        }
        // var idx = $scope.ServiceType.indexOf(name);

        // // Is currently selected
        // if (idx > -1) {
        //   $scope.ServiceType.splice(idx, 1);
        // }

        // // Is newly selected
        // else {
        //   $scope.ServiceType.push(name);
        // }

        console.log($scope.ServiceTypeList);
    }

    $scope.ServiceTypeList = [
                        {'request_type':'ขอตรวจดู', 'request_desc' : '', 'checked' : false}
                        ,{'request_type':'ขอสำเนาแผ่นซีดี ', 'request_desc' : '', 'checked' : false}
                        ,{'request_type':'ขอสำเนาเอกสารที่มีการรับรองสำเนาถูกต้อง', 'request_desc' : '', 'checked' : false}
                        ,{'request_type':'อื่นๆ', 'request_desc' : '', 'checked' : false}
                        ];
    $scope.ServiceType = [];

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadProvince();

});
