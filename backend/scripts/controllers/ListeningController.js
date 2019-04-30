angular.module('e-homework').controller('ListeningController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
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

    $scope.page_type = 'listening';

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
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadList = function(action, listening_type){
        $scope.listening_type = listening_type;
        var params = {'listening_type' : listening_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.Listening;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadComment = function(id){
        var params = {'listening_id' : id};
        HTTPService.clientRequest('listening/comment/view', params).then(function(result){
            console.log(result);
            $scope.CommentList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.save = function(action, Data, AttachFile, FileName){
        if(Data.start_date != null && Data.start_date != undefined && Data.start_date != ''){
            Data.start_date = makeSQLDate(Data.start_date);
        }
        if(Data.end_date != null && Data.end_date != undefined && Data.end_date != ''){
            Data.end_date = makeSQLDate(Data.end_date);
        }

        Data.content_th = CKEDITOR.instances.editor1.getData();
        Data.content_en = CKEDITOR.instances.editor2.getData();

        IndexOverlayFactory.overlayShow();
        // create Data obj
        var params = {'Data':Data, 'AttachFile':AttachFile, 'FileName':FileName};
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.AttachFile = {'attachFileTH':null, 'attachFileEN':null};
                $scope.FileName = {'name_th':'', 'name_en' : ''};
                $scope.loadList('listening/list' ,$scope.listening_type);
                $scope.PAGE = 'MAIN';
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.add = function(){
        $scope.Data = {'listening_type' : $scope.listening_type};
        $scope.AttachFile = {'attachFileTH':null, 'attachFileEN':null};
        $scope.FileName = {'name_th':'', 'name_en' : ''};
        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
        if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        // CKEDITOR.config.height = '400px';

        CKEDITOR.replace( 'editor2',ckEditorConfig );
        
        $scope.PAGE = 'UPDATE';
    }

    $scope.edit = function(data){
        console.log(data);
        $scope.AttachFile = {'attachFileTH':null, 'attachFileEN':null};
        $scope.Data = angular.copy(data);
        $scope.FileName = {'name_th' : '', 'name_en' : ''};
        if(data.AttachFiles.length > 0){
            $scope.FileName.name_th = data.AttachFiles[0].file_name;
        }
        // alert(data.AttachFiles.length);
        if(data.AttachFiles.length > 1){
            $scope.FileName.name_en = data.AttachFiles[1].file_name;
        }

        if($scope.Data.start_date != null && $scope.Data.start_date != undefined && $scope.Data.start_date != ''){
            $scope.Data.start_date = makeDate($scope.Data.start_date);
        }
        if($scope.Data.end_date != null && $scope.Data.end_date != undefined && $scope.Data.end_date != ''){
            $scope.Data.end_date = makeDate($scope.Data.end_date);
        }

        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
        if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        // CKEDITOR.config.height = '400px';

        CKEDITOR.replace( 'editor2',ckEditorConfig );
        
        // Load comment list
        $scope.loadComment($scope.Data.id);
        $scope.PAGE = 'UPDATE';
    }

    $scope.viewComment = function(data){
        $scope.Comment = angular.copy(data);
        $scope.comment_result = '';
        switch($scope.Comment.comment){
            case '1' : $scope.comment_result = 'เห็นชอบทุกประการ'; break;
            case '2' : $scope.comment_result = 'เห็นชอบส่วนใหญ่แต่มีข้อคิดเห็น'; break;
            case '3' : $scope.comment_result = 'ไม่ให้ความเห็นชอบ เพราะ'; break;
            case '4' : $scope.comment_result = 'ไม่ออกความเห็น'; break;
        }
        $scope.PAGE = 'COMMENT';
    }

    $scope.cancelComment = function(){
        $scope.PAGE = 'UPDATE';
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

    IndexOverlayFactory.overlayHide();
    
    $scope.PAGE = 'MAIN';
    $scope.listening_type = 'เกี่ยวกับ พ.ร.บ. มาตรฐานสินค้าเกษตร';

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    $scope.loadList('listening/list' ,$scope.listening_type);

});
