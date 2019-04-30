angular.module('e-homework').controller('OnlineServiceController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! AttachFile Multi page');
    $scope.DEFAULT_LANGUAGE = 'TH';

    $scope.page_type = 'online-service';
    
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

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadProvince = function(action){
        var params = {'masterType' : 'Province'};
        HTTPService.clientRequest('masterfile/get', params).then(function(result){
            console.log(result);
            $scope.ProvinceList = result.data.DATA;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(condition){
        var params = {'condition' : condition};
        HTTPService.clientRequest('online-service/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.updateData = function(Data){
        
        var params = {'Data' : Data};
        HTTPService.clientRequest('online-service/update', params).then(function(result){
            alert('บันทึกสำเร็จ');
            console.log(result);
            $scope.loadList($scope.condition);
            $scope.PAGE = 'MAIN';
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.viewData = function(data){
        $scope.Data = angular.copy(data);
        $scope.ServiceType = $scope.Data.online_service_type;
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }

    $scope.ServiceTypeList = [
                        {'request_type':'ขอตรวจดู', 'request_desc' : '', 'checked' : false}
                        ,{'request_type':'ขอสำเนาแผ่นซีดี ', 'request_desc' : '', 'checked' : false}
                        ,{'request_type':'ขอสำเนาเอกสารที่มีการรับรองสำเนาถูกต้อง', 'request_desc' : '', 'checked' : false}
                        ,{'request_type':'อื่นๆ', 'request_desc' : '', 'checked' : false}
                        ];
    $scope.ServiceType = [];
    $scope.PAGE = 'MAIN';
    $scope.YearList = getYearList(20);
    $scope.MonthList = getMonthList();


    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadProvince();
    $scope.loadList();

});
