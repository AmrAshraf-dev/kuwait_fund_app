// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:kf_ess_mobile_app/core/network/network_helper.dart' as _i675;
import 'package:kf_ess_mobile_app/core/services/device_service.dart' as _i402;
import 'package:kf_ess_mobile_app/features/about/data/data_sources/remote/about_remote_data_source.dart'
    as _i561;
import 'package:kf_ess_mobile_app/features/about/data/repositories/about_repository_impl.dart'
    as _i54;
import 'package:kf_ess_mobile_app/features/about/domain/repositories/about_repository.dart'
    as _i31;
import 'package:kf_ess_mobile_app/features/about/domain/use_cases/get_general_information_usecase.dart'
    as _i1031;
import 'package:kf_ess_mobile_app/features/about/domain/use_cases/get_kf_board_of_directors_usecase.dart'
    as _i707;
import 'package:kf_ess_mobile_app/features/about/domain/use_cases/get_kf_managment_usecase.dart'
    as _i777;
import 'package:kf_ess_mobile_app/features/about/presentation/cubits/general_information_cubit/general_information_cubit.dart'
    as _i163;
import 'package:kf_ess_mobile_app/features/about/presentation/cubits/kf_board_of_directors_cubit/kf_board_of_directors_cubit.dart'
    as _i952;
import 'package:kf_ess_mobile_app/features/about/presentation/cubits/kf_managment_cubit/kf_managment_cubit.dart'
    as _i79;
import 'package:kf_ess_mobile_app/features/annual_leave_request/data/data_sources/remote/annual_leave_request_remote_data_source.dart'
    as _i429;
import 'package:kf_ess_mobile_app/features/annual_leave_request/data/repositories/annual_leave_request_repository_impl.dart'
    as _i721;
import 'package:kf_ess_mobile_app/features/annual_leave_request/domain/repositories/annual_leave_request_repository.dart'
    as _i723;
import 'package:kf_ess_mobile_app/features/annual_leave_request/domain/use_cases/annual_leave_request_usecase.dart'
    as _i610;
import 'package:kf_ess_mobile_app/features/annual_leave_request/domain/use_cases/get_annual_leave_balance_usecase.dart'
    as _i1045;
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/cubits/annual_leave_balance_cubit/annual_leave_balance_cubit.dart'
    as _i382;
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/cubits/annual_leave_remining_balance_cubit/annual_leave_remining_balance_cubit.dart'
    as _i663;
import 'package:kf_ess_mobile_app/features/annual_leave_request/presentation/cubits/annual_leave_request_cubit.dart'
    as _i359;
import 'package:kf_ess_mobile_app/features/as_admin/admin_dept_mission/data/data_sources/remote/admin_dept_mission_remote_data_source.dart'
    as _i949;
import 'package:kf_ess_mobile_app/features/as_admin/admin_dept_mission/data/repositories/admin_dept_mission_repository_impl.dart'
    as _i1025;
import 'package:kf_ess_mobile_app/features/as_admin/admin_dept_mission/domain/repositories/admin_dept_mission_repository.dart'
    as _i964;
import 'package:kf_ess_mobile_app/features/as_admin/admin_dept_mission/domain/use_cases/get_admin_dept_mission_usecase.dart'
    as _i193;
import 'package:kf_ess_mobile_app/features/as_admin/admin_dept_mission/presentation/cubits/admin_dept_mission_cubit.dart'
    as _i59;
import 'package:kf_ess_mobile_app/features/as_admin/admin_director_mission/data/data_sources/remote/admin_director_mission_remote_data_source.dart'
    as _i750;
import 'package:kf_ess_mobile_app/features/as_admin/admin_director_mission/data/repositories/admin_director_mission_repository_impl.dart'
    as _i894;
import 'package:kf_ess_mobile_app/features/as_admin/admin_director_mission/domain/repositories/admin_director_mission_repository.dart'
    as _i704;
import 'package:kf_ess_mobile_app/features/as_admin/admin_director_mission/domain/use_cases/get_admin_director_mission_usecase.dart'
    as _i611;
import 'package:kf_ess_mobile_app/features/as_admin/admin_director_mission/presentation/cubits/admin_director_mission_cubit.dart'
    as _i573;
import 'package:kf_ess_mobile_app/features/as_admin/admin_home/data/data_sources/remote/admin_home_remote_data_source.dart'
    as _i1029;
import 'package:kf_ess_mobile_app/features/as_admin/admin_home/data/repositories/admin_home_repository_impl.dart'
    as _i308;
import 'package:kf_ess_mobile_app/features/as_admin/admin_home/domain/repositories/admin_home_repository.dart'
    as _i887;
import 'package:kf_ess_mobile_app/features/as_admin/admin_home/domain/use_cases/get_admin_home_usecase.dart'
    as _i524;
import 'package:kf_ess_mobile_app/features/as_admin/admin_home/presentation/cubits/admin_home_cubit.dart'
    as _i4;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/data_sources/remote/submissions_remote_data_source.dart'
    as _i809;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/data/repositories/submissions_repository_impl.dart'
    as _i542;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/repositories/submissions_repository.dart'
    as _i188;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/use_cases/get_submissions_usecase.dart'
    as _i9;
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/cubits/submissions_cubit.dart'
    as _i368;
import 'package:kf_ess_mobile_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i826;
import 'package:kf_ess_mobile_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i88;
import 'package:kf_ess_mobile_app/features/auth/domain/repositories/auth_repository.dart'
    as _i848;
import 'package:kf_ess_mobile_app/features/auth/domain/use_cases/get_auth_usecase.dart'
    as _i464;
import 'package:kf_ess_mobile_app/features/auth/presentation/cubits/auth_cubit.dart'
    as _i232;
import 'package:kf_ess_mobile_app/features/certificates/data/data_sources/remote/certificates_remote_data_source.dart'
    as _i956;
import 'package:kf_ess_mobile_app/features/certificates/data/repositories/certificates_repository_impl.dart'
    as _i408;
import 'package:kf_ess_mobile_app/features/certificates/domain/repositories/certificates_repository.dart'
    as _i504;
import 'package:kf_ess_mobile_app/features/certificates/domain/use_cases/generate_certificates_usecase.dart'
    as _i842;
import 'package:kf_ess_mobile_app/features/certificates/domain/use_cases/get_certificates_usecase.dart'
    as _i254;
import 'package:kf_ess_mobile_app/features/certificates/presentation/cubits/certificates_cubit.dart'
    as _i623;
import 'package:kf_ess_mobile_app/features/certificates/presentation/cubits/generate_certificate_cubit/generate_certificates_cubit.dart'
    as _i887;
import 'package:kf_ess_mobile_app/features/contactus/data/data_sources/remote/contactus_remote_data_source.dart'
    as _i719;
import 'package:kf_ess_mobile_app/features/contactus/data/repositories/contactus_repository_impl.dart'
    as _i1003;
import 'package:kf_ess_mobile_app/features/contactus/domain/repositories/contactus_repository.dart'
    as _i15;
import 'package:kf_ess_mobile_app/features/contactus/domain/use_cases/get_contactus_usecase.dart'
    as _i587;
import 'package:kf_ess_mobile_app/features/contactus/domain/use_cases/get_map_coordinates_usecase.dart'
    as _i355;
import 'package:kf_ess_mobile_app/features/contactus/domain/use_cases/get_telephone_fax_usecase.dart'
    as _i198;
import 'package:kf_ess_mobile_app/features/contactus/presentation/cubits/contactus_cubit.dart'
    as _i713;
import 'package:kf_ess_mobile_app/features/di/register_module.dart' as _i758;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/data/data_sources/remote/emergency_leave_request_remote_data_source.dart'
    as _i1003;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/data/repositories/emergency_leave_request_repository_impl.dart'
    as _i70;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/repositories/emergency_leave_request_repository.dart'
    as _i1035;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/create_emergency_leave_request_usecase.dart'
    as _i888;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/get_emergency_available_days_usecase.dart'
    as _i769;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/get_emergency_balance_usecase.dart'
    as _i545;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/domain/use_cases/get_emergency_eligible_days_usecase.dart'
    as _i58;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_available_days_cubit/emergency_available_days_cubit.dart'
    as _i500;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_leave_balance_cubit/emergency_leave_balance_cubit.dart'
    as _i699;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_leave_request_cubit.dart'
    as _i405;
import 'package:kf_ess_mobile_app/features/emergency_leave_request/presentation/cubits/emergency_remining_balance_cubit/emergency_remining_balance_cubit.dart'
    as _i763;
import 'package:kf_ess_mobile_app/features/forget_pass/data/data_sources/remote/forget_pass_remote_data_source.dart'
    as _i951;
import 'package:kf_ess_mobile_app/features/forget_pass/data/repositories/forget_pass_repository_impl.dart'
    as _i151;
import 'package:kf_ess_mobile_app/features/forget_pass/domain/repositories/forget_pass_repository.dart'
    as _i265;
import 'package:kf_ess_mobile_app/features/forget_pass/domain/use_cases/change_password_usecase.dart'
    as _i84;
import 'package:kf_ess_mobile_app/features/forget_pass/domain/use_cases/get_forget_pass_usecase.dart'
    as _i776;
import 'package:kf_ess_mobile_app/features/forget_pass/domain/use_cases/verify_otp_usecase.dart'
    as _i359;
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/cubits/forget_pass_cubit.dart'
    as _i969;
import 'package:kf_ess_mobile_app/features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i437;
import 'package:kf_ess_mobile_app/features/home/data/repositories/home_repository_impl.dart'
    as _i971;
import 'package:kf_ess_mobile_app/features/home/domain/repositories/home_repository.dart'
    as _i219;
import 'package:kf_ess_mobile_app/features/home/domain/use_cases/get_home_usecase.dart'
    as _i243;
import 'package:kf_ess_mobile_app/features/home/domain/use_cases/get_leave_dashboard_usecase.dart'
    as _i786;
import 'package:kf_ess_mobile_app/features/home/presentation/cubits/home_cubit.dart'
    as _i408;
import 'package:kf_ess_mobile_app/features/insurance/data/data_sources/remote/insurance_remote_data_source.dart'
    as _i506;
import 'package:kf_ess_mobile_app/features/insurance/data/repositories/insurance_repository_impl.dart'
    as _i454;
import 'package:kf_ess_mobile_app/features/insurance/domain/repositories/insurance_repository.dart'
    as _i1062;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/create_insurance_request_usecase.dart'
    as _i739;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_family_members_usecase.dart'
    as _i601;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_insurance_master_info_usecase.dart'
    as _i261;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_insurance_programs_usecase.dart'
    as _i1049;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_subscribers_usecase.dart'
    as _i939;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/unsubscribe_insurance_usecase.dart'
    as _i603;
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/create_insurance_request_cubit/create_insurance_request_cubit.dart'
    as _i641;
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_cubit.dart'
    as _i163;
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_member_cubit/insurance_member_cubit.dart'
    as _i995;
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/selected_family_members_cubit/selected_family_members_cubit.dart'
    as _i885;
import 'package:kf_ess_mobile_app/features/loan_request/data/data_sources/remote/loan_request_remote_data_source.dart'
    as _i449;
import 'package:kf_ess_mobile_app/features/loan_request/data/repositories/loan_request_repository_impl.dart'
    as _i632;
import 'package:kf_ess_mobile_app/features/loan_request/domain/repositories/loan_request_repository.dart'
    as _i815;
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/create_loan_request_usecase.dart'
    as _i1045;
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/get_loan_request_usecase.dart'
    as _i302;
import 'package:kf_ess_mobile_app/features/loan_request/domain/use_cases/get_personal_loan_master_info_usecase.dart'
    as _i793;
import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/create_logn_request_cubit/create_loan_request_cubit.dart'
    as _i236;
import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_amount_calculator_cubit/loan_amount_calculator_cubit.dart'
    as _i52;
import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_reasons_cubit/loan_reasons_cubit.dart'
    as _i808;
import 'package:kf_ess_mobile_app/features/loan_request/presentation/cubits/loan_request_cubit.dart'
    as _i992;
import 'package:kf_ess_mobile_app/features/more/data/data_sources/remote/more_remote_data_source.dart'
    as _i602;
import 'package:kf_ess_mobile_app/features/more/data/repositories/more_repository_impl.dart'
    as _i920;
import 'package:kf_ess_mobile_app/features/more/domain/repositories/more_repository.dart'
    as _i508;
import 'package:kf_ess_mobile_app/features/more/domain/use_cases/get_more_usecase.dart'
    as _i273;
import 'package:kf_ess_mobile_app/features/more/presentation/cubits/more_cubit.dart'
    as _i693;
import 'package:kf_ess_mobile_app/features/my_attendance/data/data_sources/remote/my_attendance_remote_data_source.dart'
    as _i399;
import 'package:kf_ess_mobile_app/features/my_attendance/data/repositories/my_attendance_repository_impl.dart'
    as _i1001;
import 'package:kf_ess_mobile_app/features/my_attendance/domain/repositories/my_attendance_repository.dart'
    as _i835;
import 'package:kf_ess_mobile_app/features/my_attendance/domain/use_cases/get_my_attendance_usecase.dart'
    as _i107;
import 'package:kf_ess_mobile_app/features/my_attendance/presentation/cubits/my_attendance_cubit.dart'
    as _i674;
import 'package:kf_ess_mobile_app/features/notifications/data/data_sources/remote/notifications_remote_data_source.dart'
    as _i396;
import 'package:kf_ess_mobile_app/features/notifications/data/repositories/notifications_repository_impl.dart'
    as _i1012;
import 'package:kf_ess_mobile_app/features/notifications/domain/repositories/notifications_repository.dart'
    as _i218;
import 'package:kf_ess_mobile_app/features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i362;
import 'package:kf_ess_mobile_app/features/notifications/presentation/cubits/notifications_cubit.dart'
    as _i791;
import 'package:kf_ess_mobile_app/features/operations/data/data_sources/remote/operations_remote_data_source.dart'
    as _i1002;
import 'package:kf_ess_mobile_app/features/operations/data/repositories/operations_repository_impl.dart'
    as _i110;
import 'package:kf_ess_mobile_app/features/operations/domain/repositories/operations_repository.dart'
    as _i624;
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/contributions_usecase/get_contributions_usecase.dart'
    as _i492;
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/countries_grants_usecase/get_countries_grants_usecase.dart'
    as _i243;
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/institutions_grants_usecase/get_institutions_grants_usecase.dart'
    as _i279;
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/loan_usecase/get_loan_usecase.dart'
    as _i80;
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/contributions_cubit/contributions_cubit.dart'
    as _i398;
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/countries_grants_cubit/countries_grants_cubit.dart'
    as _i910;
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/institutions_grants_cubit/institutions_grants_cubit.dart'
    as _i756;
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/loan_cubit/loan_cubit.dart'
    as _i474;
import 'package:kf_ess_mobile_app/features/peraonal_info/data/data_sources/remote/peraonal_info_remote_data_source.dart'
    as _i90;
import 'package:kf_ess_mobile_app/features/peraonal_info/data/repositories/peraonal_info_repository_impl.dart'
    as _i562;
import 'package:kf_ess_mobile_app/features/peraonal_info/domain/repositories/peraonal_info_repository.dart'
    as _i786;
import 'package:kf_ess_mobile_app/features/peraonal_info/domain/use_cases/get_peraonal_info_usecase.dart'
    as _i715;
import 'package:kf_ess_mobile_app/features/peraonal_info/presentation/cubits/peraonal_info_cubit.dart'
    as _i447;
import 'package:kf_ess_mobile_app/features/profile/data/data_sources/remote/profile_remote_data_source.dart'
    as _i710;
import 'package:kf_ess_mobile_app/features/profile/data/repositories/profile_repository_impl.dart'
    as _i249;
import 'package:kf_ess_mobile_app/features/profile/domain/repositories/profile_repository.dart'
    as _i246;
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/get_profile_usecase.dart'
    as _i727;
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/profile_cubit.dart'
    as _i588;
import 'package:kf_ess_mobile_app/features/requests/data/data_sources/remote/requests_remote_data_source.dart'
    as _i560;
import 'package:kf_ess_mobile_app/features/requests/data/repositories/requests_repository_impl.dart'
    as _i180;
import 'package:kf_ess_mobile_app/features/requests/domain/repositories/requests_repository.dart'
    as _i974;
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/get_request_types_usecase.dart'
    as _i346;
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/get_requests_usecase.dart'
    as _i270;
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/request_types_cubit/requests_cubit.dart'
    as _i1046;
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_type_cubit/request_types_cubit.dart'
    as _i403;
import 'package:kf_ess_mobile_app/features/shared/cubit/date_picker_range_cubit/range_date_picker_cubit.dart'
    as _i94;
import 'package:kf_ess_mobile_app/features/shared/cubit/locale_cubit/locale_cubit.dart'
    as _i101;
import 'package:kf_ess_mobile_app/features/shared/cubit/tab_cubit/tab_cubit.dart'
    as _i360;
import 'package:kf_ess_mobile_app/features/shared/cubit/theme_cubit/theme_cubit.dart'
    as _i501;
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_check_box/check_box_cubit.dart'
    as _i735;
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_date_picker/custom_date_picker_cubit.dart'
    as _i749;
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart'
    as _i768;
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_map_picker/custom_map_picker_cubit.dart'
    as _i777;
import 'package:kf_ess_mobile_app/features/shared/widgets/pdf_bottomsheet_widget/pdf_cubit.dart'
    as _i735;
import 'package:kf_ess_mobile_app/features/survey/data/data_sources/remote/survey_remote_data_source.dart'
    as _i332;
import 'package:kf_ess_mobile_app/features/survey/data/repositories/survey_repository_impl.dart'
    as _i276;
import 'package:kf_ess_mobile_app/features/survey/domain/repositories/survey_repository.dart'
    as _i307;
import 'package:kf_ess_mobile_app/features/survey/domain/use_cases/get_survey_usecase.dart'
    as _i292;
import 'package:kf_ess_mobile_app/features/survey/presentation/cubits/survey_cubit.dart'
    as _i596;
import 'package:kf_ess_mobile_app/features/visitors_logs/data/data_sources/remote/visitors_logs_remote_data_source.dart'
    as _i643;
import 'package:kf_ess_mobile_app/features/visitors_logs/data/repositories/visitors_logs_repository_impl.dart'
    as _i72;
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/repositories/visitor_logs_hosts_repository.dart'
    as _i361;
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/repositories/visitors_logs_repository.dart'
    as _i1026;
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_visitor_logs_hosts_usecase.dart'
    as _i924;
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_visitors_logs_usecase.dart'
    as _i266;
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart'
    as _i540;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i663.AnnualLeaveReminingLeaveBalanceCubit>(
      () => _i663.AnnualLeaveReminingLeaveBalanceCubit());
  gh.factory<_i763.EmergencyReminingLeaveBalanceCubit>(
      () => _i763.EmergencyReminingLeaveBalanceCubit());
  gh.factory<_i885.SelectedFamilyMembersCubit>(
      () => _i885.SelectedFamilyMembersCubit());
  gh.factory<_i52.LoanAmountCalculatorCubit>(
      () => _i52.LoanAmountCalculatorCubit());
  gh.factory<_i94.RangeDatePickerCubit>(() => _i94.RangeDatePickerCubit());
  gh.factory<_i360.TabCubit>(() => _i360.TabCubit());
  gh.factory<_i749.DatePickerCubit>(() => _i749.DatePickerCubit());
  gh.factory<_i768.FilePickerCubit>(() => _i768.FilePickerCubit());
  gh.factory<_i777.LocationCubit>(() => _i777.LocationCubit());
  gh.factory<_i735.PDFCubit>(() => _i735.PDFCubit());
  gh.singleton<_i402.DeviceService>(() => _i402.DeviceService());
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i101.LocaleCubit>(() => _i101.LocaleCubit());
  gh.singleton<_i501.ThemeCubit>(() => _i501.ThemeCubit());
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i735.CheckboxCubit>(() => _i735.CheckboxCubit(gh<bool>()));
  gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i675.NetworkHelper>(() => _i675.NetworkHelper(gh<_i361.Dio>()));
  gh.factory<_i750.AdminDirectorMissionRemoteDataSource>(() =>
      _i750.AdminDirectorMissionDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i429.AnnualLeaveRequestRemoteDataSource>(
      () => _i429.AnnualLeaveRequestDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i719.ContactusRemoteDataSource>(
      () => _i719.ContactusDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i1003.EmergencyLeaveRequestRemoteDataSource>(() =>
      _i1003.EmergencyLeaveRequestDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i602.MoreRemoteDataSource>(
      () => _i602.MoreDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i90.PeraonalInfoRemoteDataSource>(
      () => _i90.PeraonalInfoDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i399.MyAttendanceRemoteDataSource>(
      () => _i399.MyAttendanceDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i332.SurveyRemoteDataSource>(
      () => _i332.SurveyDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i506.InsuranceRemoteDataSource>(
      () => _i506.InsuranceDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i1002.OperationsRemoteDataSource>(
      () => _i1002.OperationsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i437.HomeRemoteDataSource>(
      () => _i437.HomeDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i786.PeraonalInfoRepository>(() =>
      _i562.PeraonalInfoRepositoryImp(
          peraonalInfoRemoteDataSource:
              gh<_i90.PeraonalInfoRemoteDataSource>()));
  gh.factory<_i219.HomeRepository>(() => _i971.HomeRepositoryImp(
      homeRemoteDataSource: gh<_i437.HomeRemoteDataSource>()));
  gh.factory<_i809.SubmissionsRemoteDataSource>(
      () => _i809.SubmissionsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i956.CertificatesRemoteDataSource>(
      () => _i956.CertificatesDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i704.AdminDirectorMissionRepository>(() =>
      _i894.AdminDirectorMissionRepositoryImp(
          adminDirectorMissionRemoteDataSource:
              gh<_i750.AdminDirectorMissionRemoteDataSource>()));
  gh.factory<_i188.SubmissionsRepository>(() => _i542.SubmissionsRepositoryImp(
      submissionsRemoteDataSource: gh<_i809.SubmissionsRemoteDataSource>()));
  gh.factory<_i396.NotificationsRemoteDataSource>(
      () => _i396.NotificationsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i1035.EmergencyLeaveRequestRepository>(() =>
      _i70.EmergencyLeaveRequestRepositoryImp(
          emergencyLeaveRequestRemoteDataSource:
              gh<_i1003.EmergencyLeaveRequestRemoteDataSource>()));
  gh.factory<_i561.AboutRemoteDataSource>(
      () => _i561.AboutDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i307.SurveyRepository>(() => _i276.SurveyRepositoryImp(
      surveyRemoteDataSource: gh<_i332.SurveyRemoteDataSource>()));
  gh.factory<_i508.MoreRepository>(() => _i920.MoreRepositoryImp(
      moreRemoteDataSource: gh<_i602.MoreRemoteDataSource>()));
  gh.factory<_i826.AuthRemoteDataSource>(
      () => _i826.AuthDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i949.AdminDeptMissionRemoteDataSource>(
      () => _i949.AdminDeptMissionDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i723.AnnualLeaveRequestRepository>(() =>
      _i721.AnnualLeaveRequestRepositoryImp(
          annualLeaveRequestRemoteDataSource:
              gh<_i429.AnnualLeaveRequestRemoteDataSource>()));
  gh.factory<_i1029.AdminHomeRemoteDataSource>(
      () => _i1029.AdminHomeDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i710.ProfileRemoteDataSource>(
      () => _i710.ProfileDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i951.ForgetPassRemoteDataSource>(
      () => _i951.ForgetPassDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i560.RequestsRemoteDataSource>(
      () => _i560.RequestsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i265.ForgetPassRepository>(() => _i151.ForgetPassRepositoryImp(
      forgetPassRemoteDataSource: gh<_i951.ForgetPassRemoteDataSource>()));
  gh.factory<_i15.ContactusRepository>(() => _i1003.ContactusRepositoryImp(
      contactusRemoteDataSource: gh<_i719.ContactusRemoteDataSource>()));
  gh.factory<_i974.RequestsRepository>(() => _i180.RequestsRepositoryImp(
      requestsRemoteDataSource: gh<_i560.RequestsRemoteDataSource>()));
  gh.factory<_i643.VisitorsLogsRemoteDataSource>(
      () => _i643.VisitorsLogsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i449.LoanRequestRemoteDataSource>(
      () => _i449.LoanRequestDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i624.OperationsRepository>(() => _i110.OperationsRepositoryImp(
      operationsRemoteDataSource: gh<_i1002.OperationsRemoteDataSource>()));
  gh.factory<_i504.CertificatesRepository>(() =>
      _i408.CertificatesRepositoryImp(
          certificatesRemoteDataSource:
              gh<_i956.CertificatesRemoteDataSource>()));
  gh.factory<_i84.ChangePasswordUseCase>(() => _i84.ChangePasswordUseCase(
      forgetPassRepository: gh<_i265.ForgetPassRepository>()));
  gh.factory<_i776.GetForgetPassUseCase>(() => _i776.GetForgetPassUseCase(
      forgetPassRepository: gh<_i265.ForgetPassRepository>()));
  gh.factory<_i359.VerifyOtpUseCase>(() => _i359.VerifyOtpUseCase(
      forgetPassRepository: gh<_i265.ForgetPassRepository>()));
  gh.factory<_i243.GetHomeUseCase>(
      () => _i243.GetHomeUseCase(homeRepository: gh<_i219.HomeRepository>()));
  gh.factory<_i786.GetLeaveDashboardUseCase>(() =>
      _i786.GetLeaveDashboardUseCase(
          homeRepository: gh<_i219.HomeRepository>()));
  gh.factory<_i243.GetCountriesGrantsUseCase>(() =>
      _i243.GetCountriesGrantsUseCase(
          operationsRepository: gh<_i624.OperationsRepository>()));
  gh.factory<_i279.GetInstitutionsGrantsUseCase>(() =>
      _i279.GetInstitutionsGrantsUseCase(
          operationsRepository: gh<_i624.OperationsRepository>()));
  gh.factory<_i80.GetLoanUseCase>(() => _i80.GetLoanUseCase(
      operationsRepository: gh<_i624.OperationsRepository>()));
  gh.factory<_i273.GetMoreUseCase>(
      () => _i273.GetMoreUseCase(moreRepository: gh<_i508.MoreRepository>()));
  gh.factory<_i346.GetRequestTypesUseCase>(
      () => _i346.GetRequestTypesUseCase(gh<_i974.RequestsRepository>()));
  gh.factory<_i964.AdminDeptMissionRepository>(() =>
      _i1025.AdminDeptMissionRepositoryImp(
          adminDeptMissionRemoteDataSource:
              gh<_i949.AdminDeptMissionRemoteDataSource>()));
  gh.factory<_i842.GenerateCertificateUserCase>(() =>
      _i842.GenerateCertificateUserCase(
          certificatesRepository: gh<_i504.CertificatesRepository>()));
  gh.factory<_i254.GetCertificatesUseCase>(() => _i254.GetCertificatesUseCase(
      certificatesRepository: gh<_i504.CertificatesRepository>()));
  gh.factory<_i848.AuthRepository>(() => _i88.AuthRepositoryImp(
      authRemoteDataSource: gh<_i826.AuthRemoteDataSource>()));
  gh.factory<_i715.GetPeraonalInfoUseCase>(() => _i715.GetPeraonalInfoUseCase(
      peraonalInfoRepository: gh<_i786.PeraonalInfoRepository>()));
  gh.factory<_i888.CreateEmergencyLeaveRequestUseCase>(() =>
      _i888.CreateEmergencyLeaveRequestUseCase(
          emergencyLeaveRequestRepository:
              gh<_i1035.EmergencyLeaveRequestRepository>()));
  gh.factory<_i835.MyAttendanceRepository>(() =>
      _i1001.MyAttendanceRepositoryImp(
          myAttendanceRemoteDataSource:
              gh<_i399.MyAttendanceRemoteDataSource>()));
  gh.factory<_i1062.InsuranceRepository>(() => _i454.InsuranceRepositoryImp(
      insuranceRemoteDataSource: gh<_i506.InsuranceRemoteDataSource>()));
  gh.factory<_i408.HomeCubit>(() => _i408.HomeCubit(
        getHomeUseCase: gh<_i243.GetHomeUseCase>(),
        getLeaveDashboardUseCase: gh<_i786.GetLeaveDashboardUseCase>(),
      ));
  gh.factory<_i218.NotificationsRepository>(() =>
      _i1012.NotificationsRepositoryImp(
          notificationsRemoteDataSource:
              gh<_i396.NotificationsRemoteDataSource>()));
  gh.factory<_i756.InstitutionsGrantsCubit>(() => _i756.InstitutionsGrantsCubit(
      getInstitutionsGrantsUseCase: gh<_i279.GetInstitutionsGrantsUseCase>()));
  gh.factory<_i270.GetRequestsUseCase>(() => _i270.GetRequestsUseCase(
      requestsRepository: gh<_i974.RequestsRepository>()));
  gh.factory<_i464.GetAuthUseCase>(
      () => _i464.GetAuthUseCase(authRepository: gh<_i848.AuthRepository>()));
  gh.factory<_i887.GenerateCertificatesCubit>(() =>
      _i887.GenerateCertificatesCubit(
          generateCertificateUserCase:
              gh<_i842.GenerateCertificateUserCase>()));
  gh.factory<_i887.AdminHomeRepository>(() => _i308.AdminHomeRepositoryImp(
      adminHomeRemoteDataSource: gh<_i1029.AdminHomeRemoteDataSource>()));
  gh.singleton<_i969.ForgetPassCubit>(() => _i969.ForgetPassCubit(
        getForgetPassUseCase: gh<_i776.GetForgetPassUseCase>(),
        verifyOtpUseCase: gh<_i359.VerifyOtpUseCase>(),
        changePasswordUseCase: gh<_i84.ChangePasswordUseCase>(),
      ));
  gh.factory<_i246.ProfileRepository>(() => _i249.ProfileRepositoryImp(
      profileRemoteDataSource: gh<_i710.ProfileRemoteDataSource>()));
  gh.factory<_i232.AuthCubit>(
      () => _i232.AuthCubit(getAuthUseCase: gh<_i464.GetAuthUseCase>()));
  gh.factory<_i815.LoanRequestRepository>(() => _i632.LoanRequestRepositoryImp(
      loanRequestRemoteDataSource: gh<_i449.LoanRequestRemoteDataSource>()));
  gh.factory<_i587.GetContactusUseCase>(() => _i587.GetContactusUseCase(
      contactusRepository: gh<_i15.ContactusRepository>()));
  gh.factory<_i355.GetCoordinatesUseCase>(() => _i355.GetCoordinatesUseCase(
      contactusRepository: gh<_i15.ContactusRepository>()));
  gh.factory<_i198.GetTelephoneFaxUseCase>(() => _i198.GetTelephoneFaxUseCase(
      contactusRepository: gh<_i15.ContactusRepository>()));
  gh.factory<_i524.GetAdminHomeUseCase>(() => _i524.GetAdminHomeUseCase(
      adminHomeRepository: gh<_i887.AdminHomeRepository>()));
  gh.factory<_i9.GetSubmissionsUseCase>(() => _i9.GetSubmissionsUseCase(
      submissionsRepository: gh<_i188.SubmissionsRepository>()));
  gh.factory<_i623.CertificatesCubit>(() => _i623.CertificatesCubit(
        getCertificatesUseCase: gh<_i254.GetCertificatesUseCase>(),
        generateCertificateUserCase: gh<_i842.GenerateCertificateUserCase>(),
      ));
  gh.factory<_i4.AdminHomeCubit>(() =>
      _i4.AdminHomeCubit(getAdminHomeUseCase: gh<_i524.GetAdminHomeUseCase>()));
  gh.factory<_i193.GetAdminDeptMissionUseCase>(() =>
      _i193.GetAdminDeptMissionUseCase(
          adminDeptMissionRepository: gh<_i964.AdminDeptMissionRepository>()));
  gh.factory<_i769.GetEmergencyAvailableDaysUseCase>(() =>
      _i769.GetEmergencyAvailableDaysUseCase(
          createRequestRepository:
              gh<_i1035.EmergencyLeaveRequestRepository>()));
  gh.factory<_i545.GetEmergencyLeaveBalanceUseCase>(() =>
      _i545.GetEmergencyLeaveBalanceUseCase(
          createRequestRepository:
              gh<_i1035.EmergencyLeaveRequestRepository>()));
  gh.factory<_i58.GetEmergencyEligibleDaysUseCase>(() =>
      _i58.GetEmergencyEligibleDaysUseCase(
          createRequestRepository:
              gh<_i1035.EmergencyLeaveRequestRepository>()));
  gh.factory<_i727.GetProfileUseCase>(() => _i727.GetProfileUseCase(
      profileRepository: gh<_i246.ProfileRepository>()));
  gh.factory<_i1026.VisitorsLogsRepository>(() =>
      _i72.VisitorsLogsRepositoryImp(
          visitorsLogsRemoteDataSource:
              gh<_i643.VisitorsLogsRemoteDataSource>()));
  gh.factory<_i611.GetAdminDirectorMissionUseCase>(() =>
      _i611.GetAdminDirectorMissionUseCase(
          adminDirectorMissionRepository:
              gh<_i704.AdminDirectorMissionRepository>()));
  gh.factory<_i398.ContributionsCubit>(() => _i398.ContributionsCubit(
      getContributionsUseCase: gh<_i492.GetContributionsUseCase>()));
  gh.factory<_i31.AboutRepository>(() => _i54.AboutRepositoryImp(
      aboutRemoteDataSource: gh<_i561.AboutRemoteDataSource>()));
  gh.factory<_i610.AnnualLeaveRequestUseCase>(() =>
      _i610.AnnualLeaveRequestUseCase(
          annualLeaveRequestRepository:
              gh<_i723.AnnualLeaveRequestRepository>()));
  gh.factory<_i1045.GetAnnualLeaveBalanceUseCase>(() =>
      _i1045.GetAnnualLeaveBalanceUseCase(
          annualLeaveRequestRepository:
              gh<_i723.AnnualLeaveRequestRepository>()));
  gh.factory<_i292.GetSurveyUseCase>(() =>
      _i292.GetSurveyUseCase(surveyRepository: gh<_i307.SurveyRepository>()));
  gh.factory<_i447.PeraonalInfoCubit>(() => _i447.PeraonalInfoCubit(
      getPeraonalInfoUseCase: gh<_i715.GetPeraonalInfoUseCase>()));
  gh.factory<_i361.VisitorLogsHostsRepository>(() =>
      _i72.VisitorLogsHostsRepositoryImp(
          visitorsLogsRemoteDataSource:
              gh<_i643.VisitorsLogsRemoteDataSource>()));
  gh.factory<_i403.RequestTypesCubit>(
      () => _i403.RequestTypesCubit(gh<_i346.GetRequestTypesUseCase>()));
  gh.factory<_i910.CountriesGrantsCubit>(() => _i910.CountriesGrantsCubit(
      getCountriesGrantsUseCase: gh<_i243.GetCountriesGrantsUseCase>()));
  gh.factory<_i362.GetNotificationsUseCase>(() => _i362.GetNotificationsUseCase(
      notificationsRepository: gh<_i218.NotificationsRepository>()));
  gh.factory<_i739.CreateInsuranceRequestUseCase>(() =>
      _i739.CreateInsuranceRequestUseCase(
          insuranceRepository: gh<_i1062.InsuranceRepository>()));
  gh.factory<_i1049.GetInsuranceUseCase>(() => _i1049.GetInsuranceUseCase(
      insuranceRepository: gh<_i1062.InsuranceRepository>()));
  gh.factory<_i266.GetVisitorsLogsUseCase>(() => _i266.GetVisitorsLogsUseCase(
      visitorsLogsRepository: gh<_i1026.VisitorsLogsRepository>()));
  gh.factory<_i1046.RequestsCubit>(() =>
      _i1046.RequestsCubit(getRequestsUseCase: gh<_i270.GetRequestsUseCase>()));
  gh.factory<_i474.LoanCubit>(
      () => _i474.LoanCubit(getLoanUseCase: gh<_i80.GetLoanUseCase>()));
  gh.factory<_i641.CreateInsuranceRequestCubit>(() =>
      _i641.CreateInsuranceRequestCubit(
          createInsuranceRequestUseCase:
              gh<_i739.CreateInsuranceRequestUseCase>()));
  gh.factory<_i107.GetMyAttendanceUseCase>(() => _i107.GetMyAttendanceUseCase(
      myAttendanceRepository: gh<_i835.MyAttendanceRepository>()));
  gh.factory<_i924.GetVisitorLogsHostsUseCase>(() =>
      _i924.GetVisitorLogsHostsUseCase(
          visitorsLogsHostsRepository: gh<_i361.VisitorLogsHostsRepository>()));
  gh.factory<_i266.VisitorsManagementCalendarUseCase>(() =>
      _i266.VisitorsManagementCalendarUseCase(
          gh<_i1026.VisitorsLogsRepository>()));
  gh.factory<_i693.MoreCubit>(
      () => _i693.MoreCubit(getMoreUseCase: gh<_i273.GetMoreUseCase>()));
  gh.factory<_i540.VisitorsLogsCubit>(() => _i540.VisitorsLogsCubit(
        gh<_i924.GetVisitorLogsHostsUseCase>(),
        gh<_i266.GetVisitorsLogsUseCase>(),
        gh<_i266.VisitorsManagementCalendarUseCase>(),
      ));
  gh.factory<_i699.EmergencyLeaveBalanceCubit>(() =>
      _i699.EmergencyLeaveBalanceCubit(
          getEmergencyLeaveBalanceUseCase:
              gh<_i545.GetEmergencyLeaveBalanceUseCase>()));
  gh.factory<_i1045.CreateLoanRequestUseCase>(() =>
      _i1045.CreateLoanRequestUseCase(
          loanRequestRepository: gh<_i815.LoanRequestRepository>()));
  gh.factory<_i302.GetLoanReasonsUseCase>(() => _i302.GetLoanReasonsUseCase(
      loanRequestRepository: gh<_i815.LoanRequestRepository>()));
  gh.factory<_i382.AnnualLeaveBalanceCubit>(() => _i382.AnnualLeaveBalanceCubit(
      getAnnualLeaveBalanceUseCase: gh<_i1045.GetAnnualLeaveBalanceUseCase>()));
  gh.factory<_i236.CreateLoanRequestCubit>(() => _i236.CreateLoanRequestCubit(
      createLoanRequestUseCase: gh<_i1045.CreateLoanRequestUseCase>()));
  gh.factory<_i588.ProfileCubit>(() =>
      _i588.ProfileCubit(getProfileUseCase: gh<_i727.GetProfileUseCase>()));
  gh.factory<_i573.AdminDirectorMissionCubit>(() =>
      _i573.AdminDirectorMissionCubit(
          getAdminDirectorMissionUseCase:
              gh<_i611.GetAdminDirectorMissionUseCase>()));
  gh.factory<_i601.GetFamilyMembersUseCase>(
      () => _i601.GetFamilyMembersUseCase(gh<_i1062.InsuranceRepository>()));
  gh.factory<_i261.GetInsuranceMasterInfoUseCase>(() =>
      _i261.GetInsuranceMasterInfoUseCase(gh<_i1062.InsuranceRepository>()));
  gh.factory<_i939.GetSubscribersUseCase>(
      () => _i939.GetSubscribersUseCase(gh<_i1062.InsuranceRepository>()));
  gh.factory<_i603.UnsubscribeInsuranceUseCase>(() =>
      _i603.UnsubscribeInsuranceUseCase(gh<_i1062.InsuranceRepository>()));
  gh.factory<_i500.EmergencyAvailableDaysCubit>(() =>
      _i500.EmergencyAvailableDaysCubit(
          getEmergencyAvailableDaysUseCase:
              gh<_i769.GetEmergencyAvailableDaysUseCase>()));
  gh.factory<_i163.InsuranceCubit>(() => _i163.InsuranceCubit(
        getInsuranceUseCase: gh<_i1049.GetInsuranceUseCase>(),
        getInsuranceMasterInfoUseCase:
            gh<_i261.GetInsuranceMasterInfoUseCase>(),
        unsubscribeInsuranceUseCase: gh<_i603.UnsubscribeInsuranceUseCase>(),
      ));
  gh.factory<_i59.AdminDeptMissionCubit>(() => _i59.AdminDeptMissionCubit(
      getAdminDeptMissionUseCase: gh<_i193.GetAdminDeptMissionUseCase>()));
  gh.factory<_i791.NotificationsCubit>(() => _i791.NotificationsCubit(
      getNotificationsUseCase: gh<_i362.GetNotificationsUseCase>()));
  gh.factory<_i368.SubmissionsCubit>(() => _i368.SubmissionsCubit(
      getSubmissionsUseCase: gh<_i9.GetSubmissionsUseCase>()));
  gh.factory<_i713.ContactusCubit>(() => _i713.ContactusCubit(
        getContactusUseCase: gh<_i587.GetContactusUseCase>(),
        getCoordinatesUseCase: gh<_i355.GetCoordinatesUseCase>(),
        getTelephoneFaxUseCase: gh<_i198.GetTelephoneFaxUseCase>(),
      ));
  gh.factory<_i359.AnnualLeaveRequestCubit>(() => _i359.AnnualLeaveRequestCubit(
      annualLeaveRequestUseCase: gh<_i610.AnnualLeaveRequestUseCase>()));
  gh.factory<_i793.GetPersonalLoanMasterInfoUseCase>(() =>
      _i793.GetPersonalLoanMasterInfoUseCase(
          gh<_i815.LoanRequestRepository>()));
  gh.factory<_i405.EmergencyLeaveRequestCubit>(
      () => _i405.EmergencyLeaveRequestCubit(
            createEmergencyLeaveRequestUseCase:
                gh<_i888.CreateEmergencyLeaveRequestUseCase>(),
            getEmergencyEligibleDaysUseCase:
                gh<_i58.GetEmergencyEligibleDaysUseCase>(),
          ));
  gh.factory<_i992.LoanRequestCubit>(() => _i992.LoanRequestCubit(
        getLoanReasonsUseCase: gh<_i302.GetLoanReasonsUseCase>(),
        getPersonalLoanMasterInfoUseCase:
            gh<_i793.GetPersonalLoanMasterInfoUseCase>(),
      ));
  gh.factory<_i1031.GetGeneralInformationUseCase>(() =>
      _i1031.GetGeneralInformationUseCase(
          aboutRepository: gh<_i31.AboutRepository>()));
  gh.factory<_i707.GetKFBoardOfDirectorsUseCase>(() =>
      _i707.GetKFBoardOfDirectorsUseCase(
          aboutRepository: gh<_i31.AboutRepository>()));
  gh.factory<_i777.GetKFManagmentUseCase>(() =>
      _i777.GetKFManagmentUseCase(aboutRepository: gh<_i31.AboutRepository>()));
  gh.factory<_i952.KFBoardOfDirectorsCubit>(() => _i952.KFBoardOfDirectorsCubit(
      getKFBoardOfDirectorsUseCase: gh<_i707.GetKFBoardOfDirectorsUseCase>()));
  gh.factory<_i596.SurveyCubit>(
      () => _i596.SurveyCubit(getSurveyUseCase: gh<_i292.GetSurveyUseCase>()));
  gh.factory<_i808.LoanReasonsCubit>(() => _i808.LoanReasonsCubit(
      getLoanReasonsUseCase: gh<_i302.GetLoanReasonsUseCase>()));
  gh.factory<_i674.MyAttendanceCubit>(() => _i674.MyAttendanceCubit(
      getMyAttendanceUseCase: gh<_i107.GetMyAttendanceUseCase>()));
  gh.factory<_i79.KFManagmentCubit>(() => _i79.KFManagmentCubit(
      getKFManagmentUseCase: gh<_i777.GetKFManagmentUseCase>()));
  gh.factory<_i995.InsuranceMemberCubit>(() => _i995.InsuranceMemberCubit(
        getFamilyMembersUseCase: gh<_i601.GetFamilyMembersUseCase>(),
        getSubscribersUseCase: gh<_i939.GetSubscribersUseCase>(),
      ));
  gh.factory<_i163.GeneralInformationCubit>(() => _i163.GeneralInformationCubit(
      getGeneralInformationUseCase: gh<_i1031.GetGeneralInformationUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i758.RegisterModule {}
