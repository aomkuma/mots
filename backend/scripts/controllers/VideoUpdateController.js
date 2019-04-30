angular.module('e-homework').controller('VideoUpdateController', function($scope, $compile, $cookies, $filter, $state, $sce, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }

    $scope.$parent.menu_selected = 'video';
    $scope.$parent.menu_selected_th = 'วีดีโอ';
    console.log('Hello ! Video Update page');

    var ckEditorConfig = {
                            extraPlugins: 'uploadimage,image2,filebrowser,colorbutton',
                            height: 300,
                            uploadUrl: '/mots/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
                            filebrowserBrowseUrl: '/mots/ckfinder/ckfinder.html',
                            filebrowserImageBrowseUrl: '/mots/ckfinder/ckfinder.html?type=Images',
                            filebrowserUploadUrl: '/mots/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
                            filebrowserImageUploadUrl: '/mots/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
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

    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.video_selected = 'video';
    $scope.ID = $routeParams.id;

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

    $scope.trustUrl = function(){
        $scope.previewVideo = $sce.trustAsResourceUrl($scope.Video.video_url);
        $("#video_frame").prop('src', $scope.previewVideo);
        
    }

    $scope.load = function(action, id){
        var params = {'id' : id};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);

            $scope.Video = result.data.DATA.Video;
            $scope.Video.video_date = makeDate($scope.Video.video_date);
            $scope.trustUrl();

            if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
            if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

            CKEDITOR.config.extraPlugins = 'colorbutton';
            CKEDITOR.config.colorButton_enableAutomatic = false;

            CKEDITOR.replace( 'editor1',ckEditorConfig );
            // CKEDITOR.config.height = '400px';

            CKEDITOR.replace( 'editor2',ckEditorConfig );

            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.save = function(action, VideoObj){
        // console.log(action, VideoObj, PageObj, AttachFileObj, EXLinkObj);
        if(CKEDITOR.instances.editor1.getData() != ''){
            VideoObj.video_content_th = CKEDITOR.instances.editor1.getData();
        }else{
            VideoObj.video_content_th = '';
        }
        if(CKEDITOR.instances.editor2.getData() != ''){
            VideoObj.video_content_en = CKEDITOR.instances.editor2.getData();
        }else{
            VideoObj.video_content_en = '';
        }
        var params = {'VideoObj' : VideoObj};
        IndexOverlayFactory.overlayShow();
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                if($scope.ID == undefined && $scope.ID == null){
                    window.location.href = '#/video/' + result.data.DATA.video_id;
                }else{
                    $scope.load('video/get', result.data.DATA.video_id);
                }
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    
    $scope.cancelUpdate = function(){
        window.location.href = '#/video';
    }

    $scope.setVideo = function(){
        $scope.Video = {
            'id':''
            ,'video_url':''
            ,'video_date':''
            ,'visit_count':''
            ,'actives':'Y'
            ,'video_caption_th':''
            ,'video_content_th':''
            ,'video_caption_en':''
            ,'video_content_en':''
        };
    }

    $scope.popup1 = {
        opened: false
    };
    $scope.open1 = function() {
        $scope.popup1.opened = true;
    };

    $scope.previewVideo = '';
    $scope.setVideo();
    if($scope.ID != undefined && $scope.ID != null){
        $scope.load('video/get', $scope.ID);
    }else{
        IndexOverlayFactory.overlayHide();
    }


});