// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/core/utility/theme.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
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
    required this.customFormKey,
    this.fromLabelAboveField,
    this.labelTitle,
    this.consumedDays,
    this.totalDays,
    this.icon,
    this.isFirstDayRequired = false,
  });
  final String? hintText;
  final String keyNameFrom;
  final DateTime? firstDate;
  final DateTime? initialDate;
  final DateTime? lastDate;
  final bool  isFirstDayRequired;
  //final TextEditingController controller;
  final String? Function(String?)? validator;
  final GlobalKey<FormBuilderState> customFormKey;
  final bool? disableField;
  final bool? initNull;
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
  final TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;
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
                ? DateFormat("dd/MM/yyyy", "en").format(widget.initialDate!)
                : null,
            enableBorder: true,
            onTap: () async {
              if (!(widget.disableField ?? false)) {
                  if(widget.isFirstDayRequired && widget.firstDate==null){
                  ViewsToolbox.showErrorAwesomeSnackBar(context, 
                  "please_select_to_date_first".tr());
                  return;
                }
                _selectDate(context);
              }
            },
            validator: widget.validator,
            disableEditingTextFiled: true,
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
                if(widget.isFirstDayRequired && widget.firstDate==null){
                  ViewsToolbox.showErrorAwesomeSnackBar(context, 
                  "please_select_to_date_first".tr());
                  return;
                }
                _selectDate(context);
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          widget.initialDate ??
          (widget.initNull! ? null : DateTime.now()),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate:
          widget.lastDate ?? DateTime.now().add(const Duration(days: 365 * 10)),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      _dateController.text =
          DateFormat("dd/MM/yyyy", "en").format(selectedDate!);
      widget.customFormKey.currentState!.fields[widget.keyNameFrom]!
          .didChange(DateFormat("dd/MM/yyyy", "en").format(selectedDate!));
    }
  }
}
