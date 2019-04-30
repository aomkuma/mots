angular.module('e-homework').controller('ProjectController', function($scope, $compile, $cookies, $filter, $state, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! Project page');
	$scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'Project';

    var ckEditorConfig = {
            extraPlugins: 'uploadimage,image2,filebrowser,colorbutton',
            height: 300,
            uploadUrl: '/CIOCore/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
            filebrowserBrowseUrl: '/CIOCore/ckfinder/ckfinder.html',
            filebrowserImageBrowseUrl: '/CIOCore/ckfinder/ckfinder.html?type=Images',
            filebrowserUploadUrl: '/CIOCore/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl: '/CIOCore/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
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
                { name: 'about', items: [ 'About' ] }
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

    $scope.previewTemplate = function(){
        console.log('Prepare preview');
        $scope.preview = CKEDITOR.instances.editor1.getData();
        console.log($scope.preview);
        $scope.show_preview = true;

        $scope.preview_en = CKEDITOR.instances.editor2.getData();
        console.log($scope.preview_en);
        $scope.show_preview_en = true;
    }

    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.ProjectList = result.data.DATA.Project;
            
            IndexOverlayFactory.overlayHide();

        });
    }

    $scope.save = function(action, ProjectObj, AttachFileObj){
        // console.log($scope.Project);
        IndexOverlayFactory.overlayShow();
        ProjectObj.contents = CKEDITOR.instances.editor1.getData();
        ProjectObj.contents_en = CKEDITOR.instances.editor2.getData();

        var params = {'ProjectObj':ProjectObj, 'AttachFileObj':AttachFileObj};
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            if(result.data.STATUS == 'OK'){
                $scope.FileList = [];
                $scope.load('projects');
                $scope.cancelUpdate();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.removeAttach = function(action, id, index){
        HTTPService.deleteRequest(action, id).then(function(result){
            $scope.load('projects');
            $scope.Project.AttachFiles.splice(index, 1);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.edit = function(data){
        $scope.AttachFile = null;
        if(data != null){
            $scope.Project = angular.copy(data);
        }
        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();
        if (CKEDITOR.instances.editor2) CKEDITOR.instances.editor2.destroy();
        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1', ckEditorConfig);
        CKEDITOR.config.height = '400px';

        CKEDITOR.replace( 'editor2', ckEditorConfig);
        CKEDITOR.config.height = '400px';
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancelUpdate = function(){
        $scope.FileList = [];
        $scope.AttachFile = null;
        $scope.Project = null;
        $scope.PAGE = 'MAIN';
    }

    $scope.YearList = genYearList();
    $scope.FileList = [];
    $scope.Project = {'contents':null, 'project_year':0};
    $scope.PAGE = 'MAIN';

    $scope.load('projects');

    function genYearList(){
        var d = new Date();
        var year = d.getFullYear();
        var yearList = [{'value':0,'text':'กรุณาเลือก'}];
        for(var i = 0; i < 10; i++){
            var y = (year - i) + 543;
            yearList.push({'value': y, 'text' : y});
        }
        return yearList;
    }

});