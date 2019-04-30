angular.module('e-homework').controller('HearingReportController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    $scope.page_type = 'hearing-report';
    
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

    $scope.updateData = function(Data, Chanel, DataType){
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
            var params = {'Data' : Data , 'Chanel' : Chanel, 'DataType' : DataType};
            HTTPService.clientRequest('hearing-report/update', params).then(function(result){
                console.log(result);
                // window.location.href = '#/';
                IndexOverlayFactory.overlayHide();
            });
        });
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }

    $scope.toggleChanelList = function(name){
        
        var idx = $scope.Chanel.indexOf(name);

        // Is currently selected
        if (idx > -1) {
          $scope.Chanel.splice(idx, 1);
        }

        // Is newly selected
        else {
          $scope.Chanel.push(name);
        }

        console.log($scope.Chanel);
    }

    $scope.toggleDataTypeList = function(name){
        
        var idx = $scope.DataType.indexOf(name);

        // Is currently selected
        if (idx > -1) {
          $scope.DataType.splice(idx, 1);
        }

        // Is newly selected
        else {
          $scope.DataType.push(name);
        }

        console.log($scope.DataType);
    }

    $scope.ChanelList = [{'detail_desc' : 'เว็บไซต์ www.acfs.go.th'}
                        ,{'detail_desc' : 'แผ่นพับ/โบรชัวร์'}
                        ,{'detail_desc' : 'การจัดนิทรรศการ'}
                        ,{'detail_desc' : 'ผ่านสถานีวิทยุกระจายเสียง'}
                        ,{'detail_desc' : 'ผ่านรายการโทรทัศน์'}
                        ,{'detail_desc' : 'ป้ายโปสเตอร์'}
                        ,{'detail_desc' : 'หนังสือ'}
                        ,{'detail_desc' : 'อื่นๆ'}
                        ];

    $scope.DataTypeList = [{'detail_desc' : 'มาตรฐานสินค้าเกษตรและอาหาร/คู่มือขั้นตอนในการกำหนดมาตรฐานสินค้าเกษตรและอาหาร'}
                        ,{'detail_desc' : 'พระราชบัญญัติมาตรฐานสินค้าเกษตรและอาหาร พ.ศ.2551'}
                        ,{'detail_desc' : 'กฎหมาย/ระเบียบ ความปลอดภัย'}
                        ,{'detail_desc' : 'รายชื่อหน่วยงานที่ได้รับการรับรอง/คู่มือขั้นตอนในการตรวจประเมินเพื่อรับรองระบบงาน'}
                        ,{'detail_desc' : 'โครงสร้าง อำนาจ หน้าที่ของ มกอช.'}
                        ,{'detail_desc' : 'นโยบายและงบประมาณของ มกอช.'}
                        ,{'detail_desc' : 'การประกวดราคา/ประกาศผลสอบ/ผลพิจารณาจัดซื้อจัดจ้าง'}
                        ,{'detail_desc' : 'อื่นๆ'}
                        ];

    $scope.Chanel = [];
    $scope.DataType = [];

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);

});
