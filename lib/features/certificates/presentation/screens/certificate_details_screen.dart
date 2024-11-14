import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class CertificateDetailsScreen extends StatelessWidget {
  const CertificateDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("certificates"),
        isBackEnabled: true,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              22.verticalSpace,
              Assets.png.certificate.image(
                  // width: 200.w,
                  // height: 200.h,
                  ),
              17.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      width: 110.w,
                      height: 50.h,
                      backgroundColor: Palette.yellow_FBD823,
                      onPressed: () {},
                      customChild: Row(
                        children: [
                          Icon(Icons.print_outlined,
                              color: Palette.black, size: 25.sp),
                          5.horizontalSpace,
                          AppText(
                            fontSize: 14.sp,
                            text: context.tr("print"),
                          )
                        ],
                      )),
                  10.horizontalSpace,
                  CustomElevatedButton(
                      width: 110.w,
                      height: 50.h,
                      backgroundColor: Palette.primaryColor,
                      onPressed: () {},
                      customChild: Row(
                        children: [
                          Icon(Icons.share_outlined,
                              color: Palette.white, size: 25.sp),
                          5.horizontalSpace,
                          AppText(
                            text: context.tr("share"),
                            textColor: Palette.white,
                            fontSize: 14.sp,
                          )
                        ],
                      ))
                ],
              ),
              22.verticalSpace,

              // cancel button
              CustomElevatedButton(
                  width: 200.w,
                  height: 50.h,
                  backgroundColor: Palette.transparntColor,
                  onPressed: () {
                    CustomMainRouter.pop();
                  },
                  customChild: AppText(
                    text: context.tr("cancel"),
                    textColor: Palette.blue_5490EB,
                    fontSize: 18.sp,
                  )),

              40.verticalSpace
            ],
          ),
        ));
  }
}
