angular.module('e-homework').controller('QuestionAnswerController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'question-answer';

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

    $scope.updateData = function(Data){
        
        $scope.alertMessage = 'ต้องการส่งแบบสอบถามนี้ ใช่หรือไม่ ?';
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
            var params = {'Data' : Data};
            HTTPService.uploadRequest('question-answer/question/update', params).then(function(result){
                console.log(result);
                if(result.data.STATUS == 'OK'){
                    alert('ระบบบันทึกแบบสอบถามนี้ ของท่านแล้ว กรุณารอการติดต่อกลับจากเจ้าหน้าที่ในภายหลัง');
                    window.location.replace('#/');
                }else{
                    alert(result.data.DATA);
                }
                IndexOverlayFactory.overlayHide();
            });
        });
    }


     $scope.cancel = function(){
        $scope.Data = null;
        $scope.AppealCallbackList = [];
        $scope.AppealListList = [];
        $scope.PAGE = 'MAIN';
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

    $scope.validateKeyCapcha = false;

    $scope.genCapcha();

    IndexOverlayFactory.overlayHide();

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    

});
