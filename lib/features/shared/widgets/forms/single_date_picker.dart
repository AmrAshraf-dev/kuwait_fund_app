// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/core/utility/theme.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/date_picker_range_bottomsheet_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_label.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class CustomSingleRangeDatePicker extends StatefulWidget {
  const CustomSingleRangeDatePicker({
    super.key,
    this.hintText,
    this.firstDate,
    this.initialDate,
    this.lastDate,
    this.disableField = false,
    this.initNull = false,
    required this.keyNameFrom,
    this.validator,
    this.onChanged,
    required this.customFormKey,
    this.fromLabelAboveField,
    this.labelTitle,
    this.consumedDays,
    this.totalDays,
    this.icon,
  });
  final String? hintText;
  final String keyNameFrom;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final DateTime? lastDate;
  //final TextEditingController controller;
  final String? Function(String?)? validator;
  final GlobalKey<FormBuilderState> customFormKey;
  final bool? disableField;
  final bool? initNull;
  final Function(String?)? onChanged;
  final String? fromLabelAboveField;
  final String? labelTitle;
  final int? consumedDays;
  final int? totalDays;
  final String? icon;

  @override
  State<CustomSingleRangeDatePicker> createState() =>
      _CustomSingleRangeDatePickerState();
}

class _CustomSingleRangeDatePickerState
    extends State<CustomSingleRangeDatePicker> {
  final TextEditingController _fromDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.fromLabelAboveField != null)
          AppText(
            text: widget.fromLabelAboveField,
            textColor: AppTheme.inDarkMode(context,
                dark: Palette.white, light: Palette.darkBlue),
            style: AppTextStyle.medium_16,
          ),
        Padding(
          padding: widget.fromLabelAboveField != null
              ? EdgeInsets.only(top: 10.h)
              : EdgeInsets.zero,
          child: TextLabel(
            //   height: 56.h,
            fieldName: widget.keyNameFrom,
            hintText: widget.hintText ?? "",
            initialValue: widget.initialDate != null
                ? DateFormat("yyyy-MM-dd", "en").format(widget.initialDate!)
                : null,
            enableBorder: true,
            onTap: () async {
              if (!(widget.disableField ?? false)) {
                _selectFullScreenDate(
                    labelTitle: widget.labelTitle,
                    consumedDays: widget.consumedDays,
                    totalDays: widget.totalDays);
              }
            },
            validator: widget.validator,
            disableEditingTextFiled: true,
            onChanged: widget.onChanged,
            borderColor: Palette.borderColorFill,
            fromDateTimePicker: !(widget.disableField ?? false),
            backgroundColor: widget.disableField ?? false
                ? Palette.borderColorFill
                : Palette.semiBlack,
            marginWidth: 0,
            iconPath: widget.icon ?? Assets.svg.dateIcon.path,
            //  iconColor: Palette.primaryColor,
            onIconPressed: () async {
              if (!widget.disableField!) {
                _selectFullScreenDate(
                    labelTitle: widget.labelTitle,
                    consumedDays: widget.consumedDays,
                    totalDays: widget.totalDays);
              }
            },
          ),
        ),
      ],
    );
  }

  void _selectFullScreenDate(
      {required String? labelTitle,
      required int? consumedDays,
      required int? totalDays}) {
    ViewsToolbox.showBottomSheet(
        height: 1.sh - 100,
        context: context,
        widget: RangeDatePickerBottomsheetWidget(
            onDoneCallback: (bool isSelectedRangeValid) {},
            customFormKey: widget.customFormKey,
            fromDateController: _fromDateController,
            labelTitle: labelTitle,
            consumedDays: consumedDays,
            totalDays: totalDays));
  }
}
