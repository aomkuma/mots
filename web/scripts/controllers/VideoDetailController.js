angular.module('e-homework').controller('VideoDetailController', function($scope, $compile, $cookies, $filter, $state, $sce, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.$parent.video_selected = 'video';
    $scope.ID = $routeParams.id;

    $scope.trustUrl = function(){
        $scope.Video.video_url = $sce.trustAsResourceUrl($scope.Video.video_url);
        $("#video_frame").prop('src', $scope.Video.video_url);
        
    }

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

    $scope.load = function(action, id){
        var params = {'id' : id, 'view_type':'viewer'};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);

            $scope.Video = result.data.DATA.Video;
            $scope.Video.video_date = $scope.getThaiDate($scope.Video.video_date);
            $scope.trustUrl();
            // $("#video_frame").prop('src', $scope.Video.video_url);
            // alert($("#video_frame").attr('src'));
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.getThaiDate = function(date){
        console.log(date);
        return convertDateToFullThaiDateIgnoreTime(new Date(date));
    }

    $scope.cancelUpdate = function(){
        window.location.href = '#/video';
    }

    $scope.loadMenu('menu/list');
    $scope.load('video/get', $scope.ID);

});