angular.module('e-homework').controller('PermissionController', function($scope, $compile, $cookies, $filter, $state, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! LinkUrl page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'user-permission';

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

    $scope.loadUserRoleDetail = function(role_id){
        var params = {'role_id': role_id};
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('user-role/get', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.Data = result.data.DATA.Head;
                $scope.Details = result.data.DATA.Detail;
                $scope.checkMenuRoleAll();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.load = function(){
        var params = {'currentPage': $scope.currentPage
                    , 'limitRowPerPage': $scope.limitRowPerPage 
                    };
        IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('user-role/list', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;
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
        $scope.loadUserRoleDetail($scope.Data.id);
        $scope.PAGE = 'UPDATE';
        $scope.MenuList = angular.copy($scope.Menu);
        $scope.Details = [];
    }

    $scope.add = function(){
        
        $scope.Data = null;
        $scope.loadUserRoleDetail('');
        $scope.PAGE = 'UPDATE';
        $scope.MenuList = angular.copy($scope.Menu);
        $scope.Details = [];
    }

    $scope.cancelUpdate = function(){
        
        $scope.Data = null;

        $scope.PAGE = 'MAIN';
    }

    $scope.saveData = function(Data, MenuList){
        // console.log($scope.LinkUrl);
        IndexOverlayFactory.overlayShow();
 
        var params = {'Data':Data, 'MenuList':MenuList};
        HTTPService.clientRequest('user-role/update', params).then(function(result){
            console.log(result);
            $scope.PAGE = 'MAIN';
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
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

    $scope.checkMenuRole = function(menu_id){
        for(var i = 0; i < $scope.Details.length; i++){
            if($scope.Details[i].menu_id == menu_id && $scope.Details[i].actives == 'Y'){
                return 'Y';
            }
            // for(var j = 0; j < $scope.MenuList.length; j++){
            //     if($scope.Details[i].menu_id == $scope.MenuList[j].id){
            //         return 'Y';
            //     }
            // }
        }
    }

    $scope.checkMenuRoleAll = function(){
        for(var i = 0; i < $scope.Details.length; i++){
            for(var j = 0; j < $scope.MenuList.length; j++){
                if($scope.Details[i].menu_id == $scope.MenuList[j].id && $scope.Details[i].actives == 'Y'){
                    $scope.MenuList[j].checked_menu = 'Y';
                }
                for(var k = 0; k < $scope.MenuList[j].sub_menu.length; k++){
                    if($scope.Details[i].menu_id == $scope.MenuList[j].sub_menu[k].id && $scope.Details[i].actives == 'Y'){
                        $scope.MenuList[j].sub_menu[k].checked_menu = 'Y';
                    }

                    for(var l = 0; l < $scope.MenuList[j].sub_menu[k].sub_menu.length; l++){
                        if($scope.Details[i].menu_id == $scope.MenuList[j].sub_menu[k].sub_menu[l].id && $scope.Details[i].actives == 'Y'){
                            $scope.MenuList[j].sub_menu[k].sub_menu[l].checked_menu = 'Y';
                        }

                        for(var m = 0; m < $scope.MenuList[j].sub_menu[k].sub_menu[l].sub_menu.length; m++){
                            if($scope.Details[i].menu_id == $scope.MenuList[j].sub_menu[k].sub_menu[l].sub_menu[m].id && $scope.Details[i].actives == 'Y'){
                                $scope.MenuList[j].sub_menu[k].sub_menu[l].sub_menu[m].checked_menu = 'Y';
                            }
                        }
                    }
                }
            }
        }
    }

    $scope.checkAll = function(list, level, index, checked){
        console.log(level, index, checked);
        var check = '';
        var List = [];
        if(checked == 'Y'){
            check = 'Y';
        }else{
            check = 'N';
        }

        if(level == 1){
            List = list;
        }
        for(var i = 0; i < list.sub_menu.length; i++){
            list.sub_menu[i].checked_menu = check;

            for(var j = 0; j < list.sub_menu[i].sub_menu.length; j++){
                list.sub_menu[i].sub_menu[j].checked_menu = check;

                for(var k = 0; k < list.sub_menu[i].sub_menu[j].sub_menu.length; k++){
                    list.sub_menu[i].sub_menu[j].sub_menu[k].checked_menu = check;

                    for(var l = 0; l < list.sub_menu[i].sub_menu[j].sub_menu[k].length; l++){
                        list.sub_menu[i].sub_menu[j].sub_menu[k].sub_menu[l].checked_menu = check;
                    }
                }
            }
        }
    }

    $scope.Details = [];
    $scope.totalPages = 0;
    $scope.currentPage = 0;
    $scope.limitRowPerPage = 10;
    $scope.limitDisplay = 5;
    
    $scope.PAGE = 'MAIN';
    $scope.load();

});