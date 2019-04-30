angular.module('e-homework').controller('FormData1CustomerController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'customer-list';

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

    $scope.loadList = function(condition){
        
        IndexOverlayFactory.overlayShow();
        var params = {'condition' : condition, 'menu_type' : $scope.page_type};
        HTTPService.clientRequest('form-data1/customer/list', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(FormData1, FormData1Scope){
        var params = {'FormData1' : FormData1, 'form_data1_scope' : FormData1Scope};
        HTTPService.uploadRequest('form-data1/customer/update', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.PAGE = 'MAIN';
                $scope.loadList($scope.condition);
            }
            IndexOverlayFactory.overlayHide();
        });
    } 

    $scope.updateData = function(id){
        if(id != ''){
            var params = {'id' : id};
            HTTPService.clientRequest('form-data1/customer/get', params).then(function(result){
                if(result.data.STATUS == 'OK'){
                    $scope.FormData1 = result.data.DATA;
                    $scope.form_data1_scope = $scope.FormData1.form_data1_scope;

                }
                IndexOverlayFactory.overlayHide();
            });
        }else{
            $scope.FormData1 = {
                'menu_type' : $scope.page_type
                ,'actives' : 'Y'
            };

            $scope.form_data1_scope = [{'form_data1_sub_scope':[{'iso':null}]}];
            
        }
        
        $scope.PAGE = 'UPDATE';
    }

    $scope.addScope = function(index){
        $scope.form_data1_scope.unshift({
                                    'form_data1_sub_scope':[{}]
                                });
    }

    $scope.addSubScope = function(index){
        $scope.form_data1_scope[index].form_data1_sub_scope.push({
                                    'iso':null
                                });
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
    }

    $scope.condition = {'keyword':''};
    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList($scope.condition);
    

});