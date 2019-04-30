angular.module('e-homework').controller('PalaceController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! Palace page');
	$scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'palace';
    $scope.palace_type = $routeParams.palace_type;

    console.log('Hello ! Palace page ' + $scope.palace_type);

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

    $scope.addFiles = function(){
        $scope.FileList.push({'attachFile':null});
    }

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.load = function(action){
        var params = {'palace_type':$scope.palace_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.Palace = null;
            $scope.model.list.PalaceList = result.data.DATA.Palace;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.edit = function(data){
        $scope.AttachFile = null;
        $scope.Palace = angular.copy(data);
        if($scope.Palace.position_start_date != null && $scope.Palace.position_start_date != undefined && $scope.Palace.position_start_date != ''){
            $scope.Palace.position_start_date = makeDate($scope.Palace.position_start_date);
        }
        if($scope.Palace.position_end_date != null && $scope.Palace.position_end_date != undefined && $scope.Palace.position_end_date != ''){
            $scope.Palace.position_end_date = makeDate($scope.Palace.position_end_date);
        }
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        $scope.AttachFile = null;

        $scope.Palace = {'palace_type' : $scope.palace_type, 'position_th' : '', 'position_en':''};
        if($scope.palace_type == 'current-cio' || $scope.palace_type == 'history-cio'){
            $scope.Palace = {'palace_type' : $scope.palace_type, 'position_th':'CIO' , 'position_en':'CIO'};
        }
        console.log($scope.Palace);
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancelUpdate = function(){
        $scope.FileList = [];
        $scope.AttachFile = null;
        $scope.Palace = null;
        $scope.PAGE = 'MAIN';
    }

    $scope.save = function(action, Palace, AttachFile, AttachFileList){
        // console.log($scope.Palace);
        IndexOverlayFactory.overlayShow();
        if(Palace.position_start_date != null && Palace.position_start_date != undefined && Palace.position_start_date != ''){
            Palace.position_start_date = makeSQLDate(Palace.position_start_date);
        }
        if(Palace.position_end_date != null && Palace.position_end_date != undefined && Palace.position_end_date != ''){
            Palace.position_end_date = makeSQLDate(Palace.position_end_date);
        }
       
        var params = {'Palace':Palace, 'AttachFile':AttachFile, 'AttachFileList':AttachFileList};
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            $scope.PAGE = 'MAIN';
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.AttachFile = null;
                $scope.FileList = [];
                $scope.load('palaces/list');
                $scope.cancelUpdate();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.removeAttach = function(action, id, index){
        HTTPService.deleteRequest(action, id).then(function(result){
            // $scope.load('palaces');
            $scope.Palace.AttachFiles.splice(index, 1);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.FileList = [];
    $scope.AttachFile = null;
    $scope.Palace = {'position_th' : "", 'position_en' : "", 'palace_type' : $scope.palace_type};

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

    $scope.PAGE = 'MAIN';
    $scope.load('palaces/list');
    $scope.getMenu('menu/get/type' ,$scope.palace_type);

    // Drag & drop zone

    $scope.$watch('model', function(model) {
        $scope.modelAsJson = angular.toJson(model, true);
    }, true);

    $scope.model = {selected: null,
        list: {"PalaceList": []}
    };

    $scope.dropCallback = function(PalaceList){
        // DataList.splice($index, 1);
        // alert('Drop!' + index);
        // return ;
        var params = {'PalaceList' : PalaceList};
        HTTPService.clientRequest('palaces/update/sort', params).then(function (result) {
            if (result.data.STATUS == 'OK') {
                $scope.load('palaces/list');
                
            }
            IndexOverlayFactory.overlayHide();
        });
    }

});