angular.module('e-homework').controller('FormData1InspectionOperatorController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    $scope.loadIso = function(){
        HTTPService.clientRequest('form-data1/list/iso', null).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.Iso1List = result.data.DATA.List1;
                $scope.Iso2List = result.data.DATA.List2;
                $scope.Iso3List = result.data.DATA.List3;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadIsoAll = function(){
        var params = {'type' : 'all'};
        HTTPService.clientRequest('form-data1/list/iso', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.IsoList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(condition){
        var con = angular.copy(condition);
        IndexOverlayFactory.overlayShow();
        if(con.start_date != null && con.start_date != ''){
            con.start_date = makeSQLDate(con.start_date);
        }
        if(con.end_date != null && con.end_date != ''){
            con.end_date = makeSQLDate(con.end_date);
        }

        var params = {'condition' : con, 'menu_type' : 'certification-list'};
        HTTPService.clientRequest('form-data1/list', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                $scope.DataList = result.data.DATA.List;
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveData = function(FormData1, form_data1_detail){

        for(var i = 0; i < form_data1_detail.length; i++){
            if(form_data1_detail[i].start_date !== null && form_data1_detail[i].start_date !== ''){
                form_data1_detail[i].start_date = makeSQLDate(form_data1_detail[i].start_date);
            }
            if(form_data1_detail[i].end_date !== null && form_data1_detail[i].end_date !== ''){
                form_data1_detail[i].end_date = makeSQLDate(form_data1_detail[i].end_date);
            }
            console.log($scope.UsageStatusList);
            form_data1_detail[i].usage_status = $scope.UsageStatusList[i].usage_status.join();
        }

        var params = {'FormData1' : FormData1, 'form_data1_detail' : form_data1_detail};
        HTTPService.uploadRequest('form-data1/update', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.PAGE = 'MAIN';
            }
            IndexOverlayFactory.overlayHide();
        });
    } 

    $scope.saveIso = function(ISO){
        var params = {'ISO' : ISO};
        HTTPService.clientRequest('form-data1/update/iso', params).then(function(result){
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.PAGE = 'MAIN';
                $scope.loadList($scope.condition);

            }
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
            HTTPService.clientRequest('form-data1/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList($scope.condition);
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.addIso = function(){
        $scope.ISO = {'id' : '', 'iso_type' : null, 'iso_name' : ''};
        $scope.PAGE = 'ISO';
    }

    $scope.updateData = function(id){
        if(id != ''){
            var params = {'id' : id};
            HTTPService.clientRequest('form-data1/get', params).then(function(result){
                if(result.data.STATUS == 'OK'){
                    $scope.FormData1 = result.data.DATA;
                    
                    $scope.form_data1_detail = $scope.FormData1.form_data1_detail;
                    for(var i = 0; i < $scope.form_data1_detail.length; i++){
                        $scope.form_data1_detail[i].start_date = makeDate($scope.form_data1_detail[i].start_date);
                        $scope.form_data1_detail[i].end_date = makeDate($scope.form_data1_detail[i].end_date);
                        if($scope.form_data1_detail[i].usage_status !== null){
                            $scope.UsageStatusList.push({'usage_status':$scope.form_data1_detail[i].usage_status.split(',')});
                        }else{
                            $scope.UsageStatusList.push({'usage_status':[]});
                        }
                    }
                    
                }
                IndexOverlayFactory.overlayHide();
            });
        }else{
            $scope.FormData1 = {
                'menu_type' : $scope.page_type
                ,'actives' : 'Y'
            };

            $scope.form_data1_detail = [{'form_data1_scope' : [{
                                                        'form_data1_sub_scope':[{'iso':null}]
                                                        ,'form_data1_certification' : [{'certification':''}]
                                                        }
                                                ]
                                            
                                            ,'form_data1_standard_a_r_c' : [{'arc_name':''}]
                                           }
                
            ];
            console.log($scope.form_data1_detail);
            $scope.UsageStatusList = [{'usage_status':[]}];
        }

        

        $scope.loadIso();
        $scope.PAGE = 'UPDATE';
    }

    $scope.addDetail = function(){
        $scope.form_data1_detail.push({'form_data1_scope' : [{
                                                        'form_data1_sub_scope':[{'iso':null}]
                                                        ,'form_data1_certification' : [{'certification':''}]
                                                        }]
                                        ,'form_data1_standard_a_r_c' : [{'arc_name':''}]    
                                    });

        $scope.UsageStatusList.push({'usage_status':[]});
    }

    $scope.addScope = function(index){
        $scope.form_data1_detail[index].form_data1_scope.push({
                                                        'form_data1_sub_scope':[{'iso':null}]
                                                        ,'form_data1_certification' : [{'certification':''}]
                                                    });
    }

    $scope.addStandardARC = function(index){
        $scope.form_data1_detail[index].form_data1_standard_a_r_c.push({'arc_name':''});
    }

    $scope.addSubScope = function(detail_index, scope_index){
        $scope.form_data1_detail[detail_index].form_data1_scope[scope_index].form_data1_sub_scope.push({'iso':null});
    }

    $scope.addCertification = function(detail_index, scope_index){
        $scope.form_data1_detail[detail_index].form_data1_scope[scope_index].form_data1_certification.push({'certification':''});
    }

    $scope.DatePoupObj = [];
    
    $scope.openStartDateObj = function(index) {
        $scope.form_data1_detail[index].open_start_date = true;
    };

    $scope.openEndDateObj = function(index) {
        $scope.form_data1_detail[index].open_end_date = true;
    };

    $scope.toggleUsageStatus = function(index, name){
        console.log(index);
        var idx = $scope.UsageStatusList[index].usage_status.indexOf(name);

        // Is currently selected
        if (idx > -1) {
          $scope.UsageStatusList[index].usage_status.splice(idx, 1);
        }
        // Is newly selected
        else {
          $scope.UsageStatusList[index].usage_status.push(name);
        }
        console.log($scope.UsageStatusList);
    
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
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

    $scope.condition = {'keyword':'', 'iso':null};
    $scope.UsageStatusList = [];
    $scope.PAGE = 'MAIN';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList($scope.condition);
    $scope.loadIsoAll();

});