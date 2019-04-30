angular.module('e-homework').controller('QuestionDetailController', function($scope, $compile, $cookies, $filter, $state, $sce, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }

    $scope.$parent.menu_selected = 'question';
    $scope.$parent.menu_selected_th = 'คำถามที่พบบ่อย';
    console.log('Hello ! Question Update page');

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
    $scope.$parent.question_selected = 'question';
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

    $scope.load = function(action, id){
        var params = {'id' : id};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);

            $scope.Question = result.data.DATA.Question;
            $scope.Question.question_date = makeDateTime($scope.Question.question_date);
            if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();

            CKEDITOR.config.extraPlugins = 'colorbutton';
            CKEDITOR.config.colorButton_enableAutomatic = false;

            CKEDITOR.replace( 'editor1',ckEditorConfig );
            // CKEDITOR.config.height = '400px';

            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.save = function(action, QuestionObj){
        // console.log(action, QuestionObj, PageObj, AttachFileObj, EXLinkObj);
        if(CKEDITOR.instances.editor1.getData() != ''){
            QuestionObj.question_reply = CKEDITOR.instances.editor1.getData();
        }else{
            QuestionObj.question_reply = '';
        }
        
        var params = {'QuestionObj' : QuestionObj};
        IndexOverlayFactory.overlayShow();
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                if($scope.ID == undefined && $scope.ID == null){
                    window.location.href = '#/question/detail/' + result.data.DATA.question_id;
                }else{
                    $scope.load('question/get', result.data.DATA.question_id);
                }
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.setQuestion = function(){
        $scope.Question = {
            'id' : ''
            ,'question_by' : ''
            ,'question_date' : ''
            ,'question' : ''
            ,'question_reply' : ''
            ,'question_reply_date' : ''
            ,'question_type' : ''
            ,'question_picked' : 'N'
        };
    }

    
    $scope.cancelUpdate = function(){
        window.location.href = '#/question';
    }

    $scope.popup1 = {
        opened: false
    };
    $scope.open1 = function() {
        $scope.popup1.opened = true;
    };

    $scope.setQuestion();

    if($scope.ID != undefined && $scope.ID != null){
        $scope.load('question/get', $scope.ID);
    }else{
        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        IndexOverlayFactory.overlayHide();
    }


});