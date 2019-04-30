angular.module('e-homework').controller('SeminarController', function($scope, $compile, $cookies, $filter, $state, $routeParams, $uibModal, HTTPService, IndexOverlayFactory) {
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

    var ckEditorConfig = {
                            extraPlugins: 'uploadimage,image2,filebrowser,colorbutton',
                            height: 300,
                            uploadUrl: '/acfs/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
                            filebrowserBrowseUrl: '/acfs/ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl: '/acfs/ckfinder/ckfinder.html?type=Images',
                            filebrowserUploadUrl: '/acfs/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
                            filebrowserImageUploadUrl: '/acfs/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
                            contentsCss: [ CKEDITOR.basePath + 'contents.css', 'https://sdk.ckeditor.com/samples/assets/css/widgetstyles.css' ],
                            image2_alignClasses: [ 'image-align-left', 'image-align-center', 'image-align-right' ],
                            image2_disableResizer: true,
                            height:'400px',
                            toolbar : [
                                { name: 'document', items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
                                { name: 'clipboard', items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
                                { name: 'editing', items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
                                { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
                                '/',
                                { name: 'basicstyles', items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
                                { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
                                { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
                                { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
                                '/',
                                { name: 'styles', items: [ 'Styles', 'Format', 'Font', 'FontSize' ] },
                                { name: 'colors', items: [ 'TextColor', 'BGColor' ] },
                                { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
                                { name: 'Page', items: [ 'Page' ] }
                            ]

                        };

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
            $scope.loadList('seminar/list', $scope.condition);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(){
        var params = {'page_type' : $scope.page_type};
        HTTPService.clientRequest('seminar/list', params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadResponseList = function(){

    }

    $scope.saveData = function(Data, ScheduleFile, ParticipantFile){

        if(Data.start_date != null && Data.start_date != undefined && Data.start_date != ''){
            Data.start_date = makeSQLDate(Data.start_date);
        }
        if(Data.end_date != null && Data.end_date != undefined && Data.end_date != ''){
            Data.end_date = makeSQLDate(Data.end_date);
        }

        Data.content_th = CKEDITOR.instances.editor1.getData();
        Data.content_en = CKEDITOR.instances.editor2.getData();

        var params = {'Data' : Data, 'ScheduleFile' : ScheduleFile, 'ParticipantFile' : ParticipantFile};
        HTTPService.uploadRequest('seminar/update', params).then(function(result){
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
            HTTPService.clientRequest('seminar/delete', params).then(function(result){
                // $scope.load('Datas');
                $scope.loadList();
                IndexOverlayFactory.overlayHide();
            });
        });
        
    }

    $scope.updateData = function(data){
        if(data != null){
            $scope.Data = angular.copy(data);
            if($scope.Data.start_date != null && $scope.Data.start_date != undefined && $scope.Data.start_date != ''){
                $scope.Data.start_date = makeDate($scope.Data.start_date);
            }
            if($scope.Data.end_date != null && $scope.Data.end_date != undefined && $scope.Data.end_date != ''){
                $scope.Data.end_date = makeDate($scope.Data.end_date);
            }
        }else{
            $scope.Data = {'page_type': $scope.page_type, 'accommodation' : 'ไม่มีที่พัก', 'actives':'Y'};
        }

        $scope.ScheduleFile = {'attachFileTH' : null, 'attachFileEN' : null};
        $scope.ParticipantFile = {'attachFileTH' : null, 'attachFileEN' : null};

        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
        if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        // CKEDITOR.config.height = '400px';

        CKEDITOR.replace( 'editor2',ckEditorConfig );
        console.log($scope.Data);
        $scope.PAGE = 'UPDATE';
    }

    $scope.viewResponseList = function(id){
        var params = {'seminar_id' : id};
        HTTPService.clientRequest('seminar/response/list', params).then(function(result){
            $scope.ResponseList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
        $scope.PAGE = 'VIEW_RESPONSE_LIST';
    }

    $scope.viewResponseDetail = function(data){
        $scope.Detail = angular.copy(data);
        if($scope.Detail.start_date != null && $scope.Detail.start_date != undefined && $scope.Detail.start_date != ''){
            $scope.Detail.start_date = makeDate($scope.Detail.start_date);
        }
        if($scope.Detail.end_date != null && $scope.Detail.end_date != undefined && $scope.Detail.end_date != ''){
            $scope.Detail.end_date = makeDate($scope.Detail.end_date);
        }
        $scope.PAGE = 'VIEW_RESPONSE_DETAIL';
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

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList();
    
});
