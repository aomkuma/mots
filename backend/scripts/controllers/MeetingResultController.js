angular.module('e-homework').controller('MeetingResultController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'meeting-result';

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
    
    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            $scope.loadList('meeting-result/list', $scope.condition);
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

    $scope.saveData = function(Data, AttachFileTH, AttachFileEN){
        console.log(Data.meeting_start_date);
        if(Data.meeting_start_date != null && Data.meeting_start_date != undefined && Data.meeting_start_date != ''){
            $scope.Data.meeting_start_date = makeSQLDate(Data.meeting_start_date);
        }
        if(Data.meeting_end_date != null && Data.meeting_end_date != undefined && Data.meeting_end_date != ''){
            Data.meeting_end_date = makeSQLDate(Data.meeting_end_date);
        }

        var params = {'Data' : Data, 'AttachFileTH' : AttachFileTH, 'AttachFileEN' : AttachFileEN};
        HTTPService.uploadRequest('meeting-result/update', params).then(function(result){
            alert('บันทึกสำเร็จ');
            $scope.loadList();
            $scope.PAGE = 'MAIN';
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.removeData = function(id){
        $scope.alertMessage = 'ต้องการลบข้อมูลนี้ ใช่หรือไม่ ?';
        var modalInstance = $uibModal.open({
            animation : true,
            templateUrl : 'views/dialog_confirm.html',
            size : 'sm',
            scope : $scope,
            backdrop : 'static',
            controller : 'ModalDialogCtrl',
            resolve : {
                params : function() {
                    return {};
                } 
            },
        });

        modalInstance.result.then(function (valResult) {
            IndexOverlayFactory.overlayShow();
            var params = {'id' : id};
            HTTPService.clientRequest('meeting-result/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.updateData = function(data){
        if(data != null){
            $scope.Data = angular.copy(data);

            if($scope.Data.meeting_start_date != null && $scope.Data.meeting_start_date != undefined && $scope.Data.meeting_start_date != ''){
                $scope.Data.meeting_start_date = makeDate($scope.Data.meeting_start_date);
            }
            if($scope.Data.meeting_end_date != null && $scope.Data.meeting_end_date != undefined && $scope.Data.meeting_end_date != ''){
                $scope.Data.meeting_end_date = makeDate($scope.Data.meeting_end_date);
            }
        }else{
            $scope.Data = {'meeting_type': $scope.MeetingType, 'actives':'Y'};
        }

        $scope.AttachFileTH = null;
        $scope.AttachFileEN = null;
        $scope.PAGE = 'UPDATE';
    }

    $scope.setMeetingType = function(index){
        $scope.MeetingType = $scope.MeetingTypeList[index].meeting_type;
        $scope.MeetingTypeIndex = index;
        $scope.loadList();
    }

    $scope.cancel = function(page){
        $scope.PAGE = page;
    }

    $scope.popup1 = {
        opened: false
    };

    $scope.popup2 = {
        opened: false
    };

    $scope.open1 = function() {
        $scope.popup1.opened = true;
    };

    $scope.open2 = function() {
        $scope.popup2.opened = true;
    };

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
    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    
});
