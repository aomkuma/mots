angular.module('e-homework').controller('FormDetailController', function ($scope, $compile, $cookies, $filter, $state, $routeParams, HTTPService, IndexOverlayFactory) {
    IndexOverlayFactory.overlayShow();

    var $user_session = sessionStorage.getItem('user_session');

    if ($user_session != null) {
        $scope.$parent.currentUser = angular.fromJson($user_session);
    } else {
        window.location.replace('#/guest/logon');
    }

    $scope.MenuPermission = angular.fromJson(sessionStorage.getItem('MenuPermission'));

    console.log('Hello ! formgenD');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'authority';

    $scope.page_type = $routeParams.page_type;

    $scope.loadMenu = function (action) {
        HTTPService.clientRequest(action, null).then(function (result) {
            //console.log(result);
            $scope.Menu = result.data.DATA.Menu;
            IndexOverlayFactory.overlayHide();
            $(document).ready(function () {
                // console.log('asd');
                $('a.test').on("click", function (e) {
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
        contentsCss: [CKEDITOR.basePath + 'contents.css', 'https://sdk.ckeditor.com/samples/assets/css/widgetstyles.css'],
        image2_alignClasses: ['image-align-left', 'image-align-center', 'image-align-right'],
        image2_disableResizer: true,
        height: '400px',
        toolbar: [
            {name: 'document', items: ['Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates']},
            {name: 'clipboard', items: ['Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo']},
            {name: 'editing', items: ['Find', 'Replace', '-', 'SelectAll', '-', 'Scayt']},
            {name: 'forms', items: ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField']},
            '/',
            {name: 'basicstyles', items: ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat']},
            {name: 'paragraph', items: ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language']},
            {name: 'links', items: ['Link', 'Unlink', 'Anchor']},
            {name: 'insert', items: ['Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe']},
            '/',
            {name: 'styles', items: ['Styles', 'Format', 'Font', 'FontSize']},
            {name: 'colors', items: ['TextColor', 'BGColor']},
            {name: 'tools', items: ['Maximize', 'ShowBlocks']},
            {name: 'Page', items: ['Page']}
        ]

    };
    $scope.save = function (action, Data, FileList) {

        IndexOverlayFactory.overlayShow();
        $scope.Data.start_date = makeSQLDate($scope.Data.start_date);
        $scope.Data.end_date = makeSQLDate($scope.Data.end_date);
        var params = {'Data': Data, 'FileList': FileList};

        HTTPService.uploadRequest(action, params).then(function (result) {
            console.log(result);
            if (result.data.STATUS == 'OK') {
                alert('บันทึกสำเร็จ');
//                $scope.FileList = [];
//                $scope.addFiles();
//                $scope.loadDataList('attachfile-multi/get/type' ,$scope.page_type);
//                $scope.PAGE = 'MAIN';
                window.location.replace('#/form-generator/');
                IndexOverlayFactory.overlayHide();
            } else {
                IndexOverlayFactory.overlayHide();
            }
        });
    }
    $scope.getMenu = function (action, menu_type) {
        var params = {'menu_type': menu_type};
        HTTPService.clientRequest(action, params).then(function (result) {

            $scope.MenuName = result.data.DATA.Menu;

            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPage = function (action, menu_id) {
        var params = {'menu_id': menu_id};
        HTTPService.clientRequest(action, params).then(function (result) {
            //console.log(result);

            if (result.data.STATUS == 'OK') {
                $scope.PageContent = result.data.DATA.Page;



            }
        });
    }



    $scope.loadDetail = function (action) {

        HTTPService.clientRequest(action).then(function (result) {
            console.log(result);
            $scope.DataList = result.data.DATA;

            IndexOverlayFactory.overlayHide();
        });
    }



    $scope.viewData = function (data) {
        $scope.Data = angular.copy(data);
        $scope.PAGE = 'VIEW';
    }
    $scope.popup1 = {
        opened: false
    };
    $scope.open1 = function () {
        $scope.popup1.opened = true;
    };
    $scope.popup2 = {
        opened: false
    };
    $scope.open2 = function () {
        $scope.popup2.opened = true;
    };
    $scope.cancel = function () {
        $scope.PAGE = 'MAIN';
    }
    $scope.id = $routeParams.id;

    IndexOverlayFactory.overlayHide();
    $scope.PageContent = {
        'id': ''
        , 'menu_id': ''
        , 'title_th': ''
        , 'title_en': ''
        , 'contents': ''
        , 'contents_en': ''
    };
    $scope.PAGE = 'MAIN';
    $scope.FileList = [{'form_generetor_id': '', 'value': []
        }];

    //  $scope.loadList('form-generator');

    $scope.getMenu('menu/get/type', $scope.page_type);
    $scope.addvalue = function (index) {
        $scope.FileList[index].value.push({
        });
    }
    $scope.delvalue = function (key, index) {
        $scope.FileList[key].value.splice(index, 1)
    }
    $scope.addinput = function () {
        $scope.FileList.push({'form_generetor_id': '', 'value': []
        });
    }
    $scope.delinput = function (index) {
        $scope.FileList.splice(index, 1)
    }
    $scope.back = function () {
        $scope.PAGE = 'MAIN';
    }
    $scope.preview = function (Data, FileList) {
        $scope.PAGE = 'PREVIEW';
        $scope.input = '<h3 class="row form-group text-center">' + Data.form_name + '</h3>';
        angular.forEach(FileList, function (value, key) {
            if (value.type == "text") {
                $scope.input = $scope.input + '<div class="row form-group"> <label class="form-control-static col-lg-2">' + value.name + '</label>' +
                        ' <div class="col-lg-2"> <input class="form-control" type="' + value.type + '" maxlength="100"> </div></div>';
            } else  {
                $scope.input = $scope.input + '<div class="row form-group"> <label class="form-control-static col-lg-2">' + value.name + '</label>';
                angular.forEach(value.value, function (item, vkey) {
                    $scope.input = $scope.input + ' <div class="col-lg-2"> <input class="form-control " type="' + value.type + '" name="' + value.name + '" value="' + item.value + '" style="width: 1em;height: 1em;">' + item.value + ' </div>';
                });
                $scope.input = $scope.input + '</div>';
            }
        });
    }
    $scope.checkoption = function (type, key) {
        console.log(type[key].type);
        $scope.ck = 'show' + key;
    }

    // Drag & drop zone

//    $scope.$watch('models', function(models) {
//        $scope.modelAsJson = angular.toJson(models, true);
//    }, true);
//
//    $scope.models = {selected: null,
//        FileList: {}
//    };


    /////
    if ($scope.id != undefined && $scope.id != null && $scope.id != '') {
        var params = {'id': $scope.id};
        HTTPService.clientRequest('form-generator/listdetail', params).then(function (result) {
            
            $scope.Data = result.data.DATA.form;
            $scope.FileList = result.data.DATA.item;
console.log($scope.FileList);
            $scope.Data.start_date = makeDate($scope.Data.start_date);
            $scope.Data.end_date = makeDate($scope.Data.end_date);
            IndexOverlayFactory.overlayHide();
        });
    }

});
