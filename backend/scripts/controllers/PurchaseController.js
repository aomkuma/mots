angular.module('e-homework').controller('PurchaseController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = $routeParams.page_type;

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
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(){
        var params = {'page_type' : $scope.page_type};
        HTTPService.clientRequest('purchase/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data){
        console.log(Data.estimate_date);
        if(Data.estimate_date != null && Data.estimate_date != undefined && Data.estimate_date != ''){
            Data.estimate_date = makeSQLDate(Data.estimate_date);
        }
        if(Data.release_date != null && Data.release_date != undefined && Data.release_date != ''){
            Data.release_date = makeSQLDate(Data.release_date);
        }

        // Data.content_th = CKEDITOR.instances.editor1.getData();
        // Data.content_en = CKEDITOR.instances.editor2.getData();

        var params = {'Data' : Data, 'AttachFileList' : Data.AttachFileList};
        HTTPService.uploadRequest('purchase/update', params).then(function(result){
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
            HTTPService.clientRequest('purchase/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.removeAttach = function(index, id){
        HTTPService.deleteRequest('attach/delete', id).then(function(result){
            $scope.Data.AttachFileList.splice(index, 1);
            IndexOverlayFactory.overlayHide();
        });
    }

    $autocompleteUserResult = [];
    $scope.searchAutoComplete = function (val, qtype){
        val = encodeURIComponent(val);
        var params = {'qtype' : qtype, 'keyword' : val};
        return HTTPService.clientRequest('autocomplete', params).then(function(result){  
          $autocompleteUserResult = result.data.DATA;
          var loop = $autocompleteUserResult.length;
          // console.log($autocompleteUserResult);
          if(loop > 0){
              var objList = [];
              for(var i = 0; i < loop; i++){
                objList.push($autocompleteUserResult[i]);
              }
              return objList;
          }else{
            return null;
          }
          
        });
    };

    $scope.autocompleteSelected = function ($item, $model, $label){
        $scope.Data = angular.copy($item);
        $scope.Data.id = '';
        $scope.Data.main_price = '';
        $scope.Data.estimate_date = null;
        $scope.Data.release_date = null;
        $scope.Data.page_type = $scope.page_type;
    }

    $scope.updateData = function(data){
        if(data != ''){
            $scope.Data = angular.copy(data);
            if($scope.Data.estimate_date != null && $scope.Data.estimate_date != undefined && $scope.Data.estimate_date != ''){
                $scope.Data.estimate_date = makeDate($scope.Data.estimate_date);
            }
            if($scope.Data.release_date != null && $scope.Data.release_date != undefined && $scope.Data.release_date != ''){
                $scope.Data.release_date = makeDate($scope.Data.release_date);
            }
        }else{
            $scope.Data = {'page_type': $scope.page_type, 'actives':'Y', 'echo_status' : 'Y', 'AttachFileList' : []};
        }

        if($scope.page_type != 'winning'){
            $scope.PAGE = 'UPDATE';
        }else{
            $scope.PAGE = 'UPDATE_WINNING';
        }
        
    }

    $scope.addFiles = function(){
        $scope.Data.AttachFileList.push({'attachFile':null});

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

    $scope.getThaiDate = function(date){
        // console.log(date);
        if(date != null || date != ''){
            return convertDateToFullThaiDateIgnoreTime(new Date(date));    
        }else{
            return '';
        }
        
    }

    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    
});
