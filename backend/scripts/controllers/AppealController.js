angular.module('e-homework').controller('AppealController', function($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }

    $scope.MenuPermission =  angular.fromJson(sessionStorage.getItem('MenuPermission'));
    
    console.log('Hello ! AttachFile Multi page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'authority';

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
            $scope.Menu = $filter('MenuPermission')($scope.MenuPermission, $scope.Menu);     
            // $scope.load('menu/page/get', $scope.ID);
            
        });
    }

    $scope.loadMenu('menu/list');

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

    $scope.getMenu = function(action, menu_type){
        var params = {'menu_type' : menu_type};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.MenuName = result.data.DATA.Menu;
            console.log($scope.MenuName);
            $scope.loadList('appeal/list', $scope.condition);
            $scope.loadPage('appeal/page', $scope.MenuName[$scope.MenuName.length - 1].id);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPage = function(action, menu_id){
        var params = {'menu_id' : menu_id};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);

            if(result.data.STATUS == 'OK'){
                $scope.PageContent = result.data.DATA.Page;
                
                setTimeout(function(){
                    if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
                    if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();

                    CKEDITOR.config.extraPlugins = 'colorbutton';
                    CKEDITOR.config.colorButton_enableAutomatic = false;

                    CKEDITOR.replace( 'editor1',ckEditorConfig );
                    // CKEDITOR.config.height = '400px';

                    CKEDITOR.replace( 'editor2',ckEditorConfig );
                    console.log($scope.PageContent);
                    IndexOverlayFactory.overlayHide();
                },300);
                
            }
        });
    }

    $scope.savePage = function(action, PageObj){
        console.log($scope.PageContent);
        // console.log(CKEDITOR.instances.editor1.getData());
        
        if(CKEDITOR.instances.editor1.getData() != ''){
            PageObj.contents = CKEDITOR.instances.editor1.getData();
        }else{
            PageObj.contents = '';
        }
        if(CKEDITOR.instances.editor2.getData() != ''){
            PageObj.contents_en = CKEDITOR.instances.editor2.getData();
        }else{
            PageObj.contents_en = '';
        }
    
        var params = {'PageObj':PageObj};
        IndexOverlayFactory.overlayShow();
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                window.location.href = '#/appeal/' + $scope.page_type;
                
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.loadList = function(action, condition){
        var params = {'condition' : condition};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.DataList = result.data.DATA.List;

            // Page content
            $scope.PageContent = result.data.DATA.Page;
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

    $scope.search = function(condition){
        $scope.loadList('appeal/list', condition);
    }

    $scope.viewData = function(data){
        $scope.Data = angular.copy(data);
        $scope.PAGE = 'VIEW';
    }

    $scope.cancel = function(){
        $scope.PAGE = 'MAIN';
    }

    IndexOverlayFactory.overlayHide();
    $scope.PageContent = {
            'id':''
            ,'menu_id':''
            ,'title_th':''
            ,'title_en':''
            ,'contents':''
            ,'contents_en':''
        };
    $scope.PAGE = 'MAIN';
    $scope.FileList = [];
    $scope.YearList = getYearList(20);
    $scope.MonthList = getMonthList();
    $scope.condition = {'months':null, 'years':null, 'page_type':$scope.page_type};

    $scope.getMenu('menu/get/type' ,$scope.page_type);
    
});
