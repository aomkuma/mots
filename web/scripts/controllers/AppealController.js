angular.module('e-homework').controller('AppealController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'appeal';

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
            $scope.loadPage('appeal/page', $scope.MenuName[$scope.MenuName.length - 1].id);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPage = function(action, menu_id){
        var params = {'menu_id' : menu_id};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);

            if(result.data.STATUS == 'OK'){
                $scope.Page = result.data.DATA.Page;
                
            }
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

    $scope.updateData = function(Data, AppealList, AppealCallback, AttachFile){
        
        $scope.alertMessage = 'ต้องการส่งคำร้องเรียนนี้ ใช่หรือไม่ ?';
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
            var params = {'Data' : Data, 'AppealList' : AppealList, 'AppealCallback' : AppealCallback, 'AttachFile' : AttachFile};
            HTTPService.uploadRequest('appeal/update', params).then(function(result){
                console.log(result);
                if(result.data.STATUS == 'OK'){
                    alert('ระบบบันทึกคำร้องเรียนนี้ ของท่านแล้ว กรุณารอการติดต่อกลับจากเจ้าหน้าที่ในภายหลัง');
                    $scope.PAGE = 'MAIN';
                }else{
                    alert(result.data.DATA);
                }
                IndexOverlayFactory.overlayHide();
            });
        });
    }

    $scope.toggleCallback = function(name){
        var idx = $scope.AppealCallbackList.indexOf(name);

        // Is currently selected
        if (idx > -1) {
          $scope.AppealCallbackList.splice(idx, 1);
        }

        // Is newly selected
        else {
          $scope.AppealCallbackList.push(name);
        }
        console.log($scope.AppealCallbackList);
    }

    $scope.toggleAppealList = function(name){
        var idx = $scope.AppealListList.indexOf(name);

        // Is currently selected
        if (idx > -1) {
          $scope.AppealListList.splice(idx, 1);
        }

        // Is newly selected
        else {
          $scope.AppealListList.push(name);
        }
        console.log($scope.AppealListList);
    }

     $scope.setEmptyOfficer = function(){
        $scope.Data.officer = false;

     }

     $scope.setEmptyRadio = function(){
        $scope.Data.team_to_comment = false;
     }

     $scope.cancel = function(){
        $scope.Data = null;
        $scope.AppealCallbackList = [];
        $scope.AppealListList = [];
        $scope.PAGE = 'MAIN';
     }

     $scope.goUpdate = function(){
        $scope.Data = null;
        $scope.AppealCallbackList = [];
        $scope.AppealListList = [];
        $scope.PAGE = 'UPDATE';
     }

    $scope.genCapcha = function(){
        var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z');
        var i;
        for (i = 0; i < 6; i++) {
            var a = alpha[Math.floor(Math.random() * alpha.length)];
            var b = alpha[Math.floor(Math.random() * alpha.length)];
            var c = alpha[Math.floor(Math.random() * alpha.length)];
            var d = alpha[Math.floor(Math.random() * alpha.length)];
            var e = alpha[Math.floor(Math.random() * alpha.length)];
            var f = alpha[Math.floor(Math.random() * alpha.length)];
            var g = alpha[Math.floor(Math.random() * alpha.length)];
        }
        $scope.capcha1 = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' ' + f + ' ' + g;
        $scope.validateKeyCapcha = false;
    }

    $scope.validateCapcha = function(){
        var string1 = $scope.removeSpaces($scope.capcha1);
        var string2 = $scope.removeSpaces($scope.key_capcha);

        if (string1 == string2) {
            console.log(string1, string2);
            $scope.validateKeyCapcha = true;
        }
        else {
            $scope.validateKeyCapcha = false;
        }
    }

    $scope.removeSpaces = function(string) {
        return string.split(' ').join('');
    }

    IndexOverlayFactory.overlayHide();
    $scope.AppealList = [
                        {'appeal_text':'เรื่องทั่วไป'}
                        ,{'appeal_text':'การติดต่อประสานงาน'}
                        ,{'appeal_text':'การประเมิน'}
                        ,{'appeal_text':'เรื่องอื่นๆ'}
                        ];

    $scope.AppealCallback = [
                        {'callback_name':'ตามที่อยู่'}
                        ,{'callback_name':'อีเมลล์'}
                        ,{'callback_name':'โทรศัพท์บ้าน'}
                        ,{'callback_name':'โทรศัพท์มือถือ'}
                        ];
    $scope.Data = {'page_type':$routeParams.page_type};
    $scope.AppealCallbackList = [];
    $scope.AppealListList = [];
    $scope.PAGE = 'UPDATE';
    $scope.validateKeyCapcha = false;

    $scope.page_type = $routeParams.page_type;
    
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadProvince();
    $scope.genCapcha();
    

});
