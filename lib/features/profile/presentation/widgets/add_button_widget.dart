import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/palette.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';

class AddButtonWidget extends StatefulWidget {
  const AddButtonWidget({super.key , required this.onPressed , required this.title});

  final Function() onPressed;
  final String title;
  @override
  State<AddButtonWidget> createState() => _AddButtonWidgetState();
}

class _AddButtonWidgetState extends State<AddButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          12.horizontalSpace,
          CustomElevatedButton(
            onPressed: () {
              widget.onPressed();
            },
            backgroundColor: Palette.blue_002A6A,
            customChild: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.sp,
            ),
            width: 51.w,
            height: 47.h,
            radius: 12.r,
          ),
          20.horizontalSpace,
          AppText(
            text: widget.title,
            style: AppTextStyle.medium_18,
            textColor: Palette.blue_002A6A,
          ),
        ]
    );
  }
}
