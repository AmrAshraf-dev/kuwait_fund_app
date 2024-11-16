// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:flutter/material.dart' as _i35;
import 'package:kf_ess_mobile_app/core/routes/routes.dart' as _i15;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/screens/submissions_screen.dart'
    as _i30;
import 'package:kf_ess_mobile_app/features/as_supervisor/supervisor_navigation_bottom/supervisor_navigation_bottom.dart'
    as _i31;
import 'package:kf_ess_mobile_app/features/auth/presentation/screens/auth_screen.dart'
    as _i4;
import 'package:kf_ess_mobile_app/features/certificates/presentation/screens/certificate_details_screen.dart'
    as _i5;
import 'package:kf_ess_mobile_app/features/certificates/presentation/screens/certificates_screen.dart'
    as _i6;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_annual_leave_request_screen.dart'
    as _i7;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_emergency_leave_request_screen.dart'
    as _i8;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_insurance_request_screen.dart'
    as _i9;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_loan_request_screen.dart'
    as _i10;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_request_screen.dart'
    as _i11;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_sick_leave_request_screen.dart'
    as _i12;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_training_request_screen.dart'
    as _i13;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/forget_pass_screen.dart'
    as _i16;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/forget_pass_verify_otp_screen.dart'
    as _i17;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/password_changed_screen.dart'
    as _i25;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/reset_pass_screen.dart'
    as _i27;
import 'package:kf_ess_mobile_app/features/home/presentation/screens/home_screen.dart'
    as _i18;
import 'package:kf_ess_mobile_app/features/insurance/presentation/screens/insurance_screen.dart'
    as _i19;
import 'package:kf_ess_mobile_app/features/more/domain/entities/ads_entity.dart'
    as _i36;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/ads_details_screen.dart'
    as _i1;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/ads_screen.dart'
    as _i2;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/more_screen.dart'
    as _i20;
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/screens/my_attendance_screen.dart'
    as _i21;
import 'package:kf_ess_mobile_app/features/navigation_bottom/navigation_bottom.dart'
    as _i22;
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart'
    as _i37;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/documents_screen.dart'
    as _i14;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/notification_details_screen.dart'
    as _i23;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/notifications_screen.dart'
    as _i24;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/sign_paci_screen.dart'
    as _i28;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/annual_leave_request_details_screen.dart'
    as _i3;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/requests_screen.dart'
    as _i26;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/training_request_details_screen.dart'
    as _i33;
import 'package:kf_ess_mobile_app/features/shared/screens/thank_you_screen.dart'
    as _i32;
import 'package:kf_ess_mobile_app/features/splash/presentation/screens/splash_screen.dart'
    as _i29;

/// generated route for
/// [_i1.AdsDetailsScreen]
class AdsDetailsRoute extends _i34.PageRouteInfo<AdsDetailsRouteArgs> {
  AdsDetailsRoute({
    _i35.Key? key,
    required _i36.AdsEntity adItem,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          AdsDetailsRoute.name,
          args: AdsDetailsRouteArgs(
            key: key,
            adItem: adItem,
          ),
          initialChildren: children,
        );

  static const String name = 'AdsDetailsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AdsDetailsRouteArgs>();
      return _i1.AdsDetailsScreen(
        key: args.key,
        adItem: args.adItem,
      );
    },
  );
}

class AdsDetailsRouteArgs {
  const AdsDetailsRouteArgs({
    this.key,
    required this.adItem,
  });

  final _i35.Key? key;

  final _i36.AdsEntity adItem;

  @override
  String toString() {
    return 'AdsDetailsRouteArgs{key: $key, adItem: $adItem}';
  }
}

/// generated route for
/// [_i2.AdsScreen]
class AdsRoute extends _i34.PageRouteInfo<void> {
  const AdsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i2.AdsScreen();
    },
  );
}

/// generated route for
/// [_i3.AnnualLeaveRequestDetailsScreen]
class AnnualLeaveRequestDetailsRoute extends _i34.PageRouteInfo<void> {
  const AnnualLeaveRequestDetailsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AnnualLeaveRequestDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnualLeaveRequestDetailsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i3.AnnualLeaveRequestDetailsScreen();
    },
  );
}

/// generated route for
/// [_i4.AuthScreen]
class AuthRoute extends _i34.PageRouteInfo<void> {
  const AuthRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i4.AuthScreen();
    },
  );
}

/// generated route for
/// [_i5.CertificateDetailsScreen]
class CertificateDetailsRoute extends _i34.PageRouteInfo<void> {
  const CertificateDetailsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CertificateDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CertificateDetailsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i5.CertificateDetailsScreen();
    },
  );
}

/// generated route for
/// [_i6.CertificatesScreen]
class CertificatesRoute extends _i34.PageRouteInfo<void> {
  const CertificatesRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CertificatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CertificatesRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i6.CertificatesScreen();
    },
  );
}

/// generated route for
/// [_i7.CreateAnnualLeaveRequestScreen]
class CreateAnnualLeaveRequestRoute
    extends _i34.PageRouteInfo<CreateAnnualLeaveRequestRouteArgs> {
  CreateAnnualLeaveRequestRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          CreateAnnualLeaveRequestRoute.name,
          args: CreateAnnualLeaveRequestRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateAnnualLeaveRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateAnnualLeaveRequestRouteArgs>(
          orElse: () => const CreateAnnualLeaveRequestRouteArgs());
      return _i7.CreateAnnualLeaveRequestScreen(key: args.key);
    },
  );
}

class CreateAnnualLeaveRequestRouteArgs {
  const CreateAnnualLeaveRequestRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'CreateAnnualLeaveRequestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.CreateEmergencyLeaveRequestScreen]
class CreateEmergencyLeaveRequestRoute
    extends _i34.PageRouteInfo<CreateEmergencyLeaveRequestRouteArgs> {
  CreateEmergencyLeaveRequestRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          CreateEmergencyLeaveRequestRoute.name,
          args: CreateEmergencyLeaveRequestRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateEmergencyLeaveRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEmergencyLeaveRequestRouteArgs>(
          orElse: () => const CreateEmergencyLeaveRequestRouteArgs());
      return _i8.CreateEmergencyLeaveRequestScreen(key: args.key);
    },
  );
}

class CreateEmergencyLeaveRequestRouteArgs {
  const CreateEmergencyLeaveRequestRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'CreateEmergencyLeaveRequestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.CreateInsuranceRequestScreen]
class CreateInsuranceRequestRoute extends _i34.PageRouteInfo<void> {
  const CreateInsuranceRequestRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CreateInsuranceRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateInsuranceRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i9.CreateInsuranceRequestScreen();
    },
  );
}

/// generated route for
/// [_i10.CreateLoanRequestScreen]
class CreateLoanRequestRoute extends _i34.PageRouteInfo<void> {
  const CreateLoanRequestRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CreateLoanRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateLoanRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i10.CreateLoanRequestScreen();
    },
  );
}

/// generated route for
/// [_i11.CreateRequestScreen]
class CreateRequestRoute extends _i34.PageRouteInfo<void> {
  const CreateRequestRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CreateRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i11.CreateRequestScreen();
    },
  );
}

/// generated route for
/// [_i12.CreateSickLeaveRequestScreen]
class CreateSickLeaveRequestRoute extends _i34.PageRouteInfo<void> {
  const CreateSickLeaveRequestRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CreateSickLeaveRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateSickLeaveRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i12.CreateSickLeaveRequestScreen();
    },
  );
}

/// generated route for
/// [_i13.CreateTrainingRequestScreen]
class CreateTrainingRequestRoute extends _i34.PageRouteInfo<void> {
  const CreateTrainingRequestRoute({List<_i34.PageRouteInfo>? children})
      : super(
          CreateTrainingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTrainingRequestRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i13.CreateTrainingRequestScreen();
    },
  );
}

/// generated route for
/// [_i14.DocumentsScreen]
class DocumentsRoute extends _i34.PageRouteInfo<DocumentsRouteArgs> {
  DocumentsRoute({
    _i35.Key? key,
    bool? isVerified,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          DocumentsRoute.name,
          args: DocumentsRouteArgs(
            key: key,
            isVerified: isVerified,
          ),
          initialChildren: children,
        );

  static const String name = 'DocumentsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DocumentsRouteArgs>(
          orElse: () => const DocumentsRouteArgs());
      return _i14.DocumentsScreen(
        key: args.key,
        isVerified: args.isVerified,
      );
    },
  );
}

class DocumentsRouteArgs {
  const DocumentsRouteArgs({
    this.key,
    this.isVerified,
  });

  final _i35.Key? key;

  final bool? isVerified;

  @override
  String toString() {
    return 'DocumentsRouteArgs{key: $key, isVerified: $isVerified}';
  }
}

/// generated route for
/// [_i15.EmptyRouterPage]
class EmptyRouterRoute extends _i34.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i34.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i15.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i16.ForgetPassScreen]
class ForgetPassRoute extends _i34.PageRouteInfo<void> {
  const ForgetPassRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ForgetPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPassRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i16.ForgetPassScreen();
    },
  );
}

/// generated route for
/// [_i17.ForgetPassVerifyOtpScreen]
class ForgetPassVerifyOtpRoute extends _i34.PageRouteInfo<void> {
  const ForgetPassVerifyOtpRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ForgetPassVerifyOtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPassVerifyOtpRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i17.ForgetPassVerifyOtpScreen();
    },
  );
}

/// generated route for
/// [_i18.HomeScreen]
class HomeRoute extends _i34.PageRouteInfo<void> {
  const HomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i18.HomeScreen();
    },
  );
}

/// generated route for
/// [_i19.InsuranceScreen]
class InsuranceRoute extends _i34.PageRouteInfo<void> {
  const InsuranceRoute({List<_i34.PageRouteInfo>? children})
      : super(
          InsuranceRoute.name,
          initialChildren: children,
        );

  static const String name = 'InsuranceRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i19.InsuranceScreen();
    },
  );
}

/// generated route for
/// [_i20.MoreScreen]
class MoreRoute extends _i34.PageRouteInfo<void> {
  const MoreRoute({List<_i34.PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i20.MoreScreen();
    },
  );
}

/// generated route for
/// [_i21.MyAttendanceScreen]
class MyAttendanceRoute extends _i34.PageRouteInfo<void> {
  const MyAttendanceRoute({List<_i34.PageRouteInfo>? children})
      : super(
          MyAttendanceRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyAttendanceRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i21.MyAttendanceScreen();
    },
  );
}

/// generated route for
/// [_i22.NavigationMainScreen]
class NavigationMainRoute extends _i34.PageRouteInfo<void> {
  const NavigationMainRoute({List<_i34.PageRouteInfo>? children})
      : super(
          NavigationMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationMainRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i22.NavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i23.NotificationDetailsScreen]
class NotificationDetailsRoute
    extends _i34.PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    _i35.Key? key,
    required _i37.NotificationsEntity notification,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          NotificationDetailsRoute.name,
          args: NotificationDetailsRouteArgs(
            key: key,
            notification: notification,
          ),
          initialChildren: children,
        );

  static const String name = 'NotificationDetailsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return _i23.NotificationDetailsScreen(
        key: args.key,
        notification: args.notification,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({
    this.key,
    required this.notification,
  });

  final _i35.Key? key;

  final _i37.NotificationsEntity notification;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{key: $key, notification: $notification}';
  }
}

/// generated route for
/// [_i24.NotificationsScreen]
class NotificationsRoute extends _i34.PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({
    _i35.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          NotificationsRoute.name,
          args: NotificationsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationsRouteArgs>(
          orElse: () => const NotificationsRouteArgs());
      return _i24.NotificationsScreen(key: args.key);
    },
  );
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({this.key});

  final _i35.Key? key;

  @override
  String toString() {
    return 'NotificationsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.PasswordChangedScreen]
class PasswordChangedRoute extends _i34.PageRouteInfo<void> {
  const PasswordChangedRoute({List<_i34.PageRouteInfo>? children})
      : super(
          PasswordChangedRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangedRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i25.PasswordChangedScreen();
    },
  );
}

/// generated route for
/// [_i26.RequestsScreen]
class RequestsRoute extends _i34.PageRouteInfo<void> {
  const RequestsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          RequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i26.RequestsScreen();
    },
  );
}

/// generated route for
/// [_i27.ResetPassScreen]
class ResetPassRoute extends _i34.PageRouteInfo<void> {
  const ResetPassRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ResetPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPassRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i27.ResetPassScreen();
    },
  );
}

/// generated route for
/// [_i28.SignPaciScreen]
class SignPaciRoute extends _i34.PageRouteInfo<void> {
  const SignPaciRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SignPaciRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignPaciRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i28.SignPaciScreen();
    },
  );
}

/// generated route for
/// [_i29.SplashScreen]
class SplashRoute extends _i34.PageRouteInfo<void> {
  const SplashRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i29.SplashScreen();
    },
  );
}

/// generated route for
/// [_i30.SubmissionsScreen]
class SubmissionsRoute extends _i34.PageRouteInfo<void> {
  const SubmissionsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SubmissionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubmissionsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i30.SubmissionsScreen();
    },
  );
}

/// generated route for
/// [_i31.SupervisorNavigationMainScreen]
class SupervisorNavigationMainRoute extends _i34.PageRouteInfo<void> {
  const SupervisorNavigationMainRoute({List<_i34.PageRouteInfo>? children})
      : super(
          SupervisorNavigationMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupervisorNavigationMainRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i31.SupervisorNavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i32.ThankYouScreen]
class ThankYouRoute extends _i34.PageRouteInfo<ThankYouRouteArgs> {
  ThankYouRoute({
    _i35.Key? key,
    String? title,
    String? subtitle,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          ThankYouRoute.name,
          args: ThankYouRouteArgs(
            key: key,
            title: title,
            subtitle: subtitle,
          ),
          initialChildren: children,
        );

  static const String name = 'ThankYouRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThankYouRouteArgs>(
          orElse: () => const ThankYouRouteArgs());
      return _i32.ThankYouScreen(
        key: args.key,
        title: args.title,
        subtitle: args.subtitle,
      );
    },
  );
}

class ThankYouRouteArgs {
  const ThankYouRouteArgs({
    this.key,
    this.title,
    this.subtitle,
  });

  final _i35.Key? key;

  final String? title;

  final String? subtitle;

  @override
  String toString() {
    return 'ThankYouRouteArgs{key: $key, title: $title, subtitle: $subtitle}';
  }
}

/// generated route for
/// [_i33.TrainingRequestDetailsScreen]
class TrainingRequestDetailsRoute extends _i34.PageRouteInfo<void> {
  const TrainingRequestDetailsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TrainingRequestDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainingRequestDetailsRoute';

  static _i34.PageInfo page = _i34.PageInfo(
    name,
    builder: (data) {
      return const _i33.TrainingRequestDetailsScreen();
    },
  );
}
