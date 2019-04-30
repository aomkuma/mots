angular.module('e-homework').controller('HomeController', function($scope, $cookies, $filter, $state, $uibModal, $routeParams, HTTPService, IndexOverlayFactory) {
	//console.log('Hello !');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.menu_selected = 'home';
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }

    $scope.page_type = $routeParams.page_type;

    $scope.MenuPermission =  angular.fromJson(sessionStorage.getItem('MenuPermission'));

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
            // filter menu
            // console.log($scope.MenuPermission);
            $scope.Menu = $filter('MenuPermission')($scope.MenuPermission, $scope.Menu);     
            console.log($scope.Menu);
        });
    }

    $scope.loadMenu('menu/list');

    $scope.load = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            console.log(result);
            $scope.SlideShow = null;
            $scope.SlideShowList = result.data.DATA.SlideShow;
            console.log($scope.SlideShowList);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.edit = function(data){
        $scope.AttachFile = null;
        $scope.SlideShow = angular.copy(data);
        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        $scope.PAGE = 'UPDATE';
    }

    $scope.add = function(){
        $scope.AttachFile = null;
        $scope.SlideShow = {'actives':'Y'};

        if (CKEDITOR.instances.editor1) CKEDITOR.instances.editor1.destroy();

        CKEDITOR.config.extraPlugins = 'colorbutton';
        CKEDITOR.config.colorButton_enableAutomatic = false;

        CKEDITOR.replace( 'editor1',ckEditorConfig );
        $scope.PAGE = 'UPDATE';
    }

    $scope.cancelUpdate = function(){
        $scope.AttachFile = null;
        $scope.SlideShow = null;
        $scope.PAGE = 'MAIN';
        $scope.UPDATE_PAGE = '';
    }

    $scope.save = function(action, SlideShow, AttachFile){
        // console.log($scope.SlideShow);
        //IndexOverlayFactory.overlayShow();
        SlideShow.text_desc = CKEDITOR.instances.editor1.getData();
        var params = {'SlideShowObj':SlideShow, 'AttachFileObj':AttachFile};
        HTTPService.uploadRequest(action, params).then(function(result){
            console.log(result);
            $scope.PAGE = 'MAIN';
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.AttachFile = null;
                $scope.load('slideshow');
                $scope.cancelUpdate();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.remove = function(action, id){
        $scope.alertMessage = 'ต้องการลบ slide นี้ ใช่หรือไม่ ?';
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
            HTTPService.deleteRequest(action, id).then(function(result){
            // $scope.load('SlideShows');
            $scope.load('slideshow');
            IndexOverlayFactory.overlayHide();
        });
        });
        
    }

    $scope.AttachFile = null;
    $scope.SlideShow = null;

    $scope.PAGE = 'MAIN';
    $scope.load('slideshow');

    // Link Footer

    $scope.loadFooterLink = function(){
        $scope.setFooterLink();
        HTTPService.clientRequest('footer-link/list', null).then(function(result){
            console.log(result);
            $scope.FooterLinkList = result.data.DATA.List;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.saveFooterLink = function(Data){
        var params = {'Data':Data};
        HTTPService.clientRequest('footer-link/update', params).then(function(result){
            console.log(result);
            $scope.PAGE = 'MAIN';
            if(result.data.STATUS == 'OK'){
                alert('บันทึกสำเร็จ');
                $scope.loadFooterLink();
                $scope.cancelUpdate();
                IndexOverlayFactory.overlayHide();
            }else{
                IndexOverlayFactory.overlayHide();
            }
        });
    }

    $scope.removeFooterLink = function(id){
        $scope.alertMessage = 'ต้องการลบ link นี้ ใช่หรือไม่ ?';
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
            HTTPService.clientRequest('footer-link/delete', {'id':id}).then(function(result){
            // $scope.load('SlideShows');
            $scope.loadFooterLink();
            IndexOverlayFactory.overlayHide();
        });
        });
        
    }

    $scope.updateFooterLink = function(data){
        $scope.UPDATE_PAGE = 'UPDATE';
        $scope.FooterLink = angular.copy(data);
    }

    $scope.setFooterLink = function(){
        $scope.FooterLink = {'id':'', 'link_type' : '', 'link_name' : '', 'link_url' : ''};
    }

    $scope.updateData = function(){
          $scope.UPDATE_PAGE = 'UPDATE';
    }

    $scope.UPDATE_PAGE = '';
    $scope.loadFooterLink();

});