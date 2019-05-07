angular.module('e-homework').config(function($routeProvider, $locationProvider) {
    $routeProvider
    .when("/", {
        templateUrl : "views/main/main.html",
        controller : "HomeController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/HomeController.js" ]
				});
			} ]
		}
	})

	.when("/website-survey", {
        templateUrl : "views/hearing-report/website-survey.html",
        controller : "WebsiteSurveyController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/WebsiteSurveyController.js" ]
				});
			} ]
		}
	})

	.when("/video", {
        templateUrl : "views/video/main.html",
        controller : "VideoController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/VideoController.js" ]
				});
			} ]
		}
	})

	.when("/video/detail/:id", {
        templateUrl : "views/video/detail.html",
        controller : "VideoDetailController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/VideoDetailController.js" ]
				});
			} ]
		}
	})

	.when("/questions", {
        templateUrl : "views/question/main.html",
        controller : "QuestionController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/QuestionController.js" ]
				});
			} ]
		}
	})

	.when("/services", {
        templateUrl : "views/services/main.html",
        controller : "ServicesController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ServicesController.js" ]
				});
			} ]
		}
	})

	.when("/guest/signin", {
        templateUrl : "views/login.html",
        controller : "LoginController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/LoginController.js" ]
				});
			} ]
		}
	})

	.when("/sitemap", {
        templateUrl : "views/sitemap/main.html",
        controller : "SitemapController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/SitemapController.js" ]
				});
			} ]
		}
	})


	.when("/search/:keyword?", {
        templateUrl : "views/search.html",
        controller : "SearchController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/SearchController.js" ]
				});
			} ]
		}
	})

	.when("/questionnaire-response", {
        templateUrl : "views/questionnaire-response/main.html",
        controller : "QuestionnaireResponseController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/QuestionnaireResponseController.js" ]
				});
			} ]
		}
	})

	.when("/page/:id", {
        templateUrl : "views/page/page.html",
        controller : "PageController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/PageController.js" ]
				});
			} ]
		}
	})

	.when("/links/:linktype", {
        templateUrl : "views/page/link.html",
        controller : "LinkController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/LinkController.js" ]
				});
			} ]
		}
	})

	.when("/relate-link", {
        templateUrl : "views/page/linkurl.html",
        controller : "LinkUrlController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/LinkUrlController.js" ]
				});
			} ]
		}
	})

	.when("/news/:NEWS_TYPE?", {
        templateUrl : "views/page/news.html",
        controller : "NewsController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/NewsController.js" ]
				});
			} ]
		}
	})

	.when("/news/detail/:NEWS_ID", {
        templateUrl : "views/page/news-detail.html",
        controller : "NewsDetailController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/NewsDetailController.js" ]
				});
			} ]
		}
	})

	.when("/law", {
        templateUrl : "views/page/law.html",
        controller : "LawController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/LawController.js" ]
				});
			} ]
		}
	})

	.when("/palace/:palace_type?", {
        templateUrl : "views/palace/palace.html",
        controller : "PalaceController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/PalaceController.js" ]
				});
			} ]
		}
	})

	.when("/palace-minister", {
        templateUrl : "views/palace/palace.html",
        controller : "PalaceMinisterController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/PalaceMinisterController.js" ]
				});
			} ]
		}
	})

	.when("/authority", {
        templateUrl : "views/authority/authority.html",
        controller : "AuthorityController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/AuthorityController.js" ]
				});
			} ]
		}
	})

	.when("/policy", {
        templateUrl : "views/policy/policy.html",
        controller : "PolicyController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/PolicyController.js" ]
				});
			} ]
		}
	})

	.when("/project", {
        templateUrl : "views/project/project.html",
        controller : "ProjectController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ProjectController.js" ]
				});
			} ]
		}
	})

	.when("/contact", {
        templateUrl : "views/contact/contact.html",
        controller : "ContactController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ContactController.js" ]
				});
			} ]
		}
	})

	.when("/video", {
        templateUrl : "views/video/main.html",
        controller : "VideoController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/VideoController.js" ]
				});
			} ]
		}
	})

	.when("/video/detail/:id", {
        templateUrl : "views/video/detail.html",
        controller : "VideoDetailController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/VideoDetailController.js" ]
				});
			} ]
		}
	})

	.when("/questions", {
        templateUrl : "views/question/main.html",
        controller : "QuestionController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/QuestionController.js" ]
				});
			} ]
		}
	})

	.when("/services", {
        templateUrl : "views/services/main.html",
        controller : "ServicesController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ServicesController.js" ]
				});
			} ]
		}
	})

	.when("/attachfile-multi/:page_type?", {
        templateUrl : "views/attachfile-multi/main.html",
        controller : "AttachFileMultiController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/AttachFileMultiController.js" ]
				});
			} ]
		}
	})

	.when("/attachfile-multi2/:page_type?", {
        templateUrl : "views/attachfile-multi2/main.html",
        controller : "AttachFileMulti2Controller",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/AttachFileMulti2Controller.js" ]
				});
			} ]
		}
	})

	.when("/attachfile-multi3/:page_type?", {
        templateUrl : "views/attachfile-multi3/main.html",
        controller : "AttachFileMulti3Controller",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/AttachFileMulti3Controller.js" ]
				});
			} ]
		}
	})

	.when("/budget-disbursement", {
        templateUrl : "views/budget-disbursement/main.html",
        controller : "BudgetDisbursementController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/BudgetDisbursementController.js" ]
				});
			} ]
		}
	})

	.when("/listening", {
        templateUrl : "views/listening/main.html",
        controller : "ListeningController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ListeningController.js" ]
				});
			} ]
		}
	})

	.when("/listening/detail/:id", {
        templateUrl : "views/listening/detail.html",
        controller : "ListeningDetailController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ListeningDetailController.js" ]
				});
			} ]
		}
	})

	.when("/listening/comment/:id", {
        templateUrl : "views/listening/comment.html",
        controller : "ListeningCommentController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ListeningCommentController.js" ]
				});
			} ]
		}
	})

	.when("/standard-commodity/search", {
        templateUrl : "views/standard-commodity/search.html",
        controller : "StandardCommoditySearchController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/StandardCommoditySearchController.js" ]
				});
			} ]
		}
	})

	.when("/standard-commodity/plan", {
        templateUrl : "views/standard-commodity/plan.html",
        controller : "StandardCommodityPlanController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/StandardCommodityPlanController.js" ]
				});
			} ]
		}
	})

	.when("/standard-commodity/general", {
        templateUrl : "views/standard-commodity/general.html",
        controller : "StandardCommodityGeneralController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/StandardCommodityGeneralController.js" ]
				});
			} ]
		}
	})

	.when("/standard-commodity/mandatory", {
        templateUrl : "views/standard-commodity/mandatory.html",
        controller : "StandardCommodityMandatoryController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/StandardCommodityMandatoryController.js" ]
				});
			} ]
		}
	})

	.when("/appeal/:page_type", {
        templateUrl : "views/appeal/main.html",
        controller : "AppealController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/AppealController.js" ]
				});
			} ]
		}
	})

	.when("/form-data1/:page_type", {
        templateUrl : "views/form-data1/main.html",
        controller : "FormData1Controller",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/FormData1Controller.js" ]
				});
			} ]
		}
	})

	.when("/seminar/:page_type", {
        templateUrl : "views/seminar/main.html",
        controller : "SeminarController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/SeminarController.js" ]
				});
			} ]
		}
	})

	.when("/purchase/:page_type", {
        templateUrl : "views/purchase/main.html",
        controller : "PurchaseController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/PurchaseController.js" ]
				});
			} ]
		}
	})

	.when("/media", {
        templateUrl : "views/media/main.html",
        controller : "MediaController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/MediaController.js" ]
				});
			} ]
		}
	})

	.when("/infographic", {
        templateUrl : "views/infographic/main.html",
        controller : "InfographicController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/InfographicController.js" ]
				});
			} ]
		}
	})

	.when("/contact-us", {
        templateUrl : "views/contact-us/main.html",
        controller : "ContactUsController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ContactUsController.js" ]
				});
			} ]
		}
	})

	.when("/officer-contact", {
        templateUrl : "views/officer-contact/main.html",
        controller : "OfficerContactController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/OfficerContactController.js" ]
				});
			} ]
		}
	})

	.when("/question-answer", {
        templateUrl : "views/question-answer/main.html",
        controller : "QuestionAnswerController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/QuestionAnswerController.js" ]
				});
			} ]
		}
	})

	.when("/freq-question", {
        templateUrl : "views/freq-question/main.html",
        controller : "FreqQuestionController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/FreqQuestionController.js" ]
				});
			} ]
		}
	})

	.when("/form-data1-operator/operator-list", {
        templateUrl : "views/form-data1/operator.html",
        controller : "FormData1OperatorController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/FormData1OperatorController.js" ]
				});
			} ]
		}
	})

	.when("/form-data1-customer/customer-list", {
        templateUrl : "views/form-data1/customer.html",
        controller : "FormData1CustomerController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/FormData1CustomerController.js" ]
				});
			} ]
		}
	})

	.when("/form-data1-inspection-operator/inspection-operator", {
        templateUrl : "views/form-data1/inspection-operator.html",
        controller : "FormData1InspectionOperatorController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/FormData1InspectionOperatorController.js" ]
				});
			} ]
		}
	})

	.when("/meeting-result", {
        templateUrl : "views/meeting-result/main.html",
        controller : "MeetingResultController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/MeetingResultController.js" ]
				});
			} ]
		}
	})

	.when("/licensees", {
        templateUrl : "views/licensees/main.html",
        controller : "LicenseesController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/LicenseesController.js" ]
				});
			} ]
		}
	})

	.when("/product-code", {
        templateUrl : "views/product-code/main.html",
        controller : "ProductCodeController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/ProductCodeController.js" ]
				});
			} ]
		}
	})

	.when("/country-list/:page_type", {
        templateUrl : "views/country-list/main.html",
        controller : "CountryListController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/CountryListController.js" ]
				});
			} ]
		}
	})

	.when("/certification-code/:page_type", {
        templateUrl : "views/certification-code/main.html",
        controller : "CertificationCodeController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/CertificationCodeController.js" ]
				});
			} ]
		}
	})

	.when("/license-register", {
        templateUrl : "views/license-register/main.html",
        controller : "LicenseRegisterController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/LicenseRegisterController.js" ]
				});
			} ]
		}
	})

	.when("/online-service", {
        templateUrl : "views/online-service/main.html",
        controller : "OnlineServiceController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/OnlineServiceController.js" ]
				});
			} ]
		}
	})

	.when("/hearing-report", {
        templateUrl : "views/hearing-report/main.html",
        controller : "HearingReportController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/HearingReportController.js" ]
				});
			} ]
		}
	})

	.when("/fruit", {
        templateUrl : "views/fruit/main.html",
        controller : "FruitController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/FruitController.js" ]
				});
			} ]
		}
	})

	.when("/doc-people", {
        templateUrl : "views/doc-people/main.html",
        controller : "DocPeopleController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/DocPeopleController.js" ]
				});
			} ]
		}
	})

	.when("/warning", {
        templateUrl : "views/warning/main.html",
        controller : "WarningController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/WarningController.js" ]
				});
			} ]
		}
	})
	.when("/advsearch", {
        templateUrl : "views/advsearch.html",
        controller : "AdvSearchController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/AdvSearchController.js" ]
				});
			} ]
		}
	})
  .when("/ebook", {
        templateUrl : "views/ebook/ebook.html",
        controller : "EbookController",
        resolve : {
			loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
				return $ocLazyLoad.load({
					files : [ "scripts/controllers/EbookController.js" ]
				});
			} ]
		}
	})
	;

	$locationProvider.hashPrefix('');
	// $locationProvider.html5Mode({
 //                 enabled: true,
 //                 requireBase: false
 //          });
	
});

/*app.config(function($routeProvider) {
	
	$routeProvider.when('/', {

	  templateUrl: function(rd) {
	    return 'views/home.html';
	  },

	  resolve: {
	    load: function($q, $route, $rootScope) {

	      var deferred = $q.defer();
	      var dependencies = [
	        'scripts/controllers/HomeController.js'
	      ];

	      $script(dependencies, function () {
	        $rootScope.$apply(function() {
	          deferred.resolve();
	        });
	      });

	      console.log(deferred);
	      return deferred.promise;
	    }
	  }
	});

});*/