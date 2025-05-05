import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/language_helper.dart';
import '../../../core/utility/palette.dart';
import '../../di/dependency_init.dart';
import '../cubit/locale_cubit/locale_cubit.dart';
import 'app_text.dart';
import 'custom_app_bar_widget.dart';
import 'custom_elevated_button_widget.dart';

class AuthAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final LocaleCubit _localeCubit = getIt<LocaleCubit>();
  AuthAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      isDrawerEnabled: true,
      appBarBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            15.verticalSpace,
            AppText(
              text: context.tr("kuwait_fund"),
              style: AppTextStyle.extraBold_26,
              textColor: Palette.white,
            ),
            5.verticalSpace,
            AppText(
              text: context.tr("kuwait_fund_ess"),
              style: AppTextStyle.medium_26,
              textColor: Palette.white,
            ),
          ]),
      actions: [
        CustomElevatedButton(
          removeWidth: true,
          height: 30.h,
          width: 120.w,
          backgroundColor: Colors.transparent,
          textStyle: AppTextStyle.semiBold_20,
          text: LanguageHelper.isAr(context)
              ? context.tr("english")
              : context.tr("arabic"),
          onPressed: () {
            debugPrint("Toggling locale...");
            _localeCubit.toggleLocale(context, !LanguageHelper.isEN(context));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(240.h);
}
