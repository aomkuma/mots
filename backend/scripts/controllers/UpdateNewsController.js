angular.module('e-homework').controller('UpdateNewsController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! News page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'news';

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


    $scope.addFiles = function(){
        $scope.FileList.push({'attachFile':null});
    }

    $scope.addPictures = function(){
        $scope.News.PictureList.push({'attachFile':null});
    }

    $scope.loadNewsCategoryList = function(){
        HTTPService.clientRequest('news/category/list', null).then(function(result){
            console.log(result);
            $scope.NewsCategoryList = result.data.DATA.DataList;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.News = null;
            $scope.NewsList = result.data.DATA.News;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.edit = function(data){
        $scope.loadNewsCategoryList();
        $scope.AttachFile = null;
        $scope.News = angular.copy(data);

        if($scope.News.news_date != null && $scope.News.news_date != undefined && $scope.News.news_date != ''){
            $scope.News.news_date = makeDate($scope.News.news_date);
        }

        if($scope.News.news_start_date != null && $scope.News.news_start_date != undefined && $scope.News.news_start_date != ''){
            $scope.News.news_start_date = makeDate($scope.News.news_start_date);
        }

        if($scope.News.news_end_date != null && $scope.News.news_end_date != undefined && $scope.News.news_end_date != ''){
            $scope.News.news_end_date = makeDate($scope.News.news_end_date);
        }

        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
        if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        // CKEDITOR.config.height = '400px';

        CKEDITOR.replace( 'editor2',ckEditorConfig );
        console.log($scope.News);
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        $scope.loadNewsCategoryList();
        $scope.AttachFile = null;
        $scope.News = {'actives':'Y'};
        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
        if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        // CKEDITOR.config.height = '400px';

        CKEDITOR.replace( 'editor2',ckEditorConfig );
        $scope.News = {'actives':'Y', 'show_homepage':'N','show_banner':'N','PictureList':[{'attachFile':null}]};
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancelUpdate = function(){
        $scope.FileList = [];
        $scope.AttachFile = null;
        $scope.News = null;
        $scope.PAGE = 'MAIN';
    }

    $scope.save = function(action, News, AttachFile, AttachFileList){
        // console.log($scope.News);
        IndexOverlayFactory.overlayShow();
        
        if(News.news_date != null && News.news_date != undefined && News.news_date != ''){
            News.news_date = makeSQLDate(News.news_date);
        }

        if(News.news_start_date != null && News.news_start_date != undefined && News.news_start_date != ''){
            News.news_start_date = makeSQLDate(News.news_start_date);
        }

        if(News.news_end_date != null && News.news_end_date != undefined && News.news_end_date != ''){
            News.news_end_date = makeSQLDate(News.news_end_date);
        }

        News.contents = CKEDITOR.instances.editor1.getData();
        News.contents_en = CKEDITOR.instances.editor2.getData();

        var params = {'NewsObj':News, 'AttachFile':AttachFile, 'AttachFileList':AttachFileList};
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            $scope.PAGE = 'MAIN';
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                // $scope.AttachFile = null;
                // $scope.FileList = [];
                // $scope.load('news');
                // $scope.cancelUpdate();
                window.location.reload();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.previewTemplate = function(){
        console.log('Prepare preview');
        $scope.preview = CKEDITOR.instances.editor1.getData();
        console.log($scope.preview);
        $scope.show_preview = true;

        $scope.preview_en = CKEDITOR.instances.editor2.getData();
        console.log($scope.preview_en);
        $scope.show_preview_en = true;
    }

    $scope.removeAttach = function(action, id, index, obj){
        HTTPService.deleteRequest(action, id).then(function(result){
            // $scope.load('Newss');
            obj.splice(index, 1);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.FileList = [];
    $scope.AttachFile = null;
    
    $scope.popup1 = {
        opened: false
    };

    $scope.popup2 = {
        opened: false
    };

    $scope.popup3 = {
        opened: false
    };

    $scope.open1 = function() {
        $scope.popup1.opened = true;
    };

    $scope.open2 = function() {
        $scope.popup2.opened = true;
    };

    $scope.open3 = function() {
        $scope.popup3.opened = true;
    };

    $scope.PAGE = 'MAIN';
    $scope.load('news');

});