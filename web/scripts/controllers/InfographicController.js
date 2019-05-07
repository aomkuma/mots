angular.module('e-homework').controller('InfographicController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {

    $scope.page_type = 'infographic';

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

    $scope.loadList = function(action){
        var params = {'actives': 'Y', 'page_type' : $scope.page_type, 'DEFAULT_LANGUAGE' : $scope.$parent.DEFAULT_LANGUAGE};
        HTTPService.clientRequest(action, params).then(function(result){
            $scope.DataList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    
    $scope.viewDetail = function(data){
        $scope.next_index = 0;
        $scope.prev_index = 0;
        $scope.PictureList = [];
        $scope.Detail = angular.copy(data); 
        var params = {'id' : data.id};
        HTTPService.clientRequest('infographic/visit-count/update', params).then(function(result){
            
            $scope.slideImage($scope.next_index);
            
            IndexOverlayFactory.overlayHide();
        });
        $scope.PAGE = 'DETAIL';
    }

    $scope.slideImage = function(index){
        var cnt = 0;
        var position = index;
        $scope.PictureList = [];
        console.log($scope.Detail.AttachFiles);
        while(cnt < 3 && position < $scope.Detail.AttachFiles.length){
            if(cnt == 0){
                $scope.CurrentPicture = $scope.Detail.AttachFiles[position].file_path;
            }
            $scope.PictureList.push($scope.Detail.AttachFiles[position]);
            position++;
            cnt++;
            console.log('do : '+cnt);
            console.log('index : ' + index);
        }
        $scope.next_index = index + 1;
        $scope.prev_index = index - 1;
        console.log($scope.next_index);
        console.log($scope.prev_index);
        console.log($scope.PictureList);
    }

    $scope.setCurrentPicture = function(index){
        $scope.CurrentPicture = $scope.PictureList[index].file_path;
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }
    
    $scope.next_index = 0;
    $scope.prev_index = 0;
    $scope.PictureList = [];
    

    $scope.PAGE = 'MAIN';

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type', $scope.page_type);
    $scope.loadList('infographic/list');
    

});