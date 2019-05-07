angular.module('e-homework').controller('BannerControlController', function($scope, $compile, $cookies, $filter, $state, $sce, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! Services page');
	$scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'services';

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

    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.List = result.data.DATA.BannerControl;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.save = function(action, List){
        var params = {'List':List};
        
        HTTPService.clientRequest(action, params).then(function(result){
            alert('บันทึกสำเร็จ');
            //console.log(result);
            $scope.load('bannercontrol/get');
            IndexOverlayFactory.overlayHide();
        });
    }

 

    $scope.load('bannercontrol/get');

});