angular.module('e-homework').controller('NewsDetailController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
	$scope.$parent.menu_selected = 'news';
    $scope.$parent.menu_selected_th = 'ข่าว';

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
        });
    }

    $scope.load = function(action, viewer, id){
    	var params = {'id' : id , 'viewer' : viewer};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.News = result.data.DATA.News;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.getThaiDate = function(date){
        console.log(date);
        return convertDateToFullThaiDateIgnoreTime(new Date(date));
    }
    
    $scope.NEWS_ID = $routeParams.NEWS_ID;
    $scope.loadMenu('menu/list');
    $scope.load('news/view', 'visitor', $scope.NEWS_ID);
});