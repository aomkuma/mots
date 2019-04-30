angular.module('e-homework').controller('UserAccountController', function($scope, $compile, $cookies, $filter, $state, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! LinkUrl page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'user-account';

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

    $scope.loadRole = function(){
        HTTPService.clientRequest('user-role/list', {'actives':'Y'}).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.RoleList = result.data.DATA.List;
            }
        });
    }

    $scope.load = function(){
        var params = {'currentPage': $scope.currentPage
                    , 'limitRowPerPage': $scope.limitRowPerPage 
                    };
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('user-account/list/user-account', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.DataList;
                $scope.totalPages = result.data.DATA.Total;
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.edit = function(data){
        $scope.AttachFile = null;
        $scope.Data = angular.copy(data);
        $scope.loadRole();
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        
        $scope.Data = null;
        $scope.loadRole();
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancelUpdate = function(){
        
        $scope.Data = null;

        $scope.PAGE = 'MAIN';
    }

    $scope.saveData = function(Data){
        // console.log($scope.LinkUrl);
        IndexOverlayFactory.overlayShow();
 
        var params = {'Data':Data};
        HTTPService.uploadRequest('user-account/update/user-account', params).then(function(result){
            console.log(result);
            $scope.PAGE = 'MAIN';
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.AttachFile = null;
                $scope.load();
                $scope.cancelUpdate();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.remove = function(action, id){
        $scope.alertMessage = 'ต้องการลบลิ้งค์นี้ ใช่หรือไม่ ?';
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
            HTTPService.deleteRequest(action, id).then(function(result){
            // $scope.load('LinkUrls');
            $scope.load('linkurl');
            IndexOverlayFactory.overlayHide();
        });
        });
        
    }

    $scope.totalPages = 0;
    $scope.currentPage = 0;
    $scope.limitRowPerPage = 10;
    $scope.limitDisplay = 5;
    
    $scope.PAGE = 'MAIN';
    $scope.load();

});