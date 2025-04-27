// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i46;
import 'package:flutter/foundation.dart' as _i49;
import 'package:flutter/material.dart' as _i47;
import 'package:kf_ess_mobile_app/core/routes/routes.dart' as _i24;
import 'package:kf_ess_mobile_app/features/about/presentation/screens/about_screen.dart'
    as _i1;
import 'package:kf_ess_mobile_app/features/about/presentation/screens/about_screen_details.dart';
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/screens/create_annual_leave_request_screen.dart'
    as _i13;
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/presentation/screens/director_dept_assignment_screen.dart'
    as _i17;
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/screens/director_dept_mission_screen.dart'
    as _i18;
import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/presentation/screens/director_home_screen.dart'
    as _i6;
import 'package:kf_ess_mobile_app/features/as_director/director_navigation_bottom/director_navigation_bottom.dart'
    as _i19;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/screens/submissions_screen.dart'
    as _i41;
import 'package:kf_ess_mobile_app/features/as_supervisor/supervisor_navigation_bottom/supervisor_navigation_bottom.dart'
    as _i42;
import 'package:kf_ess_mobile_app/features/auth/presentation/screens/auth_screen.dart'
    as _i9;
import 'package:kf_ess_mobile_app/features/certificates/presentation/screens/certificate_details_screen.dart';
import 'package:kf_ess_mobile_app/features/certificates/presentation/screens/certificates_screen.dart'
    as _i10;
import 'package:kf_ess_mobile_app/features/chat_bot/presentation/screens/chat_bot_screen.dart'
    as _i11;
import 'package:kf_ess_mobile_app/features/contactus/presentation/screens/contactus_screen.dart'
    as _i12;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_request_screen.dart'
    as _i15;
import 'package:kf_ess_mobile_app/features/create_request/presentation/screens/create_sick_leave_request_screen.dart'
    as _i16;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/screens/create_emergency_leave_request_screen.dart'
    as _i14;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/forget_pass_screen.dart'
    as _i27;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/forget_pass_verify_otp_screen.dart'
    as _i28;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/password_changed_screen.dart';
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/screens/reset_pass_screen.dart'
    as _i40;
import 'package:kf_ess_mobile_app/features/home/presentation/screens/home_screen.dart'
    as _i29;
import 'package:kf_ess_mobile_app/features/more/domain/entities/ads_entity.dart'
    as _i48;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/ads_details_screen.dart'
    as _i7;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/ads_screen.dart'
    as _i8;
import 'package:kf_ess_mobile_app/features/more/presentation/screens/more_screen.dart'
    as _i30;
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/screens/my_attendance_screen.dart'
    as _i31;
import 'package:kf_ess_mobile_app/features/navigation_bottom/navigation_bottom.dart'
    as _i32;
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart'
    as _i51;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/notification_details_screen.dart'
    as _i33;
import 'package:kf_ess_mobile_app/features/notifications/presentation/screens/notifications_screen.dart'
    as _i34;
import 'package:kf_ess_mobile_app/features/operations/presentation/screens/operations_screen.dart'
    as _i35;
import 'package:kf_ess_mobile_app/features/peraonal_info/presentation/screens/personal_info_screen.dart'
    as _i36;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/add_family_screen.dart'
    as _i2;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/add_qualifcation_screen.dart'
    as _i3;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/add_work_screen.dart'
    as _i4;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/address_screen.dart'
    as _i5;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/edit_address_screen.dart'
    as _i20;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/edit_child_data_screen.dart'
    as _i21;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/edit_profile_screen.dart'
    as _i22;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/edit_spouse_data_screen.dart'
    as _i23;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/family_screen.dart'
    as _i26;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/profile_screen.dart'
    as _i37;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/qualifications_screen.dart'
    as _i38;
import 'package:kf_ess_mobile_app/features/profile/presentation/screens/work_screen.dart'
    as _i45;
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart'
    as _i50;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/extend_leave_request_details_screen.dart'
    as _i25;
import 'package:kf_ess_mobile_app/features/requests/presentation/screens/requests_screen.dart'
    as _i39;
import 'package:kf_ess_mobile_app/features/shared/screens/thank_you_screen.dart';
import 'package:kf_ess_mobile_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:kf_ess_mobile_app/features/survey/presentation/screens/survey_screen.dart'
    as _i43;
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/screens/visitors_logs_screen.dart'
    as _i44;

/// generated route for
/// [AboutItemDetailsScreen]
class AboutItemDetailsRoute
    extends _i46.PageRouteInfo<AboutItemDetailsRouteArgs> {
  AboutItemDetailsRoute({
    _i47.Key? key,
    required String details,
    required String title,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         AboutItemDetailsRoute.name,
         args: AboutItemDetailsRouteArgs(
           key: key,
           details: details,
           title: title,
         ),
         initialChildren: children,
       );

  static const String name = 'AboutItemDetailsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AboutItemDetailsRouteArgs>();
      return AboutItemDetailsScreen(
        key: args.key,
        details: args.details,
        title: args.title,
      );
    },
  );
}

class AboutItemDetailsRouteArgs {
  const AboutItemDetailsRouteArgs({
    this.key,
    required this.details,
    required this.title,
  });

  final _i47.Key? key;

  final String details;

  final String title;

  @override
  String toString() {
    return 'AboutItemDetailsRouteArgs{key: $key, details: $details, title: $title}';
  }
}

/// generated route for
/// [_i1.AboutScreen]
class AboutRoute extends _i46.PageRouteInfo<void> {
  const AboutRoute({List<_i46.PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutScreen();
    },
  );
}

/// generated route for
/// [_i2.AddFamilyScreen]
class AddFamilyRoute extends _i46.PageRouteInfo<AddFamilyRouteArgs> {
  AddFamilyRoute({
    _i47.Key? key,
    String? id,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         AddFamilyRoute.name,
         args: AddFamilyRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'AddFamilyRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddFamilyRouteArgs>(
        orElse: () => const AddFamilyRouteArgs(),
      );
      return _i2.AddFamilyScreen(key: args.key, id: args.id);
    },
  );
}

class AddFamilyRouteArgs {
  const AddFamilyRouteArgs({this.key, this.id});

  final _i47.Key? key;

  final String? id;

  @override
  String toString() {
    return 'AddFamilyRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.AddQualificationScreen]
class AddQualificationRoute extends _i46.PageRouteInfo<void> {
  const AddQualificationRoute({List<_i46.PageRouteInfo>? children})
    : super(AddQualificationRoute.name, initialChildren: children);

  static const String name = 'AddQualificationRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddQualificationScreen();
    },
  );
}

/// generated route for
/// [_i4.AddWorkScreen]
class AddWorkRoute extends _i46.PageRouteInfo<void> {
  const AddWorkRoute({List<_i46.PageRouteInfo>? children})
    : super(AddWorkRoute.name, initialChildren: children);

  static const String name = 'AddWorkRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i4.AddWorkScreen();
    },
  );
}

/// generated route for
/// [_i5.AddressScreen]
class AddressRoute extends _i46.PageRouteInfo<void> {
  const AddressRoute({List<_i46.PageRouteInfo>? children})
    : super(AddressRoute.name, initialChildren: children);

  static const String name = 'AddressRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i5.AddressScreen();
    },
  );
}

/// generated route for
/// [_i6.AdminHomeScreen]
class AdminHomeRoute extends _i46.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i46.PageRouteInfo>? children})
    : super(AdminHomeRoute.name, initialChildren: children);

  static const String name = 'AdminHomeRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i6.AdminHomeScreen();
    },
  );
}

/// generated route for
/// [_i7.AdsDetailsScreen]
class AdsDetailsRoute extends _i46.PageRouteInfo<AdsDetailsRouteArgs> {
  AdsDetailsRoute({
    _i47.Key? key,
    required _i48.AdsEntity adItem,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         AdsDetailsRoute.name,
         args: AdsDetailsRouteArgs(key: key, adItem: adItem),
         initialChildren: children,
       );

  static const String name = 'AdsDetailsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AdsDetailsRouteArgs>();
      return _i7.AdsDetailsScreen(key: args.key, adItem: args.adItem);
    },
  );
}

class AdsDetailsRouteArgs {
  const AdsDetailsRouteArgs({this.key, required this.adItem});

  final _i47.Key? key;

  final _i48.AdsEntity adItem;

  @override
  String toString() {
    return 'AdsDetailsRouteArgs{key: $key, adItem: $adItem}';
  }
}

/// generated route for
/// [_i8.AdsScreen]
class AdsRoute extends _i46.PageRouteInfo<void> {
  const AdsRoute({List<_i46.PageRouteInfo>? children})
    : super(AdsRoute.name, initialChildren: children);

  static const String name = 'AdsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i8.AdsScreen();
    },
  );
}

/// generated route for
/// [_i9.AuthScreen]
class AuthRoute extends _i46.PageRouteInfo<void> {
  const AuthRoute({List<_i46.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i9.AuthScreen();
    },
  );
}

/// generated route for
/// [CertificateDetailsScreen]
class CertificateDetailsRoute
    extends _i46.PageRouteInfo<CertificateDetailsRouteArgs> {
  CertificateDetailsRoute({
    _i49.Key? key,
    required String certificatePdf,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         CertificateDetailsRoute.name,
         args: CertificateDetailsRouteArgs(
           key: key,
           certificatePdf: certificatePdf,
         ),
         initialChildren: children,
       );

  static const String name = 'CertificateDetailsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CertificateDetailsRouteArgs>();
      return CertificateDetailsScreen(
        key: args.key,
        certificatePdf: args.certificatePdf,
      );
    },
  );
}

class CertificateDetailsRouteArgs {
  const CertificateDetailsRouteArgs({this.key, required this.certificatePdf});

  final _i49.Key? key;

  final String certificatePdf;

  @override
  String toString() {
    return 'CertificateDetailsRouteArgs{key: $key, certificatePdf: $certificatePdf}';
  }
}

/// generated route for
/// [_i10.CertificatesScreen]
class CertificatesRoute extends _i46.PageRouteInfo<void> {
  const CertificatesRoute({List<_i46.PageRouteInfo>? children})
    : super(CertificatesRoute.name, initialChildren: children);

  static const String name = 'CertificatesRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i10.CertificatesScreen();
    },
  );
}

/// generated route for
/// [_i11.ChatBotScreen]
class ChatBotRoute extends _i46.PageRouteInfo<void> {
  const ChatBotRoute({List<_i46.PageRouteInfo>? children})
    : super(ChatBotRoute.name, initialChildren: children);

  static const String name = 'ChatBotRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i11.ChatBotScreen();
    },
  );
}

/// generated route for
/// [_i12.ContactUsScreen]
class ContactUsRoute extends _i46.PageRouteInfo<void> {
  const ContactUsRoute({List<_i46.PageRouteInfo>? children})
    : super(ContactUsRoute.name, initialChildren: children);

  static const String name = 'ContactUsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i12.ContactUsScreen();
    },
  );
}

/// generated route for
/// [_i13.CreateAnnualLeaveRequestScreen]
class CreateAnnualLeaveRequestRoute
    extends _i46.PageRouteInfo<CreateAnnualLeaveRequestRouteArgs> {
  CreateAnnualLeaveRequestRoute({
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         CreateAnnualLeaveRequestRoute.name,
         args: CreateAnnualLeaveRequestRouteArgs(key: key),
         initialChildren: children,
       );

  static const String name = 'CreateAnnualLeaveRequestRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateAnnualLeaveRequestRouteArgs>(
        orElse: () => const CreateAnnualLeaveRequestRouteArgs(),
      );
      return _i13.CreateAnnualLeaveRequestScreen(key: args.key);
    },
  );
}

class CreateAnnualLeaveRequestRouteArgs {
  const CreateAnnualLeaveRequestRouteArgs({this.key});

  final _i47.Key? key;

  @override
  String toString() {
    return 'CreateAnnualLeaveRequestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i14.CreateEmergencyLeaveRequestScreen]
class CreateEmergencyLeaveRequestRoute
    extends _i46.PageRouteInfo<CreateEmergencyLeaveRequestRouteArgs> {
  CreateEmergencyLeaveRequestRoute({
    _i47.Key? key,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         CreateEmergencyLeaveRequestRoute.name,
         args: CreateEmergencyLeaveRequestRouteArgs(key: key),
         initialChildren: children,
       );

  static const String name = 'CreateEmergencyLeaveRequestRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateEmergencyLeaveRequestRouteArgs>(
        orElse: () => const CreateEmergencyLeaveRequestRouteArgs(),
      );
      return _i14.CreateEmergencyLeaveRequestScreen(key: args.key);
    },
  );
}

class CreateEmergencyLeaveRequestRouteArgs {
  const CreateEmergencyLeaveRequestRouteArgs({this.key});

  final _i47.Key? key;

  @override
  String toString() {
    return 'CreateEmergencyLeaveRequestRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i15.CreateRequestScreen]
class CreateRequestRoute extends _i46.PageRouteInfo<void> {
  const CreateRequestRoute({List<_i46.PageRouteInfo>? children})
    : super(CreateRequestRoute.name, initialChildren: children);

  static const String name = 'CreateRequestRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i15.CreateRequestScreen();
    },
  );
}

/// generated route for
/// [_i16.CreateSickLeaveRequestScreen]
class CreateSickLeaveRequestRoute extends _i46.PageRouteInfo<void> {
  const CreateSickLeaveRequestRoute({List<_i46.PageRouteInfo>? children})
    : super(CreateSickLeaveRequestRoute.name, initialChildren: children);

  static const String name = 'CreateSickLeaveRequestRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i16.CreateSickLeaveRequestScreen();
    },
  );
}

/// generated route for
/// [_i17.DirectorDeptAssignmentScreen]
class DirectorDeptAssignmentRoute extends _i46.PageRouteInfo<void> {
  const DirectorDeptAssignmentRoute({List<_i46.PageRouteInfo>? children})
    : super(DirectorDeptAssignmentRoute.name, initialChildren: children);

  static const String name = 'DirectorDeptAssignmentRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i17.DirectorDeptAssignmentScreen();
    },
  );
}

/// generated route for
/// [_i18.DirectorDeptMissionScreen]
class DirectorDeptMissionRoute extends _i46.PageRouteInfo<void> {
  const DirectorDeptMissionRoute({List<_i46.PageRouteInfo>? children})
    : super(DirectorDeptMissionRoute.name, initialChildren: children);

  static const String name = 'DirectorDeptMissionRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i18.DirectorDeptMissionScreen();
    },
  );
}

/// generated route for
/// [_i19.DirectorNavigationMainScreen]
class DirectorNavigationMainRoute extends _i46.PageRouteInfo<void> {
  const DirectorNavigationMainRoute({List<_i46.PageRouteInfo>? children})
    : super(DirectorNavigationMainRoute.name, initialChildren: children);

  static const String name = 'DirectorNavigationMainRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i19.DirectorNavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i20.EditAddressScreen]
class EditAddressRoute extends _i46.PageRouteInfo<void> {
  const EditAddressRoute({List<_i46.PageRouteInfo>? children})
    : super(EditAddressRoute.name, initialChildren: children);

  static const String name = 'EditAddressRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i20.EditAddressScreen();
    },
  );
}

/// generated route for
/// [_i21.EditChildDataScreen]
class EditChildDataRoute extends _i46.PageRouteInfo<EditChildDataRouteArgs> {
  EditChildDataRoute({
    _i47.Key? key,
    String? id,
    String? name,
    String? civilId,
    String? birthDate,
    String? gender,
    String? disabilityDate,
    String? disabilityType,
    String? fileExtension,
    String? bytes,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         EditChildDataRoute.name,
         args: EditChildDataRouteArgs(
           key: key,
           id: id,
           name: name,
           civilId: civilId,
           birthDate: birthDate,
           gender: gender,
           disabilityDate: disabilityDate,
           disabilityType: disabilityType,
           fileExtension: fileExtension,
           bytes: bytes,
         ),
         initialChildren: children,
       );

  static const String name = 'EditChildDataRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditChildDataRouteArgs>(
        orElse: () => const EditChildDataRouteArgs(),
      );
      return _i21.EditChildDataScreen(
        key: args.key,
        id: args.id,
        name: args.name,
        civilId: args.civilId,
        birthDate: args.birthDate,
        gender: args.gender,
        disabilityDate: args.disabilityDate,
        disabilityType: args.disabilityType,
        fileExtension: args.fileExtension,
        bytes: args.bytes,
      );
    },
  );
}

class EditChildDataRouteArgs {
  const EditChildDataRouteArgs({
    this.key,
    this.id,
    this.name,
    this.civilId,
    this.birthDate,
    this.gender,
    this.disabilityDate,
    this.disabilityType,
    this.fileExtension,
    this.bytes,
  });

  final _i47.Key? key;

  final String? id;

  final String? name;

  final String? civilId;

  final String? birthDate;

  final String? gender;

  final String? disabilityDate;

  final String? disabilityType;

  final String? fileExtension;

  final String? bytes;

  @override
  String toString() {
    return 'EditChildDataRouteArgs{key: $key, id: $id, name: $name, civilId: $civilId, birthDate: $birthDate, gender: $gender, disabilityDate: $disabilityDate, disabilityType: $disabilityType, fileExtension: $fileExtension, bytes: $bytes}';
  }
}

/// generated route for
/// [_i22.EditProfileScreen]
class EditProfileRoute extends _i46.PageRouteInfo<void> {
  const EditProfileRoute({List<_i46.PageRouteInfo>? children})
    : super(EditProfileRoute.name, initialChildren: children);

  static const String name = 'EditProfileRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i22.EditProfileScreen();
    },
  );
}

/// generated route for
/// [_i23.EditSpouseDataScreen]
class EditSpouseDataRoute extends _i46.PageRouteInfo<EditSpouseDataRouteArgs> {
  EditSpouseDataRoute({
    _i47.Key? key,
    String? id,
    String? name,
    String? civilID,
    String? birthDate,
    String? maritalStatus,
    String? maritalDate,
    String? fileExtention,
    String? bytes,
    String? selectedStatus,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         EditSpouseDataRoute.name,
         args: EditSpouseDataRouteArgs(
           key: key,
           id: id,
           name: name,
           civilID: civilID,
           birthDate: birthDate,
           maritalStatus: maritalStatus,
           maritalDate: maritalDate,
           fileExtention: fileExtention,
           bytes: bytes,
           selectedStatus: selectedStatus,
         ),
         initialChildren: children,
       );

  static const String name = 'EditSpouseDataRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditSpouseDataRouteArgs>(
        orElse: () => const EditSpouseDataRouteArgs(),
      );
      return _i23.EditSpouseDataScreen(
        key: args.key,
        id: args.id,
        name: args.name,
        civilID: args.civilID,
        birthDate: args.birthDate,
        maritalStatus: args.maritalStatus,
        maritalDate: args.maritalDate,
        fileExtention: args.fileExtention,
        bytes: args.bytes,
        selectedStatus: args.selectedStatus,
      );
    },
  );
}

class EditSpouseDataRouteArgs {
  const EditSpouseDataRouteArgs({
    this.key,
    this.id,
    this.name,
    this.civilID,
    this.birthDate,
    this.maritalStatus,
    this.maritalDate,
    this.fileExtention,
    this.bytes,
    this.selectedStatus,
  });

  final _i47.Key? key;

  final String? id;

  final String? name;

  final String? civilID;

  final String? birthDate;

  final String? maritalStatus;

  final String? maritalDate;

  final String? fileExtention;

  final String? bytes;

  final String? selectedStatus;

  @override
  String toString() {
    return 'EditSpouseDataRouteArgs{key: $key, id: $id, name: $name, civilID: $civilID, birthDate: $birthDate, maritalStatus: $maritalStatus, maritalDate: $maritalDate, fileExtention: $fileExtention, bytes: $bytes, selectedStatus: $selectedStatus}';
  }
}

/// generated route for
/// [_i24.EmptyRouterPage]
class EmptyRouterRoute extends _i46.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i46.PageRouteInfo>? children})
    : super(EmptyRouterRoute.name, initialChildren: children);

  static const String name = 'EmptyRouterRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i24.EmptyRouterPage();
    },
  );
}

/// generated route for
/// [_i24.EmptyRouterPage2]
class EmptyRouterRoute2 extends _i46.PageRouteInfo<void> {
  const EmptyRouterRoute2({List<_i46.PageRouteInfo>? children})
    : super(EmptyRouterRoute2.name, initialChildren: children);

  static const String name = 'EmptyRouterRoute2';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i24.EmptyRouterPage2();
    },
  );
}

/// generated route for
/// [_i24.EmptyRouterPage3]
class EmptyRouterRoute3 extends _i46.PageRouteInfo<void> {
  const EmptyRouterRoute3({List<_i46.PageRouteInfo>? children})
    : super(EmptyRouterRoute3.name, initialChildren: children);

  static const String name = 'EmptyRouterRoute3';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i24.EmptyRouterPage3();
    },
  );
}

/// generated route for
/// [_i24.EmptyRouterPage4]
class EmptyRouterRoute4 extends _i46.PageRouteInfo<void> {
  const EmptyRouterRoute4({List<_i46.PageRouteInfo>? children})
    : super(EmptyRouterRoute4.name, initialChildren: children);

  static const String name = 'EmptyRouterRoute4';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i24.EmptyRouterPage4();
    },
  );
}

/// generated route for
/// [_i25.ExtendLeaveDetailsScreen]
class ExtendLeaveDetailsRoute
    extends _i46.PageRouteInfo<ExtendLeaveDetailsRouteArgs> {
  ExtendLeaveDetailsRoute({
    _i47.Key? key,
    _i50.RequestsEntity? requestsEntity,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ExtendLeaveDetailsRoute.name,
         args: ExtendLeaveDetailsRouteArgs(
           key: key,
           requestsEntity: requestsEntity,
         ),
         initialChildren: children,
       );

  static const String name = 'ExtendLeaveDetailsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExtendLeaveDetailsRouteArgs>(
        orElse: () => const ExtendLeaveDetailsRouteArgs(),
      );
      return _i25.ExtendLeaveDetailsScreen(
        key: args.key,
        requestsEntity: args.requestsEntity,
      );
    },
  );
}

class ExtendLeaveDetailsRouteArgs {
  const ExtendLeaveDetailsRouteArgs({this.key, this.requestsEntity});

  final _i47.Key? key;

  final _i50.RequestsEntity? requestsEntity;

  @override
  String toString() {
    return 'ExtendLeaveDetailsRouteArgs{key: $key, requestsEntity: $requestsEntity}';
  }
}

/// generated route for
/// [_i26.FamilyScreen]
class FamilyRoute extends _i46.PageRouteInfo<FamilyRouteArgs> {
  FamilyRoute({_i47.Key? key, String? id, List<_i46.PageRouteInfo>? children})
    : super(
        FamilyRoute.name,
        args: FamilyRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'FamilyRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FamilyRouteArgs>(
        orElse: () => const FamilyRouteArgs(),
      );
      return _i26.FamilyScreen(key: args.key, id: args.id);
    },
  );
}

class FamilyRouteArgs {
  const FamilyRouteArgs({this.key, this.id});

  final _i47.Key? key;

  final String? id;

  @override
  String toString() {
    return 'FamilyRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i27.ForgetPassScreen]
class ForgetPassRoute extends _i46.PageRouteInfo<void> {
  const ForgetPassRoute({List<_i46.PageRouteInfo>? children})
    : super(ForgetPassRoute.name, initialChildren: children);

  static const String name = 'ForgetPassRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i27.ForgetPassScreen();
    },
  );
}

/// generated route for
/// [_i28.ForgetPassVerifyOtpScreen]
class ForgetPassVerifyOtpRoute extends _i46.PageRouteInfo<void> {
  const ForgetPassVerifyOtpRoute({List<_i46.PageRouteInfo>? children})
    : super(ForgetPassVerifyOtpRoute.name, initialChildren: children);

  static const String name = 'ForgetPassVerifyOtpRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i28.ForgetPassVerifyOtpScreen();
    },
  );
}

/// generated route for
/// [_i29.HomeScreen]
class HomeRoute extends _i46.PageRouteInfo<void> {
  const HomeRoute({List<_i46.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i29.HomeScreen();
    },
  );
}

/// generated route for
/// [_i30.MoreScreen]
class MoreRoute extends _i46.PageRouteInfo<void> {
  const MoreRoute({List<_i46.PageRouteInfo>? children})
    : super(MoreRoute.name, initialChildren: children);

  static const String name = 'MoreRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i30.MoreScreen();
    },
  );
}

/// generated route for
/// [_i31.MyAttendanceScreen]
class MyAttendanceRoute extends _i46.PageRouteInfo<void> {
  const MyAttendanceRoute({List<_i46.PageRouteInfo>? children})
    : super(MyAttendanceRoute.name, initialChildren: children);

  static const String name = 'MyAttendanceRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i31.MyAttendanceScreen();
    },
  );
}

/// generated route for
/// [_i32.NavigationMainScreen]
class NavigationMainRoute extends _i46.PageRouteInfo<void> {
  const NavigationMainRoute({List<_i46.PageRouteInfo>? children})
    : super(NavigationMainRoute.name, initialChildren: children);

  static const String name = 'NavigationMainRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i32.NavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i33.NotificationDetailsScreen]
class NotificationDetailsRoute
    extends _i46.PageRouteInfo<NotificationDetailsRouteArgs> {
  NotificationDetailsRoute({
    _i47.Key? key,
    required _i51.NotificationsEntity notification,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         NotificationDetailsRoute.name,
         args: NotificationDetailsRouteArgs(
           key: key,
           notification: notification,
         ),
         initialChildren: children,
       );

  static const String name = 'NotificationDetailsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationDetailsRouteArgs>();
      return _i33.NotificationDetailsScreen(
        key: args.key,
        notification: args.notification,
      );
    },
  );
}

class NotificationDetailsRouteArgs {
  const NotificationDetailsRouteArgs({this.key, required this.notification});

  final _i47.Key? key;

  final _i51.NotificationsEntity notification;

  @override
  String toString() {
    return 'NotificationDetailsRouteArgs{key: $key, notification: $notification}';
  }
}

/// generated route for
/// [_i34.NotificationsScreen]
class NotificationsRoute extends _i46.PageRouteInfo<NotificationsRouteArgs> {
  NotificationsRoute({_i47.Key? key, List<_i46.PageRouteInfo>? children})
    : super(
        NotificationsRoute.name,
        args: NotificationsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'NotificationsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotificationsRouteArgs>(
        orElse: () => const NotificationsRouteArgs(),
      );
      return _i34.NotificationsScreen(key: args.key);
    },
  );
}

class NotificationsRouteArgs {
  const NotificationsRouteArgs({this.key});

  final _i47.Key? key;

  @override
  String toString() {
    return 'NotificationsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i35.OperationsScreen]
class OperationsRoute extends _i46.PageRouteInfo<void> {
  const OperationsRoute({List<_i46.PageRouteInfo>? children})
    : super(OperationsRoute.name, initialChildren: children);

  static const String name = 'OperationsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i35.OperationsScreen();
    },
  );
}

/// generated route for
/// [PasswordChangedScreen]
class PasswordChangedRoute extends _i46.PageRouteInfo<void> {
  const PasswordChangedRoute({List<_i46.PageRouteInfo>? children})
    : super(PasswordChangedRoute.name, initialChildren: children);

  static const String name = 'PasswordChangedRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const PasswordChangedScreen();
    },
  );
}

/// generated route for
/// [_i36.PersonalInfoScreen]
class PersonalInfoRoute extends _i46.PageRouteInfo<void> {
  const PersonalInfoRoute({List<_i46.PageRouteInfo>? children})
    : super(PersonalInfoRoute.name, initialChildren: children);

  static const String name = 'PersonalInfoRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i36.PersonalInfoScreen();
    },
  );
}

/// generated route for
/// [_i37.ProfileScreen]
class ProfileRoute extends _i46.PageRouteInfo<void> {
  const ProfileRoute({List<_i46.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i37.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i38.QualificationsScreen]
class QualificationsRoute extends _i46.PageRouteInfo<void> {
  const QualificationsRoute({List<_i46.PageRouteInfo>? children})
    : super(QualificationsRoute.name, initialChildren: children);

  static const String name = 'QualificationsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i38.QualificationsScreen();
    },
  );
}

/// generated route for
/// [_i39.RequestsScreen]
class RequestsRoute extends _i46.PageRouteInfo<RequestsRouteArgs> {
  RequestsRoute({
    _i47.Key? key,
    required bool isBackButtonEnabled,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         RequestsRoute.name,
         args: RequestsRouteArgs(
           key: key,
           isBackButtonEnabled: isBackButtonEnabled,
         ),
         initialChildren: children,
       );

  static const String name = 'RequestsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RequestsRouteArgs>();
      return _i39.RequestsScreen(
        key: args.key,
        isBackButtonEnabled: args.isBackButtonEnabled,
      );
    },
  );
}

class RequestsRouteArgs {
  const RequestsRouteArgs({this.key, required this.isBackButtonEnabled});

  final _i47.Key? key;

  final bool isBackButtonEnabled;

  @override
  String toString() {
    return 'RequestsRouteArgs{key: $key, isBackButtonEnabled: $isBackButtonEnabled}';
  }
}

/// generated route for
/// [_i40.ResetPassScreen]
class ResetPassRoute extends _i46.PageRouteInfo<void> {
  const ResetPassRoute({List<_i46.PageRouteInfo>? children})
    : super(ResetPassRoute.name, initialChildren: children);

  static const String name = 'ResetPassRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i40.ResetPassScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends _i46.PageRouteInfo<void> {
  const SplashRoute({List<_i46.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [_i41.SubmissionsScreen]
class SubmissionsRoute extends _i46.PageRouteInfo<SubmissionsRouteArgs> {
  SubmissionsRoute({
    _i47.Key? key,
    required dynamic isBackButtonEnabled,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         SubmissionsRoute.name,
         args: SubmissionsRouteArgs(
           key: key,
           isBackButtonEnabled: isBackButtonEnabled,
         ),
         initialChildren: children,
       );

  static const String name = 'SubmissionsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubmissionsRouteArgs>();
      return _i41.SubmissionsScreen(
        key: args.key,
        isBackButtonEnabled: args.isBackButtonEnabled,
      );
    },
  );
}

class SubmissionsRouteArgs {
  const SubmissionsRouteArgs({this.key, required this.isBackButtonEnabled});

  final _i47.Key? key;

  final dynamic isBackButtonEnabled;

  @override
  String toString() {
    return 'SubmissionsRouteArgs{key: $key, isBackButtonEnabled: $isBackButtonEnabled}';
  }
}

/// generated route for
/// [_i42.SupervisorNavigationMainScreen]
class SupervisorNavigationMainRoute extends _i46.PageRouteInfo<void> {
  const SupervisorNavigationMainRoute({List<_i46.PageRouteInfo>? children})
    : super(SupervisorNavigationMainRoute.name, initialChildren: children);

  static const String name = 'SupervisorNavigationMainRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i42.SupervisorNavigationMainScreen();
    },
  );
}

/// generated route for
/// [_i43.SurveyScreen]
class SurveyRoute extends _i46.PageRouteInfo<void> {
  const SurveyRoute({List<_i46.PageRouteInfo>? children})
    : super(SurveyRoute.name, initialChildren: children);

  static const String name = 'SurveyRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i43.SurveyScreen();
    },
  );
}

/// generated route for
/// [ThankYouScreen]
class ThankYouRoute extends _i46.PageRouteInfo<ThankYouRouteArgs> {
  ThankYouRoute({
    _i47.Key? key,
    String? title,
    String? subtitle,
    Function? onContinueCallback,
    List<_i46.PageRouteInfo>? children,
  }) : super(
         ThankYouRoute.name,
         args: ThankYouRouteArgs(
           key: key,
           title: title,
           subtitle: subtitle,
           onContinueCallback: onContinueCallback,
         ),
         initialChildren: children,
       );

  static const String name = 'ThankYouRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThankYouRouteArgs>(
        orElse: () => const ThankYouRouteArgs(),
      );
      return ThankYouScreen(
        key: args.key,
        title: args.title,
        subtitle: args.subtitle,
        onContinueCallback: args.onContinueCallback,
      );
    },
  );
}

class ThankYouRouteArgs {
  const ThankYouRouteArgs({
    this.key,
    this.title,
    this.subtitle,
    this.onContinueCallback,
  });

  final _i47.Key? key;

  final String? title;

  final String? subtitle;

  final Function? onContinueCallback;

  @override
  String toString() {
    return 'ThankYouRouteArgs{key: $key, title: $title, subtitle: $subtitle, onContinueCallback: $onContinueCallback}';
  }
}

/// generated route for
/// [_i44.VisitorsLogsScreen]
class VisitorsLogsRoute extends _i46.PageRouteInfo<void> {
  const VisitorsLogsRoute({List<_i46.PageRouteInfo>? children})
    : super(VisitorsLogsRoute.name, initialChildren: children);

  static const String name = 'VisitorsLogsRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i44.VisitorsLogsScreen();
    },
  );
}

/// generated route for
/// [_i45.WorkScreen]
class WorkRoute extends _i46.PageRouteInfo<void> {
  const WorkRoute({List<_i46.PageRouteInfo>? children})
    : super(WorkRoute.name, initialChildren: children);

  static const String name = 'WorkRoute';

  static _i46.PageInfo page = _i46.PageInfo(
    name,
    builder: (data) {
      return const _i45.WorkScreen();
    },
  );
}
