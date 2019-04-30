angular.module('e-homework').controller('OfficerContactController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'officer-contact';

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

    $scope.loadDepList = function(){
        HTTPService.clientRequest('officer-contact/dep/list', null).then(function(result){
            console.log(result);
            $scope.DepList = result.data.DATA;
            if($scope.DepList == null){
                $scope.DepList = [];
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadOfficer = function(dep_id, dep){
        IndexOverlayFactory.overlayShow();
            var params = {'dep_id' : dep_id};
            HTTPService.clientRequest('officer-contact/officer/list', params).then(function(result){
                // $scope.load('Datas');
                $scope.PersonList = result.data.DATA;
                if($scope.PersonList == null){
                    $scope.PersonList = [];
                }
                $scope.DEP_ID = dep_id;
                $scope.Dep = angular.copy(dep);
                console.log($scope.Dep);
                $scope.PAGE = 'PERSON';
                IndexOverlayFactory.overlayHide();
            });
    }

    $scope.PAGE = 'MAIN';
    
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadDepList();

});
