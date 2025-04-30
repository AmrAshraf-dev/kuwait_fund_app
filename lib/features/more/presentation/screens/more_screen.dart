import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/di/toggle_button_model.dart';
import 'package:kf_ess_mobile_app/features/more/presentation/widgets/more_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/locale_cubit/locale_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';
import 'package:kf_ess_mobile_app/features/shared/data/secured_storage_data.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_toggle_button/custom_toggle_button_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_toggle_button/toggle_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final ToggleCubit toggleCubit = GetIt.I<ToggleCubit>();
  final ToggleModel toggleModel = GetIt.I<ToggleModel>();
  LocaleCubit localeCubit = getIt<LocaleCubit>();
  final SecuredStorageData securedStorageData = getIt<SecuredStorageData>();
  final VisitorsLogsCubit visitorsLogsCubit = getIt<VisitorsLogsCubit>();

  @override
  void initState() {
    super.initState();
    visitorsLogsCubit.getCanViewVisitorsLogs();
    _initializeToggleModel();
  }

  Future<void> _initializeToggleModel() async {
    await toggleModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: visitorsLogsCubit,
      child: MasterWidget(
        isBackEnabled: false,
        screenTitle: context.tr("more"),
        appBarHeight: 90.h,
        widget: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 24.h, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MoreItemWidget(
                  text: context.tr("profile"),
                  svgIcon: profile,
                  onTap: () {
                    CustomMainRouter.push(ProfileRoute());
                  }),
              if (LocalData.getUser()?.userInfo.isDirector ?? false)
                MoreItemWidget(
                    text: context.tr("directorMissions"),
                    svgIcon: Assets.svg.directorMissionSvg.path,
                    onTap: () {
                      CustomMainRouter.push(DirectorMissionRoute());
                    }),
              if (LocalData.getUser()?.userInfo.isDirector ?? false)
                MoreItemWidget(
                    text: context.tr("dept_mission"),
                    svgIcon: Assets.svg.deptMissionSvg.path,
                    onTap: () {
                      CustomMainRouter.push(DirectorDeptMissionRoute());
                    }),
              if (LocalData.getUser()?.userInfo.isDirector ?? false)
                MoreItemWidget(
                    text: context.tr("dept_assignment"),
                    svgIcon: Assets.svg.deptAssignment.path,
                    onTap: () {
                      CustomMainRouter.push(DirectorDeptAssignmentRoute());
                    }),
              MoreItemWidget(
                  text: context.tr("my_attendance"),
                  svgIcon: myAttendance,
                  onTap: () {
                    CustomMainRouter.push(MyAttendanceRoute());
                  }),
              MoreItemWidget(
                  text: context.tr("certificates"),
                  svgIcon: Assets.svg.certificates.path,
                  onTap: () {
                    CustomMainRouter.push(CertificatesRoute());
                  }),
              MoreItemWidget(
                  text: context.tr("advertisements"),
                  svgIcon: advertisements,
                  onTap: () {
                    CustomMainRouter.push(AdsRoute());
                  }),
              BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
                listener: (context, state) {
                  if (state is VisitorsLogsLoadingState) {
                    ViewsToolbox.showLoading();
                  } else if (state is VisitorsLogsCanViewState ||
                      state is VisitorsLogsCanNotViewState ||
                      state is VisitorsLogsErrorState ||
                      state is VisitorsLogsCanViewState) {
                    ViewsToolbox.dismissLoading();
                  }
                },
                builder: (context, state) {
                  if (state is VisitorsLogsCanNotViewState ||
                      state is VisitorsLogsErrorState ||
                      state is VisitorsLogsLoadingState) {
                    return const SizedBox();
                  }
                  return MoreItemWidget(
                      text: context.tr("visitors_logs"),
                      svgIcon: Assets.svg.visitorlogs.path,
                      onTap: () {
                        CustomMainRouter.push(VisitorsLogsRoute());
                      });
                },
              ),
              if ((LocalData.getUser()?.userInfo.isSupervisor ?? false) &&
                  (LocalData.getUser()?.userInfo.isDirector ?? false))
                MoreItemWidget(
                    text: context.tr("submissions"),
                    svgIcon: Assets.svg.submssionsMoreMenu.path,
                    onTap: () {
                      CustomMainRouter.push(SubmissionsRoute(
                        isBackButtonEnabled: true,
                      ));
                    }),
              MoreItemWidget(
                  text: context.tr("survey"),
                  svgIcon: survey,
                  onTap: () {
                    CustomMainRouter.push(SurveyRoute());
                  }),
              23.verticalSpace,
              MainTitleWidget(title: context.tr("general_information")),
              5.verticalSpace,
              MoreItemWidget(
                  text: context.tr("about_kuwait_fund"),
                  svgIcon: about,
                  onTap: () {
                    CustomMainRouter.push(AboutRoute());
                  }),
              MoreItemWidget(
                  text: context.tr("operations_and_statistics"),
                  svgIcon: operation,
                  onTap: () {
                    CustomMainRouter.push(OperationsRoute());
                  }),
              MoreItemWidget(
                  text: context.tr("contact_us"),
                  svgIcon: contactus,
                  onTap: () {
                    CustomMainRouter.push(ContactUsRoute());
                  }),
              23.verticalSpace,
              MainTitleWidget(title: context.tr("other_settings")),
              5.verticalSpace,
              MoreItemWidget(
                text: context.tr("enable_smart_login"),
                svgIcon: enableSmartLogin,
                onTap: () {},
                toggleButton: CustomToggleWidget(
                  keyValue: "smartLoginToggle",
                  toggleCubit: toggleCubit,
                  toggleModel: toggleModel,
                  enabledTitle: context.tr("enable"),
                  disabledTitle: context.tr("disable"),
                  onToggle: (bool isEnable) {
                    LocalData.setSmartLogin(isEnable);
                  },
                ),
              ),
              MoreItemWidget(
                text: context.tr("language"),
                svgIcon: language,
                onTap: () {},
                toggleButton: CustomToggleWidget(
                  keyValue: "languageToggle",
                  toggleCubit: toggleCubit,
                  toggleModel: toggleModel,
                  enabledTitle: context.tr("english"),
                  disabledTitle: context.tr("arabic"),
                  onToggle: (bool isEnable) {
                    localeCubit.toggleLocale(context, isEnable);
                  },
                ),
              ),
              MoreItemWidget(
                  text: context.tr("applicationVersion"),
                  svgIcon: appVersion,
                  leadingText: "1.0.0",
                  onTap: () {}),
              MoreItemWidget(
                  text: context.tr("logout"),
                  svgIcon: logout,
                  onTap: () {
                    CustomMainRouter.push(AuthRoute());
                    LocalData.clearAllData();
                    //       securedStorageData.clearCredentials();
                  }),
              32.verticalSpace,
              Center(
                child: SizedBox(
                  width: 290.w,
                  child: AppText(
                      maxLines: 2,
                      text: context.tr("all_rights_reserved").replaceAll(
                          'rightsYear', DateTime.now().year.toString()),
                      style: AppTextStyle.medium_12,
                      textAlign: TextAlign.center,
                      textColor: Palette.grey_8C8181),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
