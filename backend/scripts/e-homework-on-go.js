angular.module('e-homework').config(function ($routeProvider, $locationProvider) {
    $routeProvider
            .when("/", {
                templateUrl: "views/main.html",
                controller: "MainController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/MainController.js"]
                            });
                        }]
                }
            })

            .when("/website-survey", {
                templateUrl: "views/hearing-report/website-survey.html",
                controller: "WebsiteSurveyController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/WebsiteSurveyController.js"]
                            });
                        }]
                }
            })

            .when("/manage-main", {
                templateUrl: "views/main.html",
                controller: "MainController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/MainController.js"]
                            });
                        }]
                }
            })

            .when("/news/category", {
                templateUrl: "views/update/news-category.html",
                controller: "NewsCategoryController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/NewsCategoryController.js"]
                            });
                        }]
                }
            })


            .when("/video", {
                templateUrl: "views/video/main.html",
                controller: "VideoController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/VideoController.js"]
                            });
                        }]
                }
            })

            .when("/video/update/:id?", {
                templateUrl: "views/video/update.html",
                controller: "VideoUpdateController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/VideoUpdateController.js"]
                            });
                        }]
                }
            })

            .when("/home/:page_type?", {
                templateUrl: "views/home.html",
                controller: "HomeController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/HomeController.js"]
                            });
                        }]
                }
            })

            .when("/guest/logon", {
                templateUrl: "views/login.html",
                controller: "LoginController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/LoginController.js"]
                            });
                        }]
                }
            })

            .when("/user/permission", {
                templateUrl: "views/permission/main.html",
                controller: "PermissionController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/PermissionController.js"]
                            });
                        }]
                }
            })

            .when("/landing-page", {
                templateUrl: "views/landing-page/main.html",
                controller: "LandingPageController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/LandingPageController.js"]
                            });
                        }]
                }
            })

            .when("/video", {
                templateUrl: "views/video/main.html",
                controller: "VideoController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/VideoController.js"]
                            });
                        }]
                }
            })

            .when("/video/update/:id?", {
                templateUrl: "views/video/update.html",
                controller: "VideoUpdateController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/VideoUpdateController.js"]
                            });
                        }]
                }
            })

            .when("/menu-manage", {
                templateUrl: "views/menu/main.html",
                controller: "MenuController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/MenuController.js"]
                            });
                        }]
                }
            })

            .when("/user-account", {
                templateUrl: "views/user-account/main.html",
                controller: "UserAccountController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/UserAccountController.js"]
                            });
                        }]
                }
            })

            .when("/page/:id?", {
                templateUrl: "views/menu/update.html",
                controller: "MenuUpdateController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/MenuUpdateController.js"]
                            });
                        }]
                }
            })

            // .when("/page/:pagetype", {
            //        templateUrl : "views/update/pages.html",
            //        controller : "UpdatePageController",
            //        resolve : {
            // 		loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
            // 			return $ocLazyLoad.load({
            // 				files : [ "scripts/controllers/UpdatePageController.js" ]
            // 			});
            // 		} ]
            // 	}
            // })

            .when("/update/links/:linktype", {
                templateUrl: "views/update/link.html",
                controller: "UpdateLinkController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/UpdateLinkController.js"]
                            });
                        }]
                }
            })

            .when("/palace/:palace_type?", {
                templateUrl: "views/palace/palace.html",
                controller: "PalaceController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/PalaceController.js"]
                            });
                        }]
                }
            })

            .when("/link-url/manage", {
                templateUrl: "views/linkurl/linkurl.html",
                controller: "LinkUrlController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/LinkUrlController.js"]
                            });
                        }]
                }
            })

            .when("/update/news", {
                templateUrl: "views/update/news.html",
                controller: "UpdateNewsController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/UpdateNewsController.js"]
                            });
                        }]
                }
            })

            .when("/update/laws", {
                templateUrl: "views/update/law.html",
                controller: "UpdateLawController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/UpdateLawController.js"]
                            });
                        }]
                }
            })

            .when("/update/menu", {
                templateUrl: "views/update/menu.html",
                controller: "UpdateMenuController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/UpdateMenuController.js"]
                            });
                        }]
                }
            })

            .when("/question", {
                templateUrl: "views/question/main.html",
                controller: "QuestionController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/QuestionController.js"]
                            });
                        }]
                }
            })

            .when("/question/detail/:id?", {
                templateUrl: "views/question/detail.html",
                controller: "QuestionDetailController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/QuestionDetailController.js"]
                            });
                        }]
                }
            })

            .when("/services", {
                templateUrl: "views/services/main.html",
                controller: "ServicesController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/ServicesController.js"]
                            });
                        }]
                }
            })

            .when("/budget-disbursement", {
                templateUrl: "views/budget-disbursement/main.html",
                controller: "BudgetDisbursementController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/BudgetDisbursementController.js"]
                            });
                        }]
                }
            })

            .when("/attachfile-multi/:page_type", {
                templateUrl: "views/attachfile-multi/main.html",
                controller: "AttachFileMultiController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/AttachFileMultiController.js"]
                            });
                        }]
                }
            })

            .when("/attachfile-multi2/:page_type", {
                templateUrl: "views/attachfile-multi2/main.html",
                controller: "AttachFileMulti2Controller",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/AttachFileMulti2Controller.js"]
                            });
                        }]
                }
            })

            .when("/attachfile-multi3/:page_type", {
                templateUrl: "views/attachfile-multi3/main.html",
                controller: "AttachFileMulti3Controller",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/AttachFileMulti3Controller.js"]
                            });
                        }]
                }
            })

            .when("/listening", {
                templateUrl: "views/listening/main.html",
                controller: "ListeningController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/ListeningController.js"]
                            });
                        }]
                }
            })

            .when("/appeal/:page_type", {
                templateUrl: "views/appeal/main.html",
                controller: "AppealController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/AppealController.js"]
                            });
                        }]
                }
            })

            .when("/form-data1/:page_type", {
                templateUrl: "views/form-data1/main.html",
                controller: "FormData1Controller",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormData1Controller.js"]
                            });
                        }]
                }
            })

            .when("/seminar/:page_type", {
                templateUrl: "views/seminar/main.html",
                controller: "SeminarController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/SeminarController.js"]
                            });
                        }]
                }
            })

            .when("/purchase/:page_type", {
                templateUrl: "views/purchase/main.html",
                controller: "PurchaseController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/PurchaseController.js"]
                            });
                        }]
                }
            })

            .when("/media", {
                templateUrl: "views/media/main.html",
                controller: "MediaController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/MediaController.js"]
                            });
                        }]
                }
            })

            .when("/infographic", {
                templateUrl: "views/infographic/main.html",
                controller: "InfographicController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/InfographicController.js"]
                            });
                        }]
                }
            })

            .when("/contact-us", {
                templateUrl: "views/contact-us/main.html",
                controller: "ContactUsController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/ContactUsController.js"]
                            });
                        }]
                }
            })

            .when("/officer-contact", {
                templateUrl: "views/officer-contact/main.html",
                controller: "OfficerContactController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/OfficerContactController.js"]
                            });
                        }]
                }
            })

            .when("/question-answer", {
                templateUrl: "views/question-answer/main.html",
                controller: "QuestionAnswerController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/QuestionAnswerController.js"]
                            });
                        }]
                }
            })

            .when("/freq-question", {
                templateUrl: "views/freq-question/main.html",
                controller: "FreqQuestionController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FreqQuestionController.js"]
                            });
                        }]
                }
            })

            .when("/form-data1-operator/operator-list", {
                templateUrl: "views/form-data1/operator.html",
                controller: "FormData1OperatorController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormData1OperatorController.js"]
                            });
                        }]
                }
            })

            .when("/form-data1-customer/customer-list", {
                templateUrl: "views/form-data1/customer.html",
                controller: "FormData1CustomerController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormData1CustomerController.js"]
                            });
                        }]
                }
            })

            .when("/form-data1-inspection-operator/inspection-operator", {
                templateUrl: "views/form-data1/inspection-operator.html",
                controller: "FormData1InspectionOperatorController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormData1InspectionOperatorController.js"]
                            });
                        }]
                }
            })

            .when("/meeting-result", {
                templateUrl: "views/meeting-result/main.html",
                controller: "MeetingResultController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/MeetingResultController.js"]
                            });
                        }]
                }
            })

            .when("/licensees", {
                templateUrl: "views/licensees/main.html",
                controller: "LicenseesController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/LicenseesController.js"]
                            });
                        }]
                }
            })

            .when("/product-code", {
                templateUrl: "views/product-code/main.html",
                controller: "ProductCodeController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/ProductCodeController.js"]
                            });
                        }]
                }
            })

            .when("/country-list/:page_type", {
                templateUrl: "views/country-list/main.html",
                controller: "CountryListController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/CountryListController.js"]
                            });
                        }]
                }
            })

            .when("/certification-code/:page_type", {
                templateUrl: "views/certification-code/main.html",
                controller: "CertificationCodeController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/CertificationCodeController.js"]
                            });
                        }]
                }
            })

            .when("/license-register", {
                templateUrl: "views/license-register/main.html",
                controller: "LicenseRegisterController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/LicenseRegisterController.js"]
                            });
                        }]
                }
            })

            .when("/online-service", {
                templateUrl: "views/online-service/main.html",
                controller: "OnlineServiceController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/OnlineServiceController.js"]
                            });
                        }]
                }
            })

            .when("/hearing-report", {
                templateUrl: "views/hearing-report/main.html",
                controller: "HearingReportController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/HearingReportController.js"]
                            });
                        }]
                }
            })

            .when("/fruit", {
                templateUrl: "views/fruit/main.html",
                controller: "FruitController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FruitController.js"]
                            });
                        }]
                }
            })

            .when("/question", {
                templateUrl: "views/question/main.html",
                controller: "QuestionController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/QuestionController.js"]
                            });
                        }]
                }
            })

            .when("/question/detail/:id?", {
                templateUrl: "views/question/detail.html",
                controller: "QuestionDetailController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/QuestionDetailController.js"]
                            });
                        }]
                }
            })

            .when("/services", {
                templateUrl: "views/services/main.html",
                controller: "ServicesController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/ServicesController.js"]
                            });
                        }]
                }
            })
            .when("/bannercontrol", {
                templateUrl: "views/bannercontrol.html",
                controller: "BannerControlController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/BannerControlController.js"]
                            });
                        }]
                }
            })
            .when("/chart", {
                templateUrl: "views/chart.html",
                controller: "ChartController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/ChartController.js"]
                            });
                        }]
                }
            })
            .when("/form-generator", {
                templateUrl: "views/form-generator/form-generator.html",
                controller: "FormController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormController.js"]
                            });
                        }]
                }
            })
            .when("/form-generator/add", {
                templateUrl: "views/form-generator/add.html",
                controller: "FormDetailController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormDetailController.js"]
                            });
                        }]
                }
            })
            .when("/form-generator/add/:id?", {
                  templateUrl: "views/form-generator/add.html",
                controller: "FormDetailController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/FormDetailController.js"]
                            });
                        }]
                }
            })
             .when("/calendar", {
                templateUrl: "views/calendar/calendar.html",
                controller: "CalendarController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/CalendarController.js"]
                            });
                        }]
                }
            })
            .when("/calendar/add", {
                templateUrl: "views/calendar/add.html",
                controller: "CalendarDetailController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/CalendarDetailController.js"]
                            });
                        }]
                }
            })
            .when("/calendar/add/:id?", {
                  templateUrl: "views/calendar/add.html",
                controller: "CalendarDetailController",
                resolve: {
                    loadMyCtrl: ['$ocLazyLoad', function ($ocLazyLoad) {
                            return $ocLazyLoad.load({
                                files: ["scripts/controllers/CalendarDetailController.js"]
                            });
                        }]
                }
            })
            /*
             .when("/about/manage", {
             templateUrl : "views/about/about.html",
             controller : "AboutController",
             resolve : {
             loadMyCtrl : [ '$ocLazyLoad', function($ocLazyLoad) {
             return $ocLazyLoad.load({
             files : [ "scripts/controllers/AboutController.js" ]
             });
             } ]
             }
             })
             
             .when("/palace/manage", {
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
             
             .when("/authority/manage", {
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
             
             .when("/policy/manage", {
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
             
             .when("/project/manage", {
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
             
             .when("/contact/manage", {
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
             */
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