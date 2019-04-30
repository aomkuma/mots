angular.module('e-homework').controller('FreqQuestionController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'freq-question';

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
            $scope.loadList($scope.QuestionTypeList[0]);
            IndexOverlayFactory.overlayHide();
        });
    }

    
    $scope.loadList = function(question_type){
        var params = {'question_type' : question_type, 'keyword' : $scope.keyword};
        HTTPService.clientRequest('freq-question/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.updateData = function(Data){
        var params = {'Data' : Data};
        HTTPService.clientRequest('freq-question/update', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.loadList($scope.QuestionType);
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
            HTTPService.clientRequest('freq-question/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.setQuestionType = function(index){
        $scope.QuestionType = $scope.QuestionTypeList[index];
        $scope.QuestionIndex = index;
        $scope.loadList($scope.QuestionTypeList[index]);
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
    }

    $scope.add = function(){
        var order_no = $scope.DataList.length + 1;
        $scope.DataList.unshift({'id' : '', 'question_type' : $scope.QuestionType, 'order_no' : order_no, 'actives' : 'Y'});
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
    
    $scope.QuestionTypeList = ['มาตรฐาน', 'การรับรอง', 'เกษตรดิจิทัล', 'การควบคุม', 'ความรู้ทั่วไป', 'พ.ร.บ. มาตรฐานสินค้าเกษตร'];
    $scope.QuestionIndex = 0;
    $scope.QuestionType = $scope.QuestionTypeList[0];

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    
});
