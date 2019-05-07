angular.module('e-homework').controller('AttachFileMulti3Controller', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    $scope.page_type = $routeParams.page_type;

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

    $scope.loadMasterList = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MasterList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadDataList = function(action, menu_type, condition){
        var params = {'menu_type' : menu_type, 'condition' : condition, 'actives' : 'Y', 'file_type' : $scope.FileType};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.search = function(condition){
        $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type, condition);
    }

    $scope.getThaiDate = function(date){
        return convertDateToFullThaiDateIgnoreTime(new Date(date));
    }

    $scope.setFileType = function(index){
        $scope.FileType = $scope.FileTypeList[index].file_type;
        $scope.FileTypeIndex = index;
        console.log($scope.FileTypeIndex);
        $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type, $scope.condition);
    }

    $scope.findExtension = function(filename){
        return (/[.]/.exec(filename)) ? /[^.]+$/.exec(filename)[0] : '';
    }

    IndexOverlayFactory.overlayHide();
    $scope.FileList = [];
    $scope.FileTypeList = [{'file_type' : 'รายละเอียดโครงการ'}
                                ,{'file_type' : 'แบบฟอร์มต่างๆ'}
                                ,{'file_type' : 'ตัวอย่างเอกสาร'}
                                ,{'file_type' : 'ภาพกิจกรรม'}
                                ,{'file_type' : 'ถามตอบ'}
                            ];
    $scope.FileTypeIndex = 0;
    console.log($scope.FileTypeIndex);
    $scope.FileType = $scope.FileTypeList[0].file_type;
    
    $scope.loadMenu('menu/list');
    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type, null);
    $scope.loadMasterList('attachfile-multi/get/master' ,$scope.page_type);

});
