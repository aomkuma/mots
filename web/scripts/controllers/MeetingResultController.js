angular.module('e-homework').controller('MeetingResultController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = 'meeting-result';

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
            $scope.loadPage('appeal/page', $scope.MenuName.id);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(){
        var params = {'meeting_type' : $scope.MeetingType};
        HTTPService.clientRequest('meeting-result/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.setMeetingType = function(index){
        $scope.MeetingType = $scope.MeetingTypeList[index].meeting_type;
        $scope.MeetingTypeIndex = index;
        $scope.loadList();
    }

    $scope.MeetingTypeList = [{'meeting_type' : 'ผลการประชุมการรับรอง'}
                            ,{'meeting_type' : 'ผลการประชุม ISO'}
                            ,{'meeting_type' : 'ผลการประชุม CODEX'}
                            ,{'meeting_type' : 'ผลการประชุม OIE'}
                            ,{'meeting_type' : 'ผลการประชุม IPPC'}
                            ,{'meeting_type' : 'ผลการประชุม APPPC'}
                            ,{'meeting_type' : 'ผลการประชุม ASEAN'}
                            ,{'meeting_type' : 'ผลการประชุม SPS/WTO'}
                        ];

    $scope.MeetingType = $scope.MeetingTypeList[0].meeting_type;
    $scope.MeetingTypeIndex = 0;
    

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();

});
