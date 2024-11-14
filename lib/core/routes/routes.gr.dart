// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/material.dart' as _i28;
import 'package:kf_ess_mobile_app/core/routes/routes.dart' as _i12;
import 'package:kf_ess_mobile_app/features/auth/presentation/screens/auth_screen.dart'
    as _i2;
import 'package:kf_ess_mobile_app/features/certificates/presentation/screens/certificate_details_screen.dart'
    as _i3;
import 'package:kf_ess_mobile_app/features/certificates/presentation/screens/certificates_screen.dart'
    as _i4;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_annual_leave_request_screen.dart'
    as _i5;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_emergency_leave_request_screen.dart'
    as _i6;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_insurance_request_screen.dart'
    as _i7;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_loan_request_screen.dart'
    as _i8;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_request_screen.dart'
    as _i9;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_sick_leave_request_screen.dart'
    as _i10;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_training_request_screen.dart'
    as _i11;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/forget_pass_screen.dart'
    as _i13;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/forget_pass_verify_otp_screen.dart'
    as _i14;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/password_changed_screen.dart'
    as _i21;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/reset_pass_screen.dart'
    as _i23;
import 'package:kf_ess_mobile_app/features/home/presentation/screens/home_screen.dart'
    as _i15;
import 'package:kf_ess_mobile_app/features/insurance/presentation/screens/insurance_screen.dart'
    as _i16;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/more_screen.dart'
    as _i17;
import 'package:kf_ess_mobile_app/features/navigation_bottom/navigation_bottom.dart'
    as _i18;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/notification_details_screen.dart'
    as _i19;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/notifications_screen.dart'
    as _i20;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/annual_leave_request_details_screen.dart'
    as _i1;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/requests_screen.dart'
    as _i22;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/training_request_details_screen.dart'
    as _i26;
import 'package:kf_ess_mobile_app/features/shared/screens/thank_you_screen.dart'
    as _i25;
import 'package:kf_ess_mobile_app/features/splash/presentation/screens/splash_screen.dart'
    as _i24;

/// generated route for
/// [_i1.AnnualLeaveRequestDetailsScreen]
class AnnualLeaveRequestDetailsRoute extends _i27.PageRouteInfo<void> {
  const AnnualLeaveRequestDetailsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          AnnualLeaveRequestDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnnualLeaveRequestDetailsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i1.AnnualLeaveRequestDetailsScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i27.PageRouteInfo<void> {
  const AuthRoute({List<_i27.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthScreen();
    },
  );
}

/// generated route for
/// [_i3.CertificateDetailsScreen]
class CertificateDetailsRoute extends _i27.PageRouteInfo<void> {
  const CertificateDetailsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CertificateDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CertificateDetailsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i3.CertificateDetailsScreen();
    },
  );
}

/// generated route for
/// [_i4.CertificatesScreen]
class CertificatesRoute extends _i27.PageRouteInfo<void> {
  const CertificatesRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CertificatesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CertificatesRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i4.CertificatesScreen();
    },
  );
}

/// generated route for
/// [_i5.CreateAnnualLeaveRequestScreen]
class CreateAnnualLeaveRequestRoute
    extends _i27.PageRouteInfo<CreateAnnualLeaveRequestRouteArgs> {
  CreateAnnualLeaveRequestRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CreateAnnualLeaveRequestRoute.name,
          args: CreateAnnualLeaveRequestRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateAnnualLeaveRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateAnnualLeaveRequestRouteArgs>(
          orElse: () => const CreateAnnualLeaveRequestRouteArgs());
      return _i5.CreateAnnualLeaveRequestScreen(key: args.key);
    },
  );
}

class CreateAnnualLeaveRequestRouteArgs {
  const CreateAnnualLeaveRequestRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'CreateAnnualLeaveRequestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.CreateEmergencyLeaveRequestScreen]
class CreateEmergencyLeaveRequestRoute
    extends _i27.PageRouteInfo<CreateEmergencyLeaveRequestRouteArgs> {
  CreateEmergencyLeaveRequestRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CreateEmergencyLeaveRequestRoute.name,
          args: CreateEmergencyLeaveRequestRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'CreateEmergencyLeaveRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEmergencyLeaveRequestRouteArgs>(
          orElse: () => const CreateEmergencyLeaveRequestRouteArgs());
      return _i6.CreateEmergencyLeaveRequestScreen(key: args.key);
    },
  );
}

class CreateEmergencyLeaveRequestRouteArgs {
  const CreateEmergencyLeaveRequestRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'CreateEmergencyLeaveRequestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.CreateInsuranceRequestScreen]
class CreateInsuranceRequestRoute extends _i27.PageRouteInfo<void> {
  const CreateInsuranceRequestRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CreateInsuranceRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateInsuranceRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i7.CreateInsuranceRequestScreen();
    },
  );
}

/// generated route for
/// [_i8.CreateLoanRequestScreen]
class CreateLoanRequestRoute extends _i27.PageRouteInfo<void> {
  const CreateLoanRequestRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CreateLoanRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateLoanRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i8.CreateLoanRequestScreen();
    },
  );
}

/// generated route for
/// [_i9.CreateRequestScreen]
class CreateRequestRoute extends _i27.PageRouteInfo<void> {
  const CreateRequestRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CreateRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i9.CreateRequestScreen();
    },
  );
}

/// generated route for
/// [_i10.CreateSickLeaveRequestScreen]
class CreateSickLeaveRequestRoute extends _i27.PageRouteInfo<void> {
  const CreateSickLeaveRequestRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CreateSickLeaveRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateSickLeaveRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i10.CreateSickLeaveRequestScreen();
    },
  );
}

/// generated route for
/// [_i11.CreateTrainingRequestScreen]
class CreateTrainingRequestRoute extends _i27.PageRouteInfo<void> {
  const CreateTrainingRequestRoute({List<_i27.PageRouteInfo>? children})
      : super(
          CreateTrainingRequestRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateTrainingRequestRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i11.CreateTrainingRequestScreen();
    },
  );
}

/// generated route for
/// [_i12.EmptyRouterPage]
class EmptyRouterRoute extends _i27.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i27.PageRouteInfo>? children})
      : super(
          EmptyRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouterRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i12.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i13.ForgetPassScreen]
class ForgetPassRoute extends _i27.PageRouteInfo<void> {
  const ForgetPassRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ForgetPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPassRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i13.ForgetPassScreen();
    },
  );
}

/// generated route for
/// [_i14.ForgetPassVerifyOtpScreen]
class ForgetPassVerifyOtpRoute extends _i27.PageRouteInfo<void> {
  const ForgetPassVerifyOtpRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ForgetPassVerifyOtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgetPassVerifyOtpRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i14.ForgetPassVerifyOtpScreen();
    },
  );
}

/// generated route for
/// [_i15.HomeScreen]
class HomeRoute extends _i27.PageRouteInfo<void> {
  const HomeRoute({List<_i27.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i15.HomeScreen();
    },
  );
}

/// generated route for
/// [_i16.InsuranceScreen]
class InsuranceRoute extends _i27.PageRouteInfo<void> {
  const InsuranceRoute({List<_i27.PageRouteInfo>? children})
      : super(
          InsuranceRoute.name,
          initialChildren: children,
        );

  static const String name = 'InsuranceRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i16.InsuranceScreen();
    },
  );
}

/// generated route for
/// [_i17.MoreScreen]
class MoreRoute extends _i27.PageRouteInfo<void> {
  const MoreRoute({List<_i27.PageRouteInfo>? children})
      : super(
          MoreRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoreRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i17.MoreScreen();
    },
  );
}

/// generated route for
/// [_i18.NavigationMainScreen]
class NavigationMainRoute extends _i27.PageRouteInfo<void> {
  const NavigationMainRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NavigationMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationMainRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i18.NavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i19.NotificationDetailsScreen]
class NotificationDetailsRoute extends _i27.PageRouteInfo<void> {
  const NotificationDetailsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NotificationDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationDetailsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i19.NotificationDetailsScreen();
    },
  );
}

/// generated route for
/// [_i20.NotificationsScreen]
class NotificationsRoute extends _i27.PageRouteInfo<void> {
  const NotificationsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i20.NotificationsScreen();
    },
  );
}

/// generated route for
/// [_i21.PasswordChangedScreen]
class PasswordChangedRoute extends _i27.PageRouteInfo<void> {
  const PasswordChangedRoute({List<_i27.PageRouteInfo>? children})
      : super(
          PasswordChangedRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordChangedRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i21.PasswordChangedScreen();
    },
  );
}

/// generated route for
/// [_i22.RequestsScreen]
class RequestsRoute extends _i27.PageRouteInfo<void> {
  const RequestsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          RequestsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i22.RequestsScreen();
    },
  );
}

/// generated route for
/// [_i23.ResetPassScreen]
class ResetPassRoute extends _i27.PageRouteInfo<void> {
  const ResetPassRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ResetPassRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPassRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i23.ResetPassScreen();
    },
  );
}

/// generated route for
/// [_i24.SplashScreen]
class SplashRoute extends _i27.PageRouteInfo<void> {
  const SplashRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i24.SplashScreen();
    },
  );
}

/// generated route for
/// [_i25.ThankYouScreen]
class ThankYouRoute extends _i27.PageRouteInfo<ThankYouRouteArgs> {
  ThankYouRoute({
    _i28.Key? key,
    String? title,
    String? subtitle,
    List<_i27.PageRouteInfo>? children,
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

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThankYouRouteArgs>(
          orElse: () => const ThankYouRouteArgs());
      return _i25.ThankYouScreen(
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

  final _i28.Key? key;

  final String? title;

  final String? subtitle;

  @override
  String toString() {
    return 'ThankYouRouteArgs{key: $key, title: $title, subtitle: $subtitle}';
  }
}

/// generated route for
/// [_i26.TrainingRequestDetailsScreen]
class TrainingRequestDetailsRoute extends _i27.PageRouteInfo<void> {
  const TrainingRequestDetailsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          TrainingRequestDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TrainingRequestDetailsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return const _i26.TrainingRequestDetailsScreen();
    },
  );
}
