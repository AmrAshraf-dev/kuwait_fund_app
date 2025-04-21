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
            maintainState: true,
            initial: true),

        AutoRoute(
          page: AboutItemDetailsRoute.page,
          path: AppRoutesConstants.aboutScreenItemDetails,
          maintainState: true,
        ),

        CustomRoute(
            page: NavigationMainRoute.page,
            path: AppRoutesConstants.mainNavigation,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            maintainState: true,
            children: <AutoRoute>[
              CustomRoute(
                page: HomeRoute.page,
                path: AppRoutesConstants.home,
                maintainState: true,
                transitionsBuilder: TransitionsBuilders.fadeIn,
              ),
              AutoRoute(
                  path: 'tab1',
                  page: EmptyRouterRoute.page,
                  maintainState: true,
                  children: [
                    AutoRoute(
                      page: RequestsRoute.page,
                      path: '',
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    AutoRoute(
                      maintainState: true,
                      page: ExtendLeaveDetailsRoute.page,
                      path: AppRoutesConstants.extendLeaveDetails,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    AutoRoute(
                      maintainState: false,
                      page: CreateRequestRoute.page,
                      path: AppRoutesConstants.createRequest,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    // AutoRoute(
                    //   maintainState: true,
                    //   page: TrainingRequestDetailsRoute.page,
                    //   path: AppRoutesConstants.trainingRequestDetails,
                    // )
                  ]),
              // AutoRoute(
              //   page: InsuranceRoute.page,
              //   path: AppRoutesConstants.insurance,
              //   maintainState: true,
              // ),
              AutoRoute(
                  maintainState: true,
                  path: 'tab4',
                  page: EmptyRouterRoute4.page,
                  children: [
                    AutoRoute(
                      page: MoreRoute.page,
                      path: AppRoutesConstants.more,
                      maintainState: true,
                    ),
                    AutoRoute(
                      page: VisitorsLogsRoute.page,
                      path: AppRoutesConstants.visitorsLogs,
                      maintainState: true,
                    ),
                    AutoRoute(
                      page: ProfileRoute.page,
                      path: AppRoutesConstants.profile,
                      maintainState: true,
                    ),
                  ]),
            ]),

        AutoRoute(
          page: EditProfileRoute.page,
          path: AppRoutesConstants.editProfile,
          maintainState: true,
        ),
        AutoRoute(
          page: PersonalInfoRoute.page,
          path: AppRoutesConstants.personalInfo,
          maintainState: true,
        ),
        AutoRoute(
          page: AddressRoute.page,
          path: AppRoutesConstants.addressScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: EditAddressRoute.page,
          path: AppRoutesConstants.editAddressScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: FamilyRoute.page,
          path: AppRoutesConstants.familyScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: EditFamilyRoute.page,
          path: AppRoutesConstants.editFamilyScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: AddFamilyRoute.page,
          path: AppRoutesConstants.addFamilyScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: QualificationsRoute.page,
          path: AppRoutesConstants.qualificationScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: AddQualificationRoute.page,
          path: AppRoutesConstants.addQualificationScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: WorkRoute.page,
          path: AppRoutesConstants.workScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: AddWorkRoute.page,
          path: AppRoutesConstants.addWorkScreen,
          maintainState: true,
        ),
        AutoRoute(
          page: AuthRoute.page,
          path: AppRoutesConstants.authScreen,
          maintainState: true,
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
        AutoRoute(
          page: CreateTrainingRequestRoute.page,
          path: AppRoutesConstants.createTrainingRequest,
        ),

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
            maintainState: true),

        AutoRoute(
            page: DirectorNavigationMainRoute.page,
            path: AppRoutesConstants.adminNavigation,
            maintainState: true,
            children: <AutoRoute>[
              AutoRoute(
                  page: AdminHomeRoute.page,
                  path: AppRoutesConstants.adminHome,
                  maintainState: true),
              AutoRoute(
                  page: AdminDirectorMissionRoute.page,
                  path: AppRoutesConstants.adminDirectorMission,
                  maintainState: true),
              AutoRoute(
                  page: AdminDeptMissionRoute.page,
                  path: AppRoutesConstants.adminDeptMission,
                  maintainState: true),
              AutoRoute(
                  maintainState: true,
                  path: 'tab4',
                  page: EmptyRouterRoute4.page,
                  children: [
                    AutoRoute(
                      page: MoreRoute.page,
                      path: AppRoutesConstants.more,
                      maintainState: true,
                    ),
                    AutoRoute(
                      page: VisitorsLogsRoute.page,
                      path: AppRoutesConstants.visitorsLogs,
                      maintainState: true,
                    ),
                    AutoRoute(
                      page: ProfileRoute.page,
                      path: AppRoutesConstants.profile,
                      maintainState: true,
                    ),
                  ]),
            ]),

        // as supervisor

        AutoRoute(
            page: SupervisorNavigationMainRoute.page,
            path: AppRoutesConstants.supervisorNavigation,
            maintainState: true,
            children: <AutoRoute>[
              AutoRoute(
                  page: HomeRoute.page,
                  path: AppRoutesConstants.home,
                  maintainState: true),
              AutoRoute(
                  path: 'tab2',
                  page: EmptyRouterRoute2.page,
                  maintainState: true,
                  children: [
                    AutoRoute(
                        page: RequestsRoute.page,
                        path: AppRoutesConstants.requests,
                        maintainState: true

                        //  meta: <String, dynamic>{'hideBottomNav': true},
                        ),
                    AutoRoute(
                      maintainState: true,
                      page: CreateRequestRoute.page,
                      path: AppRoutesConstants.createRequest,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                     AutoRoute(
                      maintainState: true,
                      page: ExtendLeaveDetailsRoute.page,
                      path: AppRoutesConstants.extendLeaveDetails,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    // AutoRoute(
                    //   page: TrainingRequestDetailsRoute.page,
                    //   path: AppRoutesConstants.trainingRequestDetails,
                    //   maintainState: true,
                    // )
                  ]),
              AutoRoute(path: 'tab3', page: EmptyRouterRoute3.page, children: [
                AutoRoute(
                  page: SubmissionsRoute.page,
                  path: '',
                  maintainState: true,

                  //  meta: <String, dynamic>{'hideBottomNav': true},
                ),
                // AutoRoute(
                //   page: AnnualSubmissionsDetailsRoute.page,
                //   path: AppRoutesConstants.annualSubmissionDetails,
                //   maintainState: true,
                // ),
                // AutoRoute(
                //   page: TrainingSubmissionsDetailsRoute.page,
                //   path: AppRoutesConstants.trainingSubmissionDetails,
                //   maintainState: true,
                // ),
              ]),
              // AutoRoute(
              //   page: InsuranceRoute.page,
              //   path: AppRoutesConstants.insurance,
              //   maintainState: true,
              // ),
              AutoRoute(
                  maintainState: true,
                  path: 'tab4',
                  page: EmptyRouterRoute4.page,
                  children: [
                    AutoRoute(
                      page: MoreRoute.page,
                      path: AppRoutesConstants.more,
                      maintainState: true,
                    ),
                    AutoRoute(
                      page: VisitorsLogsRoute.page,
                      path: AppRoutesConstants.visitorsLogs,
                      maintainState: true,
                    ),
                    AutoRoute(
                      page: ProfileRoute.page,
                      path: AppRoutesConstants.profile,
                      maintainState: true,
                    ),
                  ]),
            ])
      ];
}

@RoutePage()
class EmptyRouterPage extends StatelessWidget {
  const EmptyRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class EmptyRouterPage2 extends StatelessWidget {
  const EmptyRouterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class EmptyRouterPage3 extends StatelessWidget {
  const EmptyRouterPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}

@RoutePage()
class EmptyRouterPage4 extends StatelessWidget {
  const EmptyRouterPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
