angular.module('e-homework').controller('QuestionAnswerController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'question-answer';

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
            $scope.loadList();
            IndexOverlayFactory.overlayHide();
        });
    }

    
    $scope.loadList = function(){
        HTTPService.clientRequest('question-answer/list', null).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.updateData = function(Data){
        var params = {'Data' : Data};
        if(Data.answer_date != undefined && Data.answer_date != null && Data.answer_date != ''){
            Data.answer_date = makeSQLDate(Data.answer_date);
        }
        var params = {'Data' : Data};
        HTTPService.clientRequest('question-answer/answer/update', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.loadList();
                $scope.PAGE = 'MAIN';
            }
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
            HTTPService.clientRequest('question-answer/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.updateAnswer = function(data){
        $scope.Data = angular.copy(data);
        $scope.Data.answer_by = $scope.currentUser.name + ' ' + $scope.currentUser.lastName;
        $scope.Data.answer_date = new Date();
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
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


    IndexOverlayFactory.overlayHide();
    $scope.PAGE = 'MAIN';
    
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    
});
