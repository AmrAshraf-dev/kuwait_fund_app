import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_text.dart';
import 'check_box_cubit.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.checkboxCubit,
    required this.index,
    this.label,
    this.richTextWidget,
  });
  final CheckboxCubit checkboxCubit;
  final String? label;
  final int index;
  final Text? richTextWidget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckboxCubit, Map<int, bool>>(
      bloc: checkboxCubit,
      builder: (BuildContext context, Map<int, bool> state) {
        bool isChecked = state[index] ?? false;

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 28.0.h,
              width: 28.0.w,
              child: Checkbox(
                side: BorderSide(
                  color: Colors.black,
                ),
                hoverColor: Colors.transparent,

                //fillColor: WidgetStateProperty.all<Color>(Colors.white),
                checkColor: Colors.black,
                activeColor: Colors.transparent,
                value: isChecked,
                onChanged: (bool? value) {
                  checkboxCubit.toggleCheckbox(index);
                },
              ),
            ),
            10.horizontalSpace,
            label == null
                ? SizedBox()
                : Flexible(
                    child: AppText(
                      style: AppTextStyle.semiBold_16,
                      text: label,
                    ),
                  ),
            richTextWidget == null
                ? SizedBox()
                : Flexible(child: richTextWidget!)
          ],
        );
      },
    );
  }
}
