angular.module('e-homework').controller('MainController', function($scope, $cookies, $filter, $state, $sce, $uibModal, HTTPService, IndexOverlayFactory) {
	IndexOverlayFactory.overlayShow();
    var $user_session = sessionStorage.getItem('user_session');
    
    if($user_session != null){
        $scope.$parent.currentUser = angular.fromJson($user_session);
    }else{
       window.location.replace('#/guest/logon');
    }
    console.log('Hello ! Palace page');
    $scope.DEFAULT_LANGUAGE = 'TH';
    $scope.$parent.menu_selected = 'palace';

    console.log('Hello ! Palace page ' + $scope.palace_type);

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


    // Drag & drop zone

    $scope.$watch('model', function(model) {
        $scope.modelAsJson = angular.toJson(model, true);
    }, true);

    $scope.model = {selected: null,
        main_content_list: {"MainContentList": []}
    };

    $scope.dropCallback = function(Data){
        // DataList.splice($index, 1);
        // alert('Drop!' + index);
        // return ;
        var params = {'Data' : Data};
        HTTPService.clientRequest('manage-main/update', params).then(function (result) {
            if (result.data.STATUS == 'OK') {
               $scope.loadMainContent(false);
            }
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadMainContent = function(reload){
        HTTPService.clientRequest('manage-main/list', null).then(function(result){
            //console.log(result);
            $scope.model.main_content_list.MainContentList = result.data.DATA;
            if(reload){
                $scope.loadSlide('slideshow/view');
                $scope.loadPalace('palaces/get/minister');
                $scope.loadLinkUrl('linkurl');
                $scope.loadNews('news/home');
                $scope.loadVideo('video/list');
            }
        });
    }

    $scope.loadMenuFavourite = function(){
        
        var params = {'user_session' : $scope.currentUser};
        HTTPService.clientRequest('menu/get/favourite', params).then(function(result){
            //console.log(result);
            $scope.HighlightList = result.data.DATA.Menu;
            $scope.slideImage($scope.next_index);
        });
    }

    $scope.loadFooterLink = function(){
        
        HTTPService.clientRequest('footer-link/list/view', null).then(function(result){
            //console.log(result);
            $scope.FooterLinkList = result.data.DATA.List;
        });
    }

    $scope.loadSlide = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            //console.log(result);
            $scope.slides = result.data.DATA.SlideShow;
            IndexOverlayFactory.overlayHide();
            setTimeout(showSlides, 1000);
        });
    }

    $scope.loadVideo = function(action){
        var params = {'actives' : 'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);
            $scope.Video = result.data.DATA.VideoList;
            setTimeout(function(){
                for(var i=0; i < $scope.Video.length; i++){
                    $videoSrc = $sce.trustAsResourceUrl($scope.Video[i].video_url);
                    $("#video" + i).prop('src', $videoSrc);
                    console.log($("#video" + i).attr('src'));
                }
            }, 500);
            
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadLinkUrl = function(action){
        HTTPService.clientRequest(action, null).then(function(result){
            // console.log(result);
            $scope.LinkUrl = result.data.DATA.LinkUrl;
            $scope.slideLinkImage($scope.link_next_index);
            IndexOverlayFactory.overlayHide();
        });
    }

    // $scope.loadNews = function(action){
    //     var params = null;
    //     HTTPService.clientRequest(action, params).then(function(result){
    //         // console.log(result);
    //         $scope.NewsList1 = result.data.DATA.NewsList1;
    //         setTimeout(function(){
    //             for(var i = 0; i < $scope.NewsList1.length; i++){
    //                 // console.log('do iframe');
    //                 $("#if" + i).prop('src', 'https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F61.19.221.109%2Facfs%2Fweb%2F%23%2Fnews%2Fdetail%2F'+$scope.NewsList1[i].id+'%2F&layout=button&size=small&mobile_iframe=true&appId=190072441615269&width=59&height=20');
    //             }
    //         }, 200);
    //         IndexOverlayFactory.overlayHide();
    //     });
    // }

    $scope.loadNews = function(action){
        var currentDate = makeSQLDate(new Date());
        var params = {'currentDate' : currentDate};
        HTTPService.clientRequest(action, params).then(function(result){
            console.log(result);
            $scope.NewsList1 = result.data.DATA.NewsList1;
            $scope.NewsList2 = result.data.DATA.NewsList2;
            $scope.NewsList3 = result.data.DATA.NewsList3;
            $scope.NewsList4 = result.data.DATA.NewsList4;
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadVideo = function(action){
        var params = {'actives' : 'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            //console.log(result);
            $scope.Video = result.data.DATA.VideoList;
            setTimeout(function(){
                for(var i=0; i < $scope.Video.length; i++){
                    $videoSrc = $sce.trustAsResourceUrl($scope.Video[i].video_url);
                    $("#video" + i).prop('src', $videoSrc);
                    console.log($("#video" + i).attr('src'));
                }
            }, 500);
            
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPurchase = function(action){
        var params = {'page_type' : '', 'actives' : 'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            // console.log(result);
            $scope.NewsList1 = result.data.DATA.List;
            // setTimeout(function(){
            //     for(var i = 0; i < $scope.NewsList1.length; i++){
            //         console.log('do iframe');
            //         $("#if" + i).prop('src', 'https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F61.19.221.109%2Facfs%2Fweb%2F%23%2Fnews%2Fdetail%2F'+$scope.NewsList1[i].id+'%2F&layout=button&size=small&mobile_iframe=true&appId=190072441615269&width=59&height=20');
            //     }
            // }, 200);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadPalace = function(action){
        var params = {'position_th' : 'รัฐมนตรีว่าการกระทรวงการท่องเที่ยวและกีฬา'};
        HTTPService.clientRequest(action, params).then(function(result){
            // console.log(result);
            $scope.Palace = result.data.DATA.Palace;
            // setTimeout(function(){
            //     for(var i = 0; i < $scope.NewsList1.length; i++){
            //         console.log('do iframe');
            //         $("#if" + i).prop('src', 'https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F61.19.221.109%2Facfs%2Fweb%2F%23%2Fnews%2Fdetail%2F'+$scope.NewsList1[i].id+'%2F&layout=button&size=small&mobile_iframe=true&appId=190072441615269&width=59&height=20');
            //     }
            // }, 200);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.loadWorkApplication = function(action){
        var params = {'menu_type' : 'work-application', 'actives' : 'Y'};
        HTTPService.clientRequest(action, params).then(function(result){
            // console.log(result);
            $scope.NewsList1 = result.data.DATA.DataList;
            // setTimeout(function(){
            //     for(var i = 0; i < $scope.NewsList1.length; i++){
            //         console.log('do iframe');
            //         $("#if" + i).prop('src', 'https://www.facebook.com/plugins/share_button.php?href=http%3A%2F%2F61.19.221.109%2Facfs%2Fweb%2F%23%2Fnews%2Fdetail%2F'+$scope.NewsList1[i].id+'%2F&layout=button&size=small&mobile_iframe=true&appId=190072441615269&width=59&height=20');
            //     }
            // }, 200);
            IndexOverlayFactory.overlayHide();
        });
    }

    $scope.checkFormat = function(format){
        if(format.indexOf('video') > -1){
            return true;
        }else{
            return false;
        }
    }

    $scope.getThaiDate = function(date){
        // console.log('check date :'+date);
        if(date != undefined){
            var splitDate = date.split(' ');
            return convertDateToFullThaiDateIgnoreTime(new Date(splitDate[0]));
        }
    }

    $scope.goNewsList = function(news_type){
        window.location.href = '#/news/'+news_type;
    }

    $scope.goVideoList = function(){
        window.location.href = '#/video';
    }

    $scope.goPage = function(url){
        window.location.href=url;
    }

    $scope.visibleLinkFooter = function(){
        if($scope.ShowLinkFooter){
            $scope.ShowLinkFooter = false;
        }else{
            $scope.ShowLinkFooter = true;
        }
    }

    $scope.viewPurchaseDetail = function(data){
        $scope.Detail = angular.copy(data);
        $scope.page_type = $scope.Detail.page_type;
        var modalInstance = $uibModal.open({
            animation : false,
            templateUrl : 'purchase-detail.html',
            size : 'lg',
            scope : $scope,
            controller : 'ModalDialogCtrl',
            resolve : {
                params : function() {
                    return {};
                } 
            },
        });

        modalInstance.result.then(function (valResult) {
            
        });
    }

    $scope.viewNews = function(NewsType){
        $scope.NewsType = NewsType;
        if(NewsType == 'news'){
            $scope.loadNews('news/home');
        }else if(NewsType == 'purchase'){
            $scope.loadPurchase('purchase/list');
        }else if(NewsType == 'work-application'){
            $scope.loadWorkApplication('attachfile-multi/get/type');
        }
    }

    $scope.NewsType = 'news';
    $scope.ShowLinkFooter = false;
    $scope.Minister = null;
    $scope.ShowLinkUrl = [];
    $scope.ShowHighlightList = [];
    $scope.HighlightList = [
                                {'img_path':'files/img/h1.png'}
                                ,{'img_path':'files/img/h2.png'}
                                ,{'img_path':'files/img/h3.png'}
                                ,{'img_path':'files/img/h4.png'}
                            ];


    $scope.loadMenu('menu/list');
    $scope.loadMainContent(true);
    
    // $scope.loadVideo('video/list');
    // $scope.loadNewsEcho('news', 'ข่าวประกาศจัดซื้อจัดจ้าง', 'Y');

    setTimeout(function(){
        //showSlides();   
        // setInterval(function(){showSlides();},5000);
    },500);

    // Highlight
    $scope.slideImage = function(index){
        console.log(index);
        var cnt = 0;
        var position = index;
        $scope.ShowHighlightList = [];

        while(cnt < 5 && position < $scope.HighlightList.length){
            
            $scope.ShowHighlightList.push($scope.HighlightList[position]);
            position++;
            cnt++;
            // console.log('do : '+cnt);
            // console.log('index : ' + index);
        }
        $scope.next_index = index + 1;
        $scope.prev_index = index - 1;
        // console.log($scope.next_index);
        // console.log($scope.prev_index);
    }
    
    $scope.next_index = 0;
    $scope.prev_index = 0;

    // Link
    $scope.slideLinkImage = function(index){
        // console.log('ฺำเรื หสรกำ สรืา');
        var cnt = 0;
        var position = index;
        $scope.ShowLinkUrl = [];

        while(cnt < 8 && position < $scope.LinkUrl.length){
            
            $scope.ShowLinkUrl.push($scope.LinkUrl[position]);
            position++;
            cnt++;
            // console.log('do : '+cnt);
            // console.log('index : ' + index);
        }
        $scope.link_next_index = index + 1;
        $scope.link_prev_index = index - 1;
        // console.log($scope.link_next_index);
        // console.log($scope.link_prev_index);
    }
    
    $scope.link_next_index = 0;
    $scope.link_prev_index = 0;

    $('.slide-shows').hover(function() {
        console.log('mouse In');
       if (varSetTimeout) {
        // Call clearTimeout() on hover()
        
        clearTimeout(varSetTimeout);
       }
    });

    $('.slide-shows').mouseout(function() {
        console.log('mouse out');
        // setTimeout(showSlides, 7000); 
        showSlides(slideIndex);
    });

    

});

// Next/previous controls
function plusSlides(n) {
  slideIndex += n;
  // console.log(slideIndex);
  setTimeout(showSlides(slideIndex), 500);
}

// Thumbnail image controls
function currentSlide(n) {
    // console.log(slideIndex);
    slideIndex += n;
    setTimeout(showSlides(slideIndex), 500);
  
}

var slideIndex = -1;
var varSetTimeout;





function showSlides(index) {
    if (varSetTimeout) {
        // Call clearTimeout() on hover()
        
        clearTimeout(varSetTimeout);
        varSetTimeout = null;
    }
    
    console.log(index);
    // if(index == undefined || index == null){
    //     index = 0;
    // }
    console.log('after : '+ index);
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var text = document.getElementsByClassName("text");
    var dots = document.getElementsByClassName("dot");

    if(index == -1){
        index = slides.length - 1;
    }
    else if(index >= slides.length){
        index = 0;
    }
    
    if(slides.length !== 0){
        for (i = 0; i < slides.length; i++) {
           slides[i].style.display = "none"; 
            dots[i].className = 'dot';
            text[i].style.display = "none";
        }
        if(index == undefined || index == null){
            slideIndex++;
            if(slideIndex == slides.length){
                slideIndex = 0;
            }
        }else{
            slideIndex = index;
        }
        if (slideIndex > slides.length) {slideIndex = 0} 
        var video_src = document.getElementById("video_src" + (slideIndex));
        // console.log("video_src" + (slideIndex-1));
        // setTimeout(console.log(video_src.duration), 5000);
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        console.log('slideIndex ' + slideIndex);
        if(slides[slideIndex].style !== undefined){
            slides[slideIndex].style.display = "block";  
            text[slideIndex].style.display = "block";  
        }
        dots[slideIndex].className += " dot-active";
        // setTimeout(function(){
        if(slides.length > 1){
            // setTimeout(showSlides, 4000);
            // console.log(video_src);
            console.log('slideIndex ' + slideIndex);
            
            if(isNaN(video_src.duration)){
                varSetTimeout = setTimeout(showSlides, 7000); // Change image every 2 seconds
                // console.log(varSetTimeout);
            }else{
                // console.log('duration' , video_src.duration * 1000);
                varSetTimeout = setTimeout(showSlides, (video_src.duration * 7000) + 200);
                // console.log(varSetTimeout);
            }
        }
        // },4000);
    }

}