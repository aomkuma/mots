angular.module('e-homework').controller('OfficerContactController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.saveDep = function(Data, index){
        
        var params = {'Data' : Data};
        // IndexOverlayFactory.overlayShow();
        HTTPService.uploadRequest('officer-contact/dep/update', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.DepList[index].id = result.data.DATA.id;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.removeDepData = function(id, index){
        if(id == ''){
            $scope.DepList.splice(index, 1);
        }else{
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
                HTTPService.clientRequest('officer-contact/dep/delete', params).then(function(result){
                    // $scope.load('Datas');
                    if(result.data.STATUS == 'OK'){
                        $scope.DepList.splice(index, 1);
                    }
                    IndexOverlayFactory.overlayHide();    
                });
            });
        }
        
    }

    $scope.addDep = function(){
        var order_no = $scope.DepList.length + 1;
        $scope.DepList.unshift({'id' : '', 'dep_name_th' : '', 'dep_name_en' : '', 'order_no' : order_no});
    }

    $scope.loadOfficer = function(dep_id){
        IndexOverlayFactory.overlayShow();
            var params = {'dep_id' : dep_id};
            HTTPService.clientRequest('officer-contact/officer/list', params).then(function(result){
                // $scope.load('Datas');
                $scope.PersonList = result.data.DATA;
                if($scope.PersonList == null){
                    $scope.PersonList = [];
                }
                $scope.DEP_ID = dep_id;
                $scope.PAGE = 'PERSON';
                IndexOverlayFactory.overlayHide();
            });
    }

    $scope.saveOfficer = function(Data, index){
        var params = {'Data' : Data};
        // IndexOverlayFactory.overlayShow();
        HTTPService.uploadRequest('officer-contact/officer/update', params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.PersonList[index].id = result.data.DATA.id;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.removeOfficerData = function(id, index){
        if(id == ''){
            $scope.PersonList.splice(index, 1);
        }else{

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
                HTTPService.clientRequest('officer-contact/officer/delete', params).then(function(result){
                    // $scope.load('Datas');
                    if(result.data.STATUS == 'OK'){
                        $scope.PersonList.splice(index, 1);
                    }
                    IndexOverlayFactory.overlayHide();    
                });
            });
        }
        
    }

    $scope.addPerson = function(){
        var order_no = $scope.DepList.length + 1;
        $scope.PersonList.unshift({'id' : '', 'dep_id' : $scope.DEP_ID, 'dep_name_en' : '', 'order_no' : order_no});
    }

    $scope.DEP_ID = '';
    $scope.DepList = [];

    $scope.PAGE = 'MAIN';

    IndexOverlayFactory.overlayHide();
    $scope.loadDepList();

});
