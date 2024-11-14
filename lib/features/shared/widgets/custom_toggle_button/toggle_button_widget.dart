import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/toggle_button_model.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_toggle_button/custom_toggle_button_cubit.dart';

class CustomToggleWidget extends StatelessWidget {
  const CustomToggleWidget({
    super.key,
    required this.keyValue,
    required this.toggleCubit,
    required this.toggleModel,
    required this.onToggle,
  });

  final String keyValue;
  final ToggleCubit toggleCubit;
  final ToggleModel toggleModel;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToggleCubit, Map<String, bool>>(
      bloc: toggleCubit,
      builder: (BuildContext context, Map<String, bool> state) {
        final bool isOn = toggleCubit.getValue(keyValue);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // "On" Button
            GestureDetector(
              onTap: () {
                if (!isOn) {
                  toggleModel.setValue(keyValue, true);
                  onToggle(true);
                }
              },
              child: Container(
                height: 56.h,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                decoration: BoxDecoration(
                  color: isOn ? Palette.yellow_FBD823 : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isOn ? Colors.transparent : Palette.gray_C6C6C6,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: AppText(
                    text: context.tr("english"),
                    style: AppTextStyle.semiBold_12,
                    textColor: isOn ? Colors.black : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),

            // "Off" Button
            GestureDetector(
              onTap: () {
                if (isOn) {
                  toggleModel.setValue(keyValue, false);
                  onToggle(false);
                }
              },
              child: Container(
                height: 56.h,
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                decoration: BoxDecoration(
                  color: !isOn ? Palette.yellow_FBD823 : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: !isOn ? Colors.transparent : Palette.gray_C6C6C6,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: AppText(
                    text: context.tr("arabic"),
                    style: AppTextStyle.semiBold_12,
                    textColor: !isOn ? Colors.black : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
