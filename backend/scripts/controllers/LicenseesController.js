angular.module('e-homework').controller('LicenseesController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'licensees';

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
            $scope.loadList('licensees/list', $scope.condition);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadRegion = function(){
        var params = {'qtype' : 'REGION'};
        HTTPService.clientRequest('autocomplete', params).then(function(result){
            console.log(result);
            $scope.RegionList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadProvince = function(region_id){
        var params = {'qtype' : 'PROVINCES', 'keyword' : region_id};
        HTTPService.clientRequest('autocomplete', params).then(function(result){
            console.log(result);
            $scope.ProvinceList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadMaster = function(master_type){
        var params = {'masterType' : master_type};
        HTTPService.clientRequest('masterfile/get', params).then(function(result){
            console.log(result);
            $scope.StandardList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(){
        var params = {'condition' : $scope.condition};
        HTTPService.clientRequest('licensees/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data){
        if(Data.license_expire_date != null && Data.license_expire_date != undefined && Data.license_expire_date != ''){
            Data.license_expire_date = makeSQLDate(Data.license_expire_date);
        }
        if(Data.cert_expire_date != null && Data.cert_expire_date != undefined && Data.cert_expire_date != ''){
            Data.cert_expire_date = makeSQLDate(Data.cert_expire_date);
        }
        var params = {'Data' : Data};
        HTTPService.uploadRequest('licensees/update', params).then(function(result){
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
            HTTPService.clientRequest('licensees/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.updateData = function(data){
        console.log(data);
        $scope.Data = null;
        if(data != null){
            $scope.Data = angular.copy(data);
            if($scope.Data.province != ''){
                $scope.loadProvince($scope.Data.region);   
            }
            if($scope.Data.license_expire_date != null && $scope.Data.license_expire_date != undefined && $scope.Data.license_expire_date != ''){
                $scope.Data.license_expire_date = makeDate($scope.Data.license_expire_date);
            }
            if($scope.Data.cert_expire_date != null && $scope.Data.cert_expire_date != undefined && $scope.Data.cert_expire_date != ''){
                $scope.Data.cert_expire_date = makeDate($scope.Data.cert_expire_date);
            }
        }
        $scope.PAGE = 'UPDATE';
    }

    $scope.addMaster = function(){
        $scope.Master = {'menu_type' : $scope.page_type, 'actives' : 'Y'};
        var modalInstance = $uibModal.open({
            animation : true,
            templateUrl : 'add-master.html',
            size : 'ทก',
            scope : $scope,
            backdrop : 'static',
            controller : 'ModalDialogReturnFromOKBtnCtrl',
            resolve : {
                params : function() {
                    return {};
                } 
            },
        });

        modalInstance.result.then(function (valResult) {
            IndexOverlayFactory.overlayShow();
            var params = {'Data' : $scope.Master};
            HTTPService.clientRequest('masterfile/add', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadMaster($scope.page_type);
                IndexOverlayFactory.overlayHide();
            });
        });
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

    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    $scope.loadRegion();
    $scope.loadMaster($scope.page_type);

});
