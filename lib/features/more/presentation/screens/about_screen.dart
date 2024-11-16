import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() =>
      _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("about_kuwait_fund"),
        isBackEnabled: true,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w , vertical: 25.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTitleWidget(
                  title: context.tr('about_title1')
              ),
              12.verticalSpace,
              AppText(
                text: context.tr('about_body1'),
                style: AppTextStyle.medium_18,
              ),
              25.verticalSpace,
              MainTitleWidget(
                title: context.tr('about_title2'),
              ),
              12.verticalSpace,
              AppText(
                text: context.tr('about_body2'),
                style: AppTextStyle.medium_18,
              ),
              25.verticalSpace,
              MainTitleWidget(
                title: context.tr('about_title3'),
              ),
              12.verticalSpace,
              AppText(
                text: context.tr('about_body3'),
                style: AppTextStyle.medium_18,
              ),
            ],
          ),
        ),
    );
  }
}
