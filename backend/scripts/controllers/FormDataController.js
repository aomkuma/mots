angular.module('e-homework').controller('FormDataController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.form_generator_id = $routeParams.form_generator_id;

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
            $scope.loadList('form-data/list', $scope.condition);
            IndexOverlayFactory.overlayHide();
        });
    }


    $scope.loadList = function(){
        var params = {'condition' : $scope.condition, 'form_generator_id' : $scope.form_generator_id};
        HTTPService.clientRequest('form-data/list', params).then(function(result){
            // console.log(result);
            $scope.Form = result.data.DATA.Form;
            $scope.List = result.data.DATA.List;
            $scope.DataList = [];
            for(var i = 0; i < $scope.List.length; i++){
                $scope.DataList[i] = JSON.parse($scope.List[i].data_description);
                // console.log($scope.List[i].data_description);
            }
            console.log($scope.DataList);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data){
        
        if(Data.start_date != null && Data.start_date != undefined && Data.start_date != ''){
            Data.start_date = makeSQLDate(Data.start_date);
        }
        if(Data.end_date != null && Data.end_date != undefined && Data.end_date != ''){
            Data.end_date = makeSQLDate(Data.end_date);
        }
        var params = {'Data' : Data};
        HTTPService.uploadRequest('form-data/update', params).then(function(result){
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
            HTTPService.clientRequest('form-data/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.updateData = function(data){
        console.log(data);
        $scope.Data = {'form_generator_id' : $scope.form_generator_id};
        if(data != null){
            $scope.Data = angular.copy(data);
            if($scope.Data.start_date != null && $scope.Data.start_date != undefined && $scope.Data.start_date != ''){
                $scope.Data.start_date = makeDate($scope.Data.start_date);
            }
            if($scope.Data.end_date != null && $scope.Data.end_date != undefined && $scope.Data.end_date != ''){
                $scope.Data.end_date = makeDate($scope.Data.end_date);
            }
            
        }
        $scope.PAGE = 'UPDATE';
    }

    $scope.viewData = function(index){
        var loop = 0;
        $scope.PAGE = 'UPDATE';
        $scope.input = '';
        $scope.Data = angular.copy($scope.DataList[index]);
        angular.forEach($scope.Form, function (value, key) {
            var require = '';
            if(value.req == 'Y'){
                require = ' required="true" ';
            }
            if (value.type == "text") {
                $scope.input = $scope.input + '<div class="row form-group"> <label class="form-control-static col-lg-2">' + value.name + '</label>' +
                        ' <div class="col-lg-2"> <input class="form-control" type="' + value.type + '" maxlength="100" ng-model="Data.f' + loop + '" ' + require + '> </div></div>';
            } else  {
                $scope.input = $scope.input + '<div class="row form-group"> <label class="form-control-static col-lg-2">' + value.name + '</label>';
                angular.forEach(value.value, function (item, vkey) {
                    $scope.input = $scope.input + ' <div class="col-lg-2"> <input class="form-control " type="' + value.type + '" name="' + value.name + '" value="' + item.value + '" style="width: 1em;height: 1em;">' + item.value + ' </div>';
                });
                $scope.input = $scope.input + '</div>';
            }
            loop++;
        }); 
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

    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.form_generator_id);
    $scope.loadList();
    

});
