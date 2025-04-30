import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/shared/navigations/app_routes_constants.dart';
import 'routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter();
  @override
  List<AutoRoute> get routes => <AutoRoute>[



    
 AutoRoute(
            page: SplashRoute.page,
            path: AppRoutesConstants.splash,
            maintainState: false,
            initial: true),



 CustomRoute(
            page: NavigationMainRoute.page,
            path: AppRoutesConstants.mainNavigation,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            maintainState: true,
            children: <AutoRoute>[
                AutoRoute(
                page: HomeRoute.page,
                path: AppRoutesConstants.home,
                maintainState: false,
               ),
              AutoRoute(
                page: RequestsRoute.page,
                path: AppRoutesConstants.requests,
                maintainState: false,
              ),
            
                    AutoRoute(
                  page: SubmissionsRoute.page,
                  path:  AppRoutesConstants.submissionsSupervisor,
                  maintainState: false,
                 ),
            // main route
              AutoRoute(
                      page: MoreRoute.page,
                      path: AppRoutesConstants.more,
                      maintainState: false,
                    ),
            ]),

            //------


        // CustomRoute(
        //     page: DirectorNavigationMainRoute.page,
        //     path: AppRoutesConstants.adminNavigation,
        //     maintainState: false,
        //     children: <AutoRoute>[
      
        //           // director route
        //       AutoRoute(
        //           maintainState: false,
        //           path: 'tab4',
        //           page: EmptyRouterRoute4.page,
        //           children: [
        //             AutoRoute(
        //               page: MoreRoute.page,
        //               path: '',
        //               maintainState: false,
        //             ),
                  
        //           ]),
        //     ]),

            //-----


 // as supervisor

    //     AutoRoute(
    //         page: SupervisorNavigationMainRoute.page,
    //         path: AppRoutesConstants.supervisorNavigation,
    //         maintainState: true,
    //         children: <AutoRoute>[
    //           AutoRoute(
    //               page: RequestsRoute.page,
    //               path: AppRoutesConstants.requests,
    //               maintainState: false
    //               //  meta: <String, dynamic>{'hideBottomNav': true},
    //               ),
    // AutoRoute(
    //               page: SubmissionsRoute.page,
    //               path:  AppRoutesConstants.submissions ,
    //               maintainState: false,
    //             ),
    //           AutoRoute(
    //               page: HomeRoute.page,
    //               path: AppRoutesConstants.home,
    //               maintainState: false),
    //           AutoRoute(
    //               path: 'tab2',
    //               page: EmptyRouterRoute2.page,
    //               maintainState: false,
    //               children: [
    //                 AutoRoute(
    //                     page: RequestsRoute.page,
    //                     path: AppRoutesConstants.requests,
    //                     maintainState: false
    //                     ),

    //               ]),
    //           AutoRoute(path: 'tab3', page: EmptyRouterRoute3.page, children: [
    //             AutoRoute(
    //               page: SubmissionsRoute.page,
    //               path:  AppRoutesConstants.submissions ,
    //               maintainState: false,
    //             ),
    //           ]),
          
    //           AutoRoute(
    //               maintainState: false,
    //               path: 'tab4',
    //               page: EmptyRouterRoute4.page,
    //               children: [
    //                 AutoRoute(
    //                   page: MoreRoute.page,
    //                   path: AppRoutesConstants.more,
    //                   maintainState: false,
    //                 ),
    //                 // AutoRoute(
    //                 //   page: VisitorsLogsRoute.page,
    //                 //   path: AppRoutesConstants.visitorsLogs,
    //                 //   maintainState: false,
    //                 // ),
                   
    //               ]),
    //         ]),

            ///----- 





        AutoRoute(
            page: ChatBotRoute.page,
            path: AppRoutesConstants.chatBot,
            maintainState: true,
            initial: false),

        AutoRoute(
          page: AboutItemDetailsRoute.page,
          path: AppRoutesConstants.aboutScreenItemDetails,
          maintainState: false,
        ),

        AutoRoute(
          maintainState: false,
          page: CreateRequestRoute.page,
          path: AppRoutesConstants.createRequest,
          //  meta: <String, dynamic>{'hideBottomNav': true},
        ),

        AutoRoute(
          maintainState: false,
          page: ExtendLeaveDetailsRoute.page,
          path: AppRoutesConstants.extendLeaveDetails,
          //  meta: <String, dynamic>{'hideBottomNav': true},
        ),


        AutoRoute(
                  page: DirectorMissionRoute.page,
                  path: AppRoutesConstants.directorMission,
                  maintainState: false),
              AutoRoute(
                  page: DirectorDeptAssignmentRoute.page,
                  path: AppRoutesConstants.directorDeptMissionRoute,
                  maintainState: false),
              AutoRoute(
                  page: DirectorDeptMissionRoute.page,
                  path: AppRoutesConstants.directorDeptAssignment,
                  maintainState: false),

       
  AutoRoute(
                      page: ProfileRoute.page,
                      path: AppRoutesConstants.profile,
                      maintainState: false,
                    ),
        AutoRoute(
          page: EditProfileRoute.page,
          path: AppRoutesConstants.editProfile,
          maintainState: false,
        ),
        AutoRoute(
          page: EditSpouseDataRoute.page,
          path: AppRoutesConstants.editSpouseDataScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: EditChildDataRoute.page,
          path: AppRoutesConstants.editChildDataScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: PersonalInfoRoute.page,
          path: AppRoutesConstants.personalInfo,
          maintainState: false,
        ),
        AutoRoute(
          page: AddressRoute.page,
          path: AppRoutesConstants.addressScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: EditAddressRoute.page,
          path: AppRoutesConstants.editAddressScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: FamilyRoute.page,
          path: AppRoutesConstants.familyScreen,
          maintainState: false,
        ),

        AutoRoute(
          page: AddFamilyRoute.page,
          path: AppRoutesConstants.addFamilyScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: QualificationsRoute.page,
          path: AppRoutesConstants.qualificationScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: AddQualificationRoute.page,
          path: AppRoutesConstants.addQualificationScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: WorkRoute.page,
          path: AppRoutesConstants.workScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: AddWorkRoute.page,
          path: AppRoutesConstants.addWorkScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: AppRoutesConstants.authScreen,
          maintainState: false,
        ),
        AutoRoute(
          page: ForgetPassRoute.page,
          path: AppRoutesConstants.forgotPassword,
        ),
        AutoRoute(
          page: ForgetPassVerifyOtpRoute.page,
          path: AppRoutesConstants.forgotPasswordVerifyOtp,
        ),
        AutoRoute(
          page: ResetPassRoute.page,
          path: AppRoutesConstants.resetPassword,
        ),
        AutoRoute(
          page: PasswordChangedRoute.page,
          path: AppRoutesConstants.passwordChanged,
        ),
        AutoRoute(
          page: CreateAnnualLeaveRequestRoute.page,
          path: AppRoutesConstants.createAnnualLeaveRequest,
        ),
        AutoRoute(
          page: CreateSickLeaveRequestRoute.page,
          path: AppRoutesConstants.createSickLeaveRequest,
        ),
        AutoRoute(
          page: ThankYouRoute.page,
          path: AppRoutesConstants.thankYou,
        ),
        AutoRoute(
          page: NotificationsRoute.page,
          path: AppRoutesConstants.notifications,
        ),
        AutoRoute(
          page: NotificationDetailsRoute.page,
          path: AppRoutesConstants.notificationDetails,
        ),
        AutoRoute(
          page: CreateEmergencyLeaveRequestRoute.page,
          path: AppRoutesConstants.createEmergencyLeaveRequest,
        ),
        AutoRoute(
          page: MyAttendanceRoute.page,
          path: AppRoutesConstants.myAttendance,
        ),
        // AutoRoute(
        //   page: CreateTrainingRequestRoute.page,
        //   path: AppRoutesConstants.createTrainingRequest,
        // ),

        AutoRoute(
          page: CertificatesRoute.page,
          path: AppRoutesConstants.certificates,
        ),
        AutoRoute(
          page: CertificateDetailsRoute.page,
          path: AppRoutesConstants.certificateDetails,
        ),
        // AutoRoute(
        //   page: CreateLoanRequestRoute.page,
        //   path: AppRoutesConstants.createLoanRequest,
        // ),
        // AutoRoute(
        //   page: DocumentsRoute.page,
        //   path: AppRoutesConstants.documents,
        // ),
        // AutoRoute(
        //   page: SignPaciRoute.page,
        //   path: AppRoutesConstants.signPaciScreen,
        // ),
        AutoRoute(
          page: AdsRoute.page,
          path: AppRoutesConstants.adsScreen,
        ),
        AutoRoute(
          page: AdsDetailsRoute.page,
          path: AppRoutesConstants.adsDetailsScreen,
        ),

        AutoRoute(
          page: VisitorsLogsRoute.page,
          path: AppRoutesConstants.visitorsLogsMoreMenu,
          maintainState: false,
        ),

        AutoRoute(
          page: ContactUsRoute.page,
          path: AppRoutesConstants.contactUsScreen,
        ),
        AutoRoute(
          page: AboutRoute.page,
          path: AppRoutesConstants.aboutScreen,
        ),
        AutoRoute(
          page: OperationsRoute.page,
          path: AppRoutesConstants.operationsScreen,
        ),
        // AutoRoute(
        //   page: MyAttendanceRoute.page,
        //   path: AppRoutesConstants.myAttendance,
        // ),
        AutoRoute(
            page: SurveyRoute.page,
            path: AppRoutesConstants.surveyRoute,
            maintainState: false),

                AutoRoute(
                  page: SubmissionsRoute.page,
                  path:  AppRoutesConstants.submissionsDirector,
                  maintainState: false,
                 ),

  //  AutoRoute(
  //               page: RequestsRoute.page,
  //               path: AppRoutesConstants.requestsDirector,
  //               maintainState: false,
  //             ),


       
      ];
}

// @RoutePage()
// class EmptyRouterPage extends StatelessWidget {
//   const EmptyRouterPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AutoRouter();
//   }
// }

// @RoutePage()
// class EmptyRouterPage2 extends StatelessWidget {
//   const EmptyRouterPage2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AutoRouter();
//   }
// }

// @RoutePage()
// class EmptyRouterPage3 extends StatelessWidget {
//   const EmptyRouterPage3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AutoRouter();
//   }
// }

// @RoutePage()
// class EmptyRouterPage4 extends StatelessWidget {
//   const EmptyRouterPage4({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const AutoRouter();
//   }
// }
