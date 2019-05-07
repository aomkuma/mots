angular.module('e-homework').controller('VideoController', function($scope, $compile, $cookies, $filter, $state, $sce, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
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

    $scope.load = function(action){
        var params = {'actives':'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);
            $scope.Video = result.data.DATA.VideoList;
            setTimeout(function(){
                for(var i=0; i < $scope.Video.length; i++){
                    $videoSrc = $sce.trustAsResourceUrl($scope.Video[i].video_url);
                    $("#video" + i).prop('src', $videoSrc);
                    console.log($("#video" + i).attr('src'));
                }
            }, 500);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.viewDetail = function(id){
        window.location.href = '#/video/detail/' + id;
    }

    $scope.getThaiDate = function(date){
        console.log(date);
        return convertDateToFullThaiDateIgnoreTime(new Date(date));
    }

    $scope.loadMenu('menu/list');
    $scope.load('video/list');

});