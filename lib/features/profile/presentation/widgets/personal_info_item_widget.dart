import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/palette.dart';
import '../../../shared/widgets/app_text.dart';

class PersonalInfoItemWidget extends StatelessWidget {
  const PersonalInfoItemWidget({super.key ,required this.title,required this.body , this.withDivider = true});

  final String title;
  final String body;
  final bool? withDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: title,
          style: AppTextStyle.regular_14,
        ),
        6.verticalSpace,
        AppText(
          text: body,
          style: AppTextStyle.bold_16,
        ),
        if(withDivider ?? true)
          Divider(
            color: Palette.grey_E5DEDE,
            thickness: 1,
          ),
      ],
    );
  }
}
