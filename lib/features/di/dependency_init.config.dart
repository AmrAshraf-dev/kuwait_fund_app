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
import 'package:kf_ess_mobile_app/features/certificates/domain/use_cases/get_certificates_usecase.dart'
    as _i254;
import 'package:kf_ess_mobile_app/features/certificates/presentation/cubits/certificates_cubit.dart'
    as _i623;
import 'package:kf_ess_mobile_app/features/create_request/data/data_sources/remote/create_request_remote_data_source.dart'
    as _i119;
import 'package:kf_ess_mobile_app/features/create_request/data/repositories/create_request_repository_impl.dart'
    as _i725;
import 'package:kf_ess_mobile_app/features/create_request/domain/repositories/create_request_repository.dart'
    as _i397;
import 'package:kf_ess_mobile_app/features/create_request/domain/use_cases/get_create_request_usecase.dart'
    as _i1068;
import 'package:kf_ess_mobile_app/features/create_request/presentation/cubits/create_request_cubit.dart'
    as _i708;
import 'package:kf_ess_mobile_app/features/di/register_module.dart' as _i758;
import 'package:kf_ess_mobile_app/features/forget_pass/data/data_sources/remote/forget_pass_remote_data_source.dart'
    as _i951;
import 'package:kf_ess_mobile_app/features/forget_pass/data/repositories/forget_pass_repository_impl.dart'
    as _i151;
import 'package:kf_ess_mobile_app/features/forget_pass/domain/repositories/forget_pass_repository.dart'
    as _i265;
import 'package:kf_ess_mobile_app/features/forget_pass/domain/use_cases/get_forget_pass_usecase.dart'
    as _i776;
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
import 'package:kf_ess_mobile_app/features/home/presentation/cubits/home_cubit.dart'
    as _i408;
import 'package:kf_ess_mobile_app/features/insurance/data/data_sources/remote/insurance_remote_data_source.dart'
    as _i506;
import 'package:kf_ess_mobile_app/features/insurance/data/repositories/insurance_repository_impl.dart'
    as _i454;
import 'package:kf_ess_mobile_app/features/insurance/domain/repositories/insurance_repository.dart'
    as _i1062;
import 'package:kf_ess_mobile_app/features/insurance/domain/use_cases/get_insurance_usecase.dart'
    as _i595;
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_cubit.dart'
    as _i163;
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
import 'package:kf_ess_mobile_app/features/requests/domain/use_cases/get_requests_usecase.dart'
    as _i270;
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_cubit.dart'
    as _i313;
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart'
    as _i1030;
import 'package:kf_ess_mobile_app/features/shared/cubit/locale_cubit/locale_cubit.dart'
    as _i101;
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
import 'package:kf_ess_mobile_app/features/splash/presentation/cubits/splash_cubit.dart'
    as _i79;
import 'package:kf_ess_mobile_app/features/visitors_logs/data/data_sources/remote/visitors_logs_remote_data_source.dart'
    as _i643;
import 'package:kf_ess_mobile_app/features/visitors_logs/data/repositories/visitors_logs_repository_impl.dart'
    as _i72;
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/repositories/visitors_logs_repository.dart'
    as _i1026;
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
  gh.factory<_i79.SplashCubit>(() => _i79.SplashCubit());
  gh.factory<_i101.LocaleCubit>(() => _i101.LocaleCubit());
  gh.factory<_i501.ThemeCubit>(() => _i501.ThemeCubit());
  gh.factory<_i777.LocationCubit>(() => _i777.LocationCubit());
  gh.factory<_i768.FilePickerCubit>(() => _i768.FilePickerCubit());
  gh.factory<_i735.PDFCubit>(() => _i735.PDFCubit());
  gh.factory<_i749.DatePickerCubit>(() => _i749.DatePickerCubit());
  gh.factory<_i1030.TabCubit>(() => _i1030.TabCubit());
  await gh.singletonAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<_i735.CheckboxCubit>(() => _i735.CheckboxCubit(gh<bool>()));
  gh.lazySingleton<_i361.Dio>(
      () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
  gh.factory<_i675.NetworkHelper>(() => _i675.NetworkHelper(gh<_i361.Dio>()));
  gh.factory<_i602.MoreRemoteDataSource>(
      () => _i602.MoreDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i90.PeraonalInfoRemoteDataSource>(
      () => _i90.PeraonalInfoDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i399.MyAttendanceRemoteDataSource>(
      () => _i399.MyAttendanceDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i506.InsuranceRemoteDataSource>(
      () => _i506.InsuranceDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i119.CreateRequestRemoteDataSource>(
      () => _i119.CreateRequestDataSourceImpl(gh<_i675.NetworkHelper>()));
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
  gh.factory<_i188.SubmissionsRepository>(() => _i542.SubmissionsRepositoryImp(
      submissionsRemoteDataSource: gh<_i809.SubmissionsRemoteDataSource>()));
  gh.factory<_i396.NotificationsRemoteDataSource>(
      () => _i396.NotificationsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i508.MoreRepository>(() => _i920.MoreRepositoryImp(
      moreRemoteDataSource: gh<_i602.MoreRemoteDataSource>()));
  gh.factory<_i826.AuthRemoteDataSource>(
      () => _i826.AuthDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i710.ProfileRemoteDataSource>(
      () => _i710.ProfileDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i951.ForgetPassRemoteDataSource>(
      () => _i951.ForgetPassDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i560.RequestsRemoteDataSource>(
      () => _i560.RequestsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i265.ForgetPassRepository>(() => _i151.ForgetPassRepositoryImp(
      forgetPassRemoteDataSource: gh<_i951.ForgetPassRemoteDataSource>()));
  gh.factory<_i974.RequestsRepository>(() => _i180.RequestsRepositoryImp(
      requestsRemoteDataSource: gh<_i560.RequestsRemoteDataSource>()));
  gh.factory<_i643.VisitorsLogsRemoteDataSource>(
      () => _i643.VisitorsLogsDataSourceImpl(gh<_i675.NetworkHelper>()));
  gh.factory<_i504.CertificatesRepository>(() =>
      _i408.CertificatesRepositoryImp(
          certificatesRemoteDataSource:
              gh<_i956.CertificatesRemoteDataSource>()));
  gh.factory<_i776.GetForgetPassUseCase>(() => _i776.GetForgetPassUseCase(
      forgetPassRepository: gh<_i265.ForgetPassRepository>()));
  gh.factory<_i243.GetHomeUseCase>(
      () => _i243.GetHomeUseCase(homeRepository: gh<_i219.HomeRepository>()));
  gh.factory<_i273.GetMoreUseCase>(
      () => _i273.GetMoreUseCase(moreRepository: gh<_i508.MoreRepository>()));
  gh.factory<_i254.GetCertificatesUseCase>(() => _i254.GetCertificatesUseCase(
      certificatesRepository: gh<_i504.CertificatesRepository>()));
  gh.factory<_i848.AuthRepository>(() => _i88.AuthRepositoryImp(
      authRemoteDataSource: gh<_i826.AuthRemoteDataSource>()));
  gh.factory<_i715.GetPeraonalInfoUseCase>(() => _i715.GetPeraonalInfoUseCase(
      peraonalInfoRepository: gh<_i786.PeraonalInfoRepository>()));
  gh.factory<_i969.ForgetPassCubit>(() => _i969.ForgetPassCubit(
      getForgetPassUseCase: gh<_i776.GetForgetPassUseCase>()));
  gh.factory<_i835.MyAttendanceRepository>(() =>
      _i1001.MyAttendanceRepositoryImp(
          myAttendanceRemoteDataSource:
              gh<_i399.MyAttendanceRemoteDataSource>()));
  gh.factory<_i1062.InsuranceRepository>(() => _i454.InsuranceRepositoryImp(
      insuranceRemoteDataSource: gh<_i506.InsuranceRemoteDataSource>()));
  gh.factory<_i218.NotificationsRepository>(() =>
      _i1012.NotificationsRepositoryImp(
          notificationsRemoteDataSource:
              gh<_i396.NotificationsRemoteDataSource>()));
  gh.factory<_i270.GetRequestsUseCase>(() => _i270.GetRequestsUseCase(
      requestsRepository: gh<_i974.RequestsRepository>()));
  gh.factory<_i464.GetAuthUseCase>(
      () => _i464.GetAuthUseCase(authRepository: gh<_i848.AuthRepository>()));
  gh.factory<_i397.CreateRequestRepository>(() =>
      _i725.CreateRequestRepositoryImp(
          createRequestRemoteDataSource:
              gh<_i119.CreateRequestRemoteDataSource>()));
  gh.factory<_i246.ProfileRepository>(() => _i249.ProfileRepositoryImp(
      profileRemoteDataSource: gh<_i710.ProfileRemoteDataSource>()));
  gh.factory<_i232.AuthCubit>(
      () => _i232.AuthCubit(getAuthUseCase: gh<_i464.GetAuthUseCase>()));
  gh.factory<_i9.GetSubmissionsUseCase>(() => _i9.GetSubmissionsUseCase(
      submissionsRepository: gh<_i188.SubmissionsRepository>()));
  gh.factory<_i727.GetProfileUseCase>(() => _i727.GetProfileUseCase(
      profileRepository: gh<_i246.ProfileRepository>()));
  gh.factory<_i1026.VisitorsLogsRepository>(() =>
      _i72.VisitorsLogsRepositoryImp(
          visitorsLogsRemoteDataSource:
              gh<_i643.VisitorsLogsRemoteDataSource>()));
  gh.factory<_i447.PeraonalInfoCubit>(() => _i447.PeraonalInfoCubit(
      getPeraonalInfoUseCase: gh<_i715.GetPeraonalInfoUseCase>()));
  gh.factory<_i623.CertificatesCubit>(() => _i623.CertificatesCubit(
      getCertificatesUseCase: gh<_i254.GetCertificatesUseCase>()));
  gh.factory<_i362.GetNotificationsUseCase>(() => _i362.GetNotificationsUseCase(
      notificationsRepository: gh<_i218.NotificationsRepository>()));
  gh.factory<_i595.GetInsuranceUseCase>(() => _i595.GetInsuranceUseCase(
      insuranceRepository: gh<_i1062.InsuranceRepository>()));
  gh.factory<_i266.GetVisitorsLogsUseCase>(() => _i266.GetVisitorsLogsUseCase(
      visitorsLogsRepository: gh<_i1026.VisitorsLogsRepository>()));
  gh.factory<_i313.RequestsCubit>(() =>
      _i313.RequestsCubit(getRequestsUseCase: gh<_i270.GetRequestsUseCase>()));
  gh.factory<_i163.InsuranceCubit>(() => _i163.InsuranceCubit(
      getInsuranceUseCase: gh<_i595.GetInsuranceUseCase>()));
  gh.factory<_i408.HomeCubit>(
      () => _i408.HomeCubit(getHomeUseCase: gh<_i243.GetHomeUseCase>()));
  gh.factory<_i107.GetMyAttendanceUseCase>(() => _i107.GetMyAttendanceUseCase(
      myAttendanceRepository: gh<_i835.MyAttendanceRepository>()));
  gh.factory<_i693.MoreCubit>(
      () => _i693.MoreCubit(getMoreUseCase: gh<_i273.GetMoreUseCase>()));
  gh.factory<_i588.ProfileCubit>(() =>
      _i588.ProfileCubit(getProfileUseCase: gh<_i727.GetProfileUseCase>()));
  gh.factory<_i540.VisitorsLogsCubit>(() => _i540.VisitorsLogsCubit(
      getVisitorsLogsUseCase: gh<_i266.GetVisitorsLogsUseCase>()));
  gh.factory<_i1068.GetCreateRequestUseCase>(() =>
      _i1068.GetCreateRequestUseCase(
          createRequestRepository: gh<_i397.CreateRequestRepository>()));
  gh.factory<_i791.NotificationsCubit>(() => _i791.NotificationsCubit(
      getNotificationsUseCase: gh<_i362.GetNotificationsUseCase>()));
  gh.factory<_i368.SubmissionsCubit>(() => _i368.SubmissionsCubit(
      getSubmissionsUseCase: gh<_i9.GetSubmissionsUseCase>()));
  gh.factory<_i674.MyAttendanceCubit>(() => _i674.MyAttendanceCubit(
      getMyAttendanceUseCase: gh<_i107.GetMyAttendanceUseCase>()));
  gh.factory<_i708.CreateRequestCubit>(() => _i708.CreateRequestCubit(
      getCreateRequestUseCase: gh<_i1068.GetCreateRequestUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i758.RegisterModule {}
