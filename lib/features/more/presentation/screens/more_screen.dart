import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/di/toggle_button_model.dart';
import 'package:kf_ess_mobile_app/features/more/presentation/widgets/more_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/locale_cubit/locale_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_toggle_button/custom_toggle_button_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_toggle_button/toggle_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
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
            MoreItemWidget(
                text: context.tr("my_attendance"),
                svgIcon: myAttendance,
                onTap: () {
                  CustomMainRouter.push(MyAttendanceRoute());
                }),
            MoreItemWidget(
                text: context.tr("certificates"),
                svgIcon: loan,
                onTap: () {
                  CustomMainRouter.push(CertificatesRoute());
                }),
            MoreItemWidget(
                text: context.tr("visitors_logs"),
                svgIcon: loan,
                onTap: () {
                  CustomMainRouter.push(VisitorsLogsRoute());
                }),
            MoreItemWidget(
                text: context.tr("advertisements"),
                svgIcon: advertisements,
                onTap: () {
                  CustomMainRouter.push(AdsRoute());
                }),
            MoreItemWidget(
                text: context.tr("survey"),
                svgIcon: survey,
                onTap: () {
                  CustomMainRouter.push(SurveyRoute());
                }),
            MoreItemWidget(
                text: context.tr("enable_smart_login"),
                svgIcon: enableSmartLogin,
                onTap: () {}),
            23.verticalSpace,
            MainTitleWidget(title: context.tr("general_information")),
            5.verticalSpace,
            MoreItemWidget(
                text: context.tr("about_kuwait_fund"),
                svgIcon: drawerAbout,
                onTap: () {
                  CustomMainRouter.push(AboutRoute());
                }),
            MoreItemWidget(
                text: context.tr("operations_and_statistics"),
                svgIcon: drawerOperation,
                onTap: () {
                  CustomMainRouter.push(OperationsRoute());
                }),
            MoreItemWidget(
                text: context.tr("contact_us"),
                svgIcon: drawerContactUs,
                onTap: () {
                  CustomMainRouter.push(ContactUsRoute());
                }),
            23.verticalSpace,
            MainTitleWidget(title: context.tr("other_settings")),
            5.verticalSpace,
            MoreItemWidget(
              text: context.tr("language"),
              svgIcon: language,
              onTap: () {},
              toggleButton: CustomToggleWidget(
                keyValue: "languageToggle",
                toggleCubit: toggleCubit,
                toggleModel: toggleModel,
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
                }),
            32.verticalSpace,
            Center(
              child: SizedBox(
                width: 272.w,
                child: AppText(
                    text: context.tr("all_rights_reserved"),
                    style: AppTextStyle.medium_12,
                    textAlign: TextAlign.center,
                    textColor: Palette.grey_8C8181),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
