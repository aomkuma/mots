angular.module('e-homework').controller('FormDataController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.form_generator_id = $routeParams.form_generator_id;

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
    
    $scope.loadList = function(){
        var params = {'keyword' : $scope.keyword, 'form_generator_id' : $scope.form_generator_id};
        HTTPService.clientRequest('form-data/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            $scope.Form = result.data.DATA.Form;
            var loop = 0;
            $scope.input = '';
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

            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(Data){

        var params = {'Data' : Data, 'form_generator_id' : $scope.form_generator_id};
        HTTPService.clientRequest('form-data/update', params).then(function(result){
            alert('บันทึกข้อมูลสำเร็จ');
            window.location.href = '#/';
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

    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.form_generator_id);
    $scope.loadList();
    

});
