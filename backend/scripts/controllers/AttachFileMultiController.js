angular.module('e-homework').controller('AttachFileMultiController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
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
            $scope.DataList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.save = function(action, AttachFileList, FileName){
        
        IndexOverlayFactory.overlayShow();
        // create Data obj
        var order_no = 0;
        if($scope.DataList == null || $scope.DataList.length == 0){
            order_no = 1;
        }else{
            order_no = $scope.DataList.length + 1;
        }

        var Data = {'menu_type' : $scope.page_type, 'order_no' : order_no, 'actives' : 'Y'};
        var params = {'Data':Data, 'AttachFileList':AttachFileList, 'FileName' : FileName};
        
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.FileList = [];
                $scope.FileName = [];
                $scope.addFiles();
                $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
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
        $scope.FileList.push({'attachFileTH':null, 'attachFileEN':null});
        $scope.FileName.push({'name_th':'', 'name_en' : ''});
    }

    IndexOverlayFactory.overlayHide();
    $scope.FileList = [];
    $scope.FileName = [{'name_th':'', 'name_en' : ''}];
    $scope.addFiles();

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);

});
