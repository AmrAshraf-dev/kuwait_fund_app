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
        AutoRoute(
            page: NavigationMainRoute.page,
            path: AppRoutesConstants.mainNavigation,
            children: <AutoRoute>[
              AutoRoute(
                  page: HomeRoute.page,
                  path: AppRoutesConstants.home,
                  maintainState: false),
              AutoRoute(
                  path: 'tab1',
                  page: EmptyRouterRoute.page,
                  maintainState: false,
                  children: [
                    AutoRoute(
                      page: RequestsRoute.page,
                      path: '',
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    AutoRoute(
                      page: AnnualLeaveRequestDetailsRoute.page,
                      path: AppRoutesConstants.annualLeaveRequestDetails,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    AutoRoute(
                      page: CreateRequestRoute.page,
                      path: AppRoutesConstants.createRequest,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    AutoRoute(
                      page: TrainingRequestDetailsRoute.page,
                      path: AppRoutesConstants.trainingRequestDetails,
                    )
                  ]),
              AutoRoute(
                page: InsuranceRoute.page,
                path: AppRoutesConstants.insurance,
                maintainState: false,
              ),
              AutoRoute(
                  page: MoreRoute.page,
                  path: AppRoutesConstants.more,
                  maintainState: false),
            ]),

        AutoRoute(
          page: AuthRoute.page,
          path: AppRoutesConstants.authScreen,
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
          page: CreateTrainingRequestRoute.page,
          path: AppRoutesConstants.createTrainingRequest,
        ),
        AutoRoute(
          page: CreateInsuranceRequestRoute.page,
          path: AppRoutesConstants.createInsuranceRequest,
        ),
        AutoRoute(
          page: CertificatesRoute.page,
          path: AppRoutesConstants.certificates,
        ),
        AutoRoute(
          page: CertificateDetailsRoute.page,
          path: AppRoutesConstants.certificateDetails,
        ),
        AutoRoute(
          page: CreateLoanRequestRoute.page,
          path: AppRoutesConstants.createLoanRequest,
        ),
        AutoRoute(
          page: DocumentsRoute.page,
          path: AppRoutesConstants.documents,
        ),
        AutoRoute(
          page: SignPaciRoute.page,
          path: AppRoutesConstants.signPaciScreen,
        ),
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
        AutoRoute(
          page: MyAttendanceRoute.page,
          path: AppRoutesConstants.myAttendance,
        ),

        // as supervisor

        AutoRoute(
            page: SupervisorNavigationMainRoute.page,
            path: AppRoutesConstants.supervisorNavigation,
            children: <AutoRoute>[
              AutoRoute(
                  page: HomeRoute.page,
                  path: AppRoutesConstants.home,
                  maintainState: false),
              AutoRoute(
                  path: 'tab1',
                  page: EmptyRouterRoute.page,
                  maintainState: false,
                  children: [
                    AutoRoute(
                        page: RequestsRoute.page,
                        path: AppRoutesConstants.requests
                        //  meta: <String, dynamic>{'hideBottomNav': true},
                        ),
                    AutoRoute(
                      page: AnnualLeaveRequestDetailsRoute.page,
                      path: AppRoutesConstants.annualLeaveRequestDetails,
                      //  meta: <String, dynamic>{'hideBottomNav': true},
                    ),
                    AutoRoute(
                      page: TrainingRequestDetailsRoute.page,
                      path: AppRoutesConstants.trainingRequestDetails,
                    )
                  ]),
              AutoRoute(path: 'tab2', page: EmptyRouterRoute2.page, children: [
                AutoRoute(
                  page: SubmissionsRoute.page,
                  path: '',
                  //  meta: <String, dynamic>{'hideBottomNav': true},
                ),
                AutoRoute(
                  page: AnnualSubmissionsDetailsRoute.page,
                  path: AppRoutesConstants.annualSubmissionDetails,
                ),
                AutoRoute(
                  page: TrainingSubmissionsDetailsRoute.page,
                  path: AppRoutesConstants.trainingSubmissionDetails,
                ),
              ]),
              AutoRoute(
                page: InsuranceRoute.page,
                path: AppRoutesConstants.insurance,
              ),
              AutoRoute(path: 'tab3', page: EmptyRouterRoute3.page, children: [
                AutoRoute(
                  page: MoreRoute.page,
                  path: AppRoutesConstants.more,
                ),
                AutoRoute(
                  page: VisitorsLogsRoute.page,
                  path: AppRoutesConstants.visitorsLogs,
                ),
                AutoRoute(
                  page: ProfileRoute.page,
                  path: AppRoutesConstants.profile,
                ),
              ]),
              AutoRoute(
                page: EditProfileRoute.page,
                path: AppRoutesConstants.editProfile,
              ),
              AutoRoute(
                page: PeraonalInfoRoute.page,
                path: AppRoutesConstants.personalInfo,
              ),
            ]),

        AutoRoute(
            page: AdminNavigationMainRoute.page,
            path: AppRoutesConstants.adminNavigation,
            children: <AutoRoute>[
              AutoRoute(
                  page: AdminHomeRoute.page,
                  path: AppRoutesConstants.adminHome,
                  maintainState: false),
              AutoRoute(
                  page: AdminDirectorMissionRoute.page,
                  path: AppRoutesConstants.adminDirectorMission,
                  maintainState: false),
              AutoRoute(
                  page: AdminDeptMissionRoute.page,
                  path: AppRoutesConstants.adminDeptMission,
                  maintainState: false),
              AutoRoute(
                page: MoreRoute.page,
                path: AppRoutesConstants.more,
              ),
            ]),
        AutoRoute(
          page: SurveyRoute.page,
          path: AppRoutesConstants.surveyRoute,
        ),
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
