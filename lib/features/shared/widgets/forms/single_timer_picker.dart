// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/core/utility/theme.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_label.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class CustomSingleTimePicker extends StatefulWidget {
  const CustomSingleTimePicker({
    super.key,
    this.hintText,
    this.firstDate,
    this.initialTime,
    this.lastDate,
    this.disableField = false,
    this.initNull = false,
    required this.keyNameFrom,
    this.validator,
    this.onChanged,
    required this.customFormKey,
    this.fromLabelAboveField,
    this.icon,
  });
  final String? hintText;
  final String keyNameFrom;
  final DateTime? firstDate;
  final TimeOfDay? initialTime;
  final DateTime? lastDate;
  //final TextEditingController controller;
  final String? Function(String?)? validator;
  final GlobalKey<FormBuilderState> customFormKey;
  final bool? disableField;
  final bool? initNull;
  final Function(String?)? onChanged;
  final String? fromLabelAboveField;
  final String? icon;

  @override
  State<CustomSingleTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomSingleTimePicker> {
  final TextEditingController _timeController = TextEditingController();

  TimeOfDay selectedTime = TimeOfDay.now();

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
            controller: _timeController,
            //   height: 56.h,
            fieldName: widget.keyNameFrom,
            hintText: widget.hintText ?? "",
            initialValue: widget.initialTime?.toString(),
            enableBorder: true,
            onTap: () async {
              if (!(widget.disableField ?? false)) {
                _selectTime();
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
                _selectTime();
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: Palette.primaryColor,
                onPrimary: Colors.white,
              ),
              dialogBackgroundColor: Palette.white,
            ),
            child: child!,
          );
        });

    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      _timeController.text = selectedTime.format(context);
      widget.customFormKey.currentState!.fields[widget.keyNameFrom]!
          .didChange(selectedTime);
    }

    // if (pickedTime != null && pickedTime != selectedTime)
    //   setState(() {
    //     selectedTime = pickedTime;
    //   });
  }
}
