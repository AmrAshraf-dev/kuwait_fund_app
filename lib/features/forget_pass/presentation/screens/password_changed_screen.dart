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
import 'package:kf_ess_mobile_app/features/shared/widgets/auth_screens_app_bar_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/drawer_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class PasswordChangedScreen extends StatefulWidget {
  const PasswordChangedScreen({super.key});

  @override
  State<PasswordChangedScreen> createState() => _PasswordChangedScreenState();
}

class _PasswordChangedScreenState extends State<PasswordChangedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
              isBackEnabled: false,

        hasScroll: false,
        drawer: DrawerSideMenu(),
        appBar: AuthAppBarWidget(),
        widget: Column(
          children: [
            Flexible(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Palette.primaryColor),
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
                            children: [
                              105.verticalSpace,
                              SvgPicture.asset(checkMark),
                              66.verticalSpace,
                              Container(
                                padding: EdgeInsets.only(
                                  bottom: 7,
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Palette.darkOrange_E09948,
                                  width: 7.0.w,
                                ))),
                                child: AppText(
                                  text: context.tr("password_changed"),
                                  style: AppTextStyle.bold_24,
                                ),
                              ),
                              143.verticalSpace,
                              CustomElevatedButton(
                                  textStyle: AppTextStyle.medium_20,
                                  text: context.tr("ok_thank_you"),
                                  onPressed: () {
                                    CustomMainRouter.push(AuthRoute());
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
