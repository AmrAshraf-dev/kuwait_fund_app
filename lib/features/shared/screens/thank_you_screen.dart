import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class ThankYouScreen extends StatefulWidget {
  final String? title;
  final String? subtitle;
  const ThankYouScreen({super.key, this.title, this.subtitle});

  @override
  State<ThankYouScreen> createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
              isBackEnabled: false,

        hasScroll: false,
        screenTitle: context.tr("thank_you"),
        widget: Column(
          children: [
            Flexible(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 1.sh,
                      decoration: ShapeDecoration(
                        color: Palette.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            105.verticalSpace,
                            SvgPicture.asset(checkMark),
                            66.verticalSpace,
                            MainTitleWidget(
                              title: widget.title ?? "",
                              fontStyle: AppTextStyle.bold_24,
                              indicatorWidth: 81.w,
                              isCenter: true,
                            ),
                            10.verticalSpace,
                            AppText(
                                maxLines: 2,
                                text: widget.subtitle ?? "",
                                style: AppTextStyle.medium_16,
                                textAlign: TextAlign.center,
                                textColor: Palette.gery_6C6D6F),
                            143.verticalSpace,
                            CustomElevatedButton(
                                textStyle: AppTextStyle.medium_20,
                                text: context.tr("ok_thank_you"),
                                onPressed: () {
                                  CustomMainRouter.push(NavigationMainRoute());
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
