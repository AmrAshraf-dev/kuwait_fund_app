import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class DrawerSideMenu extends StatelessWidget {
  const DrawerSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337.w,
      child: Drawer(
        backgroundColor: Palette.primaryColor,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: 250.h,
                child: Stack(
                  children: [
                    Center(
                      child: DrawerHeader(
                          decoration: BoxDecoration(
                            color: Palette.primaryColor,
                          ),
                          child: Image.asset(appLogo)),
                    ),
                    // close icon button to top left
                    Positioned(
                      top: 0,
                      left: 15,
                      child: IconButton(
                        icon: Icon(Icons.close,
                            color: Palette.white, size: 40.sp),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  color: Palette.white,
                  height: 1.sh,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(start: 40.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        45.verticalSpace,
                        ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Row(
                            children: [
                              SvgPicture.asset(drawerAbout),
                              10.horizontalSpace,
                              AppText(
                                text: context.tr("about_kuwait_fund"),
                                style: AppTextStyle.medium_16,
                              ),
                            ],
                          ),
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.pushNamed(context, Routes.homeScreen);
                          },
                        ),
                        SizedBox(
                          width: 273.w,
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Row(
                            children: [
                              SvgPicture.asset(drawerOperation),
                              10.horizontalSpace,
                              AppText(
                                text: context.tr("operations_and_statistics"),
                                style: AppTextStyle.medium_16,
                              ),
                            ],
                          ),
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.pushNamed(context, Routes.homeScreen);
                          },
                        ),
                        SizedBox(
                          width: 273.w,
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                        ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: Row(
                            children: [
                              SvgPicture.asset(drawerContactUs),
                              10.horizontalSpace,
                              AppText(
                                text: context.tr("contact_us"),
                                style: AppTextStyle.medium_16,
                              ),
                            ],
                          ),
                          onTap: () {
                            // Navigator.pop(context);
                            // Navigator.pushNamed(context, Routes.homeScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
