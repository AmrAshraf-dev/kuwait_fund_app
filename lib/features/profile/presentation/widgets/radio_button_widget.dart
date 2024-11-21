import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key , required this.title , required this.index , required this.onChanged , required this.selectedIndex});

  final String title;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        OutlinedButton(
          onPressed: () {
              widget.onChanged(widget.index);
          },
          style: OutlinedButton.styleFrom(
            shape: CircleBorder(),
            side: BorderSide(
                width: 1.w,
                color: Palette.blue_0C4192,),
          ),
          child: Container(
            width: 22.w,
            height: 22.h,
            margin: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.selectedIndex == widget.index ? Palette.yellow_FBD823 : Colors.white,
            ),
          ),
        ),
        AppText(
          text: widget.title,
          style: AppTextStyle.semiBold_16,
        ),
      ],
    );
  }
}
