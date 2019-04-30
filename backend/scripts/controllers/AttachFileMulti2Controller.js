angular.module('e-homework').controller('AttachFileMulti2Controller', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }

    $scope.MenuPermission =  angular.fromJson(sessionStorage.getItem('MenuPermission'));
    
    console.log('Hello ! AttachFile Multi page');
	$scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'authority';

    $scope.page_type = $routeParams.page_type;

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
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadDataList = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.model.list.DataList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadMasterList = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MasterList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.save = function(action, Data, AttachFileList, FileName){
        
        IndexOverlayFactory.overlayShow();
        
        var params = {'Data':Data, 'AttachFileList':AttachFileList, 'FileName' : FileName};
        
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.FileList = [];
                $scope.addFiles();
                $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
                $scope.PAGE = 'MAIN';
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.setActives = function(action, id, active_status){
        var params = {'id' : id, 'active_status' : active_status};
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                // $scope.FileList = [];
                // $scope.addFiles();
                // $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.addFiles = function(){
        $scope.FileList.push({'attachFileTH':{'name_th':''}, 'attachFileEN':{'name_en':''}});

    }

    $scope.edit = function(data){
        console.log(data);
        $scope.AttachFile = null;
        $scope.FileList = [];
        $scope.Data = angular.copy(data);
        $scope.FileName = [{'name_th':data.AttachFiles[0].display_name, 'name_en' : ''}];
        // alert(data.AttachFiles.length);
        if(data.AttachFiles.length > 1){
            $scope.FileName[0].name_en = data.AttachFiles[1].display_name;
        }
        $scope.addFiles();
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        $scope.AttachFile = null;
        $scope.FileList = [];
        $scope.FileName = [{'name_th':'', 'name_en' : ''}];
        $scope.addFiles();
        // create Data obj
        var order_no = 0;
        if($scope.model.list.DataList == null || $scope.model.list.DataList.length == 0){
            order_no = 1;
        }else{
            order_no = $scope.model.list.DataList.length + 1;
        }

        $scope.Data = {'menu_type' : $scope.page_type, 'order_no' : order_no, 'actives' : 'Y', 'file_type':''};
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
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
            HTTPService.clientRequest('attachfile-multi/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    IndexOverlayFactory.overlayHide();
    $scope.FileList = [];
    $scope.FileName = [{'name_th':'', 'name_en' : ''}];
    $scope.addFiles();
    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
    $scope.loadMasterList('attachfile-multi/get/master' ,$scope.page_type);

    // Drag & drop zone

    $scope.$watch('model', function(model) {
        $scope.modelAsJson = angular.toJson(model, true);
    }, true);

    $scope.model = {selected: null,
        list: {"DataList": []}
    };

    $scope.dropCallback = function(DataList){
        // DataList.splice($index, 1);
        // alert('Drop!' + index);
        // return ;
        var params = {'DataList' : DataList};
        HTTPService.clientRequest('attachfile-multi/update/sort', params).then(function (result) {
            if (result.data.STATUS == 'OK') {
                $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
            }
            IndexOverlayFactory.overlayHide();
        });
    }

});
