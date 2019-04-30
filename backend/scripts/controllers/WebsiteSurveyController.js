angular.module('e-homework').controller('WebsiteSurveyController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! AttachFile Multi page');
    $scope.DEFAULT_LANGUAGE = 'TH';

    $scope.page_type = 'website-survey';
    
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

    $scope.loadList = function(condition){
        var params = {'condition' : condition};
        HTTPService.clientRequest('website-survey/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }

    $scope.queryReport = function(condition){
        
        // return;
        
        var params = {
            'condition' : condition
        };
        // IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('website-survey/query', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;
                $scope.Result = result.data.DATA.Result;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.exportReport = function(condition, Result, DataList){
        
        // return;
        
        var params = {
            'condition' : condition
            , 'report_type': 'website-survey'
            , 'Result': Result
            , 'DataList': DataList
        };
        // IndexOverlayFactory.overlayShow();
        HTTPService.clientRequest('report/export', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                window.location.href="../files/files/downloads/" + result.data.DATA;
            }
            IndexOverlayFactory.overlayHide();
        });
    }    

    $scope.YearList = getYearList(20);
    $scope.MonthList = getMonthList();
    $scope.PAGE = 'MAIN';

    var curDate = new Date();
    $scope.Data = {'months' : (curDate.getMonth() + 1), 'years' : curDate.getFullYear()};
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);

});
