angular.module('e-homework').controller('ContactUsController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'contact-us';

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

    $scope.saveData = function(Data, ImageFile, MapFile){
        
        var params = {'Data' : Data, 'ImageFile' : ImageFile, 'MapFile' : MapFile};
        // IndexOverlayFactory.overlayShow();
        HTTPService.uploadRequest('contact-us/update', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                window.location.reload();
             
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadData = function(){
        HTTPService.clientRequest('contact-us/get', null).then(function(result){
            console.log(result);
            $scope.Data = result.data.DATA;
            if($scope.Data == null){
                $scope.Data = {'image_name' : '', 'map_name' : ''};
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    

    IndexOverlayFactory.overlayHide();
    $scope.loadData();

});
