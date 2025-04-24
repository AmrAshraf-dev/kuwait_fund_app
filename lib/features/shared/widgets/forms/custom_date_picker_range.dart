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

class CustomDatePickerRange extends StatefulWidget {
    CustomDatePickerRange({
    super.key,
    this.hintText,
    this.firstDate,
    this.initialDate,
    this.lastDate,
    this.isMustSelectToday=false,
    this.fromDisableField = false,
    this.toDisabledField = false,
    this.initNull = false,
    required this.keyNameFrom,
    required this.keyNameTo,
    this.validator,
    this.onChanged,
    required this.customFormKey,
    this.fromLabelAboveField,
    this.toLabelAboveField,
    required this.labelTitle,
    this.consumedDays,
    this.totalDays,
    required this.onDoneCallback,
    this.selectedRange,
  });
  final String? hintText;
  final String keyNameFrom;
  final String keyNameTo;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final DateTime? lastDate;
   //final TextEditingController controller;
  final String? Function(String?)? validator;
  final GlobalKey<FormBuilderState> customFormKey;
  final bool? fromDisableField;
  final bool? toDisabledField;
  final bool? initNull;
  final Function(String?)? onChanged;
  final String? fromLabelAboveField;
  final String? toLabelAboveField;
  final String labelTitle;
  final int? consumedDays;
  final int? totalDays;
  final void Function(bool, DateTimeRange? pickedRange) onDoneCallback;
  final DateTimeRange? selectedRange ;
  
  bool  isMustSelectToday ;

  @override
  State<CustomDatePickerRange> createState() => _CustomDatePickerRangeState();
}

class _CustomDatePickerRangeState extends State<CustomDatePickerRange> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();


  @override
  void initState() {
    if (widget.initNull == true) {
      _fromDateController.text = "";
      _toDateController.text = "";
    } else {
      if (widget.initialDate != null) {
        _fromDateController.text =
            DateFormat("dd/MM/yyyy", "en").format(widget.initialDate!);
         
      }
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
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
                  ? DateFormat("dd/MM/yyyy", "en").format(widget.initialDate!)
                  : null,
              enableBorder: true,
              onTap: () async {
                if (!(widget.fromDisableField ?? false)) {
                  _selectFullScreenDate(
                      onDoneCallback: widget.onDoneCallback,
                      widget: widget,
                      labelTitle: widget.labelTitle,
                      consumedDays: widget.consumedDays,
                      totalDays: widget.totalDays);
                }
              },
              validator: widget.validator,
              disableEditingTextFiled: true,
              onChanged: widget.onChanged,
              borderColor: Palette.borderColorFill,
              fromDateTimePicker: !(widget.fromDisableField ?? false),
              backgroundColor: widget.fromDisableField ?? false
                  ? Palette.borderColorFill
                  : Palette.semiBlack,
              marginWidth: 0,
              iconPath: Assets.svg.dateIcon.path,
              //  iconColor: Palette.primaryColor,
              onIconPressed: () async {
                if (!widget.fromDisableField!) {
                  _selectFullScreenDate(
                      onDoneCallback: widget.onDoneCallback,
                      widget: widget,
                      labelTitle: widget.labelTitle,
                      consumedDays: widget.consumedDays,
                      totalDays: widget.totalDays);
                }
              },
            ),
          ),
          20.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.toLabelAboveField != null)
                AppText(
                  text: widget.toLabelAboveField,
                  textColor: AppTheme.inDarkMode(context,
                      dark: Palette.white, light: Palette.darkBlue),
                  style: AppTextStyle.medium_16,
                ),
              Padding(
                padding: widget.toLabelAboveField != null
                    ? EdgeInsets.only(top: 10.h)
                    : EdgeInsets.zero,
                child: TextLabel(
                  //   height: 56.h,
                  fieldName: widget.keyNameTo,
                  hintText: widget.hintText ?? "",
                  // initialValue: widget.initialDate != null
                  //     ? DateFormat("dd/MM/yyyy", "en")
                  //         .format(widget.initialDate!)
                  //     : null,
                  enableBorder: true,
                  onTap: () async {
                    if (!(widget.toDisabledField ?? false)) {
                      _selectFullScreenDate(
                          onDoneCallback: widget.onDoneCallback,
                          widget: widget,
                          labelTitle: widget.labelTitle,
                          consumedDays: widget.consumedDays,
                          totalDays: widget.totalDays);
                    }
                  },
                  validator: widget.validator,
                  disableEditingTextFiled: true,
                  onChanged: widget.onChanged,
                  borderColor: Palette.borderColorFill,
                  fromDateTimePicker: !(widget.toDisabledField ?? false),
                  backgroundColor: widget.toDisabledField ?? false
                      ? Palette.borderColorFill
                      : Palette.semiBlack,
                  marginWidth: 0,
                  iconPath: Assets.svg.dateIcon.path,
                  //  iconColor: Palette.primaryColor,
                  onIconPressed: () async {
                    if (!widget.toDisabledField!) {
                      _selectFullScreenDate(
                          onDoneCallback: widget.onDoneCallback,
                          widget: widget,
                          labelTitle: widget.labelTitle,
                          consumedDays: widget.consumedDays,
                          totalDays: widget.totalDays);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _selectFullScreenDate({
    required String labelTitle,
    required int? consumedDays,
    required int? totalDays,
    required CustomDatePickerRange widget,
    required void Function(bool, DateTimeRange? pickedRange) onDoneCallback,
  }) {
    ViewsToolbox.showBottomSheet(
        height: 1.sh - 100,
        context: context,
        widget: RangeDatePickerBottomsheetWidget(
          isMustSelectToday: widget.isMustSelectToday,
          selectedRange:  widget.selectedRange,
            customFormKey: widget.customFormKey,
            initNull: widget.initNull,
            firstDate: widget.firstDate,
            lastDate: widget.lastDate,
            fromDateController: _fromDateController,
            toDateController: _toDateController,
            labelTitle: labelTitle,
            consumedDays: consumedDays,
            totalDays: totalDays,
            onDoneCallback: onDoneCallback));
  }
}
