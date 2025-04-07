import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/extensions/size_extensions.dart';
import '../../../core/utility/palette.dart';
import '../../../core/utility/theme.dart';
import 'app_text.dart';

class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        20.heightBox,
        Center(
          child: SvgPicture.asset(
            "assets/svg/no-internet.svg",
            width: 150.w,
          ),
        ),
        20.heightBox,
        AppText(
            text: context.tr("sorryNoInternet"),
            style: AppTextStyle.semiBold_19,
            textColor: AppTheme.inDarkMode(context,
                dark: Palette.white, light: Palette.black)),
      ],
    );
  }
}
