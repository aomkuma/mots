angular.module('e-homework').controller('InfographicController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'infographic';

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
            $scope.loadList('infographic/list', $scope.condition);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(){
        var params = {'page_type' : $scope.page_type};
        HTTPService.clientRequest('infographic/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data, AttachFileList, FileName){
        if(Data.publishing_date != null && Data.publishing_date != undefined && Data.publishing_date != ''){
            Data.publishing_date = makeSQLDate(Data.publishing_date);
        }
        var params = {'Data' : Data, 'AttachFileList' : AttachFileList, 'FileName' : FileName};
        HTTPService.uploadRequest('infographic/update', params).then(function(result){
            alert('บันทึกสำเร็จ');
            $scope.loadList();
            $scope.PAGE = 'MAIN';
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
            HTTPService.clientRequest('infographic/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

     $scope.removeFile = function(id){
        $scope.alertMessage = 'ต้องการลบไฟล์วีดีโอนี้ ใช่หรือไม่ ?';
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
            HTTPService.clientRequest('infographic/video/delete', params).then(function(result){
                // $scope.load('Datas');
                
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.addFiles = function(){
        $scope.FileList.push(
                {'AttachFile':
                    
                    {'attachFileTH':null, 'attachFileEN':null}
                    
                }
            );
        $scope.FileName.push({'name_th':'', 'name_en' : ''});

    }

    $scope.addFilesUpdate = function(){
        $scope.FileList.push(
                {'AttachFile':
                    
                    {'attachFileTH':null, 'attachFileEN':null}
                    
                }
            );
        // $scope.FileName.push({'name_th':'', 'name_en' : ''});

    }

    $scope.updateData = function(data){
        console.log(data);
        $scope.AttachFile = null;
        $scope.FileList = [];
        $scope.FileName = [];

        $scope.Data = angular.copy(data);
        /*
        $scope.FileName = [{'name_th':data.AttachFiles[0].display_name, 'name_en' : ''}];
        $scope.FileCode = [{'code_th':'', 'code_en' : ''}];
        $scope.FileCode[0].code_th = data.AttachFiles[0].file_code;
        // alert(data.AttachFiles.length);
        if(data.AttachFiles.length > 1){
            $scope.FileName[0].name_en = data.AttachFiles[1].display_name;
            $scope.FileCode[0].code_en = data.AttachFiles[1].file_code;
        }
        */
        var i =0;
        console.log(data.AttachFiles.length);
        while(i < data.AttachFiles.length){
            console.log(data.AttachFiles[i]);
            $scope.FileName.push({
                                'name_th':data.AttachFiles[i].display_name
                                , 'name_en' : (i+1 < data.AttachFiles.length ? data.AttachFiles[i + 1].display_name:'')
                                });
            i = i + 2;    
            $scope.addFilesUpdate();
        }

        console.log($scope.FileName);
        // $scope.addFiles();
        if($scope.Data.publishing_date != null && $scope.Data.publishing_date != ''){
            $scope.Data.publishing_date = makeDate($scope.Data.publishing_date);
        }
        
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        $scope.AttachFile = null;
        $scope.FileList = [];
        $scope.FileName = [];
        $scope.addFiles();
        // create Data obj
        var order_no = 0;
        if($scope.DataList == null || $scope.DataList.length == 0){
            order_no = 1;
        }else{
            order_no = $scope.DataList.length + 1;
        }

        $scope.Data = {'actives' : 'Y'};
        $scope.PAGE = 'UPDATE';
    }


    $scope.cancel = function(page){
        $scope.PAGE = page;
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

    $scope.FileList = [];
    $scope.FileName = [];
    $scope.FileCode = [];
    $scope.addFiles();

    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    
});
