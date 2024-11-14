// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/core/utility/theme.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_label.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class CustomRangeDatePicker extends StatefulWidget {
  const CustomRangeDatePicker({
    super.key,
    this.hintText,
    this.firstDate,
    this.initialDate,
    this.lastDate,
    this.disableField = false,
    this.initNull = false,
    required this.keyNameFrom,
    required this.keyNameTo,
    this.validator,
    this.onChanged,
    required this.customFormKey,
    this.fromLabelAboveField,
    this.toLabelAboveField,
    required this.labelTitle,
    required this.consumedDays,
    required this.totalDays,
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
  final bool? disableField;
  final bool? initNull;
  final Function(String?)? onChanged;
  final String? fromLabelAboveField;
  final String? toLabelAboveField;
  final String labelTitle;
  final int consumedDays;
  final int totalDays;

  @override
  State<CustomRangeDatePicker> createState() => _CustomRangeDatePickerState();
}

class _CustomRangeDatePickerState extends State<CustomRangeDatePicker> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
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
              iconPath: Assets.svg.dateIcon.path,
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
                  initialValue: widget.initialDate != null
                      ? DateFormat("yyyy-MM-dd", "en")
                          .format(widget.initialDate!)
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
                  iconPath: Assets.svg.dateIcon.path,
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
          ),
        ],
      ),
    );
  }

  void _selectFullScreenDate(
      {required String labelTitle,
      required int consumedDays,
      required int totalDays}) {
    ViewsToolbox.showBottomSheet(
        height: 1.sh - 100,
        context: context,
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            10.verticalSpace,
            Container(
              decoration: BoxDecoration(
                color: Palette.yellow_FBD823,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 20.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: labelTitle,
                      style: AppTextStyle.regular_16,
                    ),
                    5.horizontalSpace,
                    AppText(
                      text: "$consumedDays" "/",
                      style: AppTextStyle.bold_16,
                    ),
                    AppText(
                      text: "$totalDays",
                      style: AppTextStyle.bold_16,
                      textColor: Palette.gery_6C6D6F,
                    ),
                  ],
                ),
              ),
            ),
            RangeDatePicker(
              initialDate: widget.initialDate ??
                  (widget.initNull! ? null : DateTime.now()),
              minDate: widget.firstDate ?? DateTime.now(),
              maxDate: widget.lastDate ??
                  DateTime.now().add(const Duration(days: 365 * 10)),

              // selectedRange:
              //     DateTimeRange(start: DateTime(2022), end: Dat(2023)),
              selectedCellsDecoration: BoxDecoration(
                color: Palette.blue_ECEEF4,
                //   shape: BoxShape.circle,
              ),
              selectedCellsTextStyle: TextStyle(
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp),
              // singleSelectedCellTextStyle: const TextStyle(),

              singleSelectedCellDecoration: BoxDecoration(
                color: Palette.primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              currentDateDecoration: BoxDecoration(
                color: Palette.geryPattern,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              currentDateTextStyle:
                  TextStyle(color: Palette.black, fontSize: 16.sp),
              // daysOfTheWeekTextStyle: const TextStyle(),
              // disabledCellsTextStyle: const TextStyle(),
              // enabledCellsDecoration: const BoxDecoration(),
              // enabledCellsTextStyle: const TextStyle(),
              initialPickerType: PickerType.days,
              leadingDateTextStyle: const TextStyle(
                  color: Palette.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              slidersColor: Palette.primaryColor.withOpacity(0.2),
              highlightColor: Colors.redAccent,
              slidersSize: 20,
              //splashColor: Colors.lightBlueAccent,
              splashRadius: 20,
              centerLeadingDate: false,

              onRangeSelected: (DateTimeRange? value) {
                if (value != null) {
                  _fromDateController.text =
                      DateFormat("yyyy-MM-dd", "en").format(value.start);

                  widget.customFormKey.currentState!.fields["from"]!.didChange(
                      DateFormat("yyyy-MM-dd", "en").format(value.start));

                  _toDateController.text =
                      DateFormat("yyyy-MM-dd", "en").format(value.end);

                  widget.customFormKey.currentState!.fields["to"]!.didChange(
                      DateFormat("yyyy-MM-dd", "en").format(value.end));
                }
              },
            ),
            10.verticalSpace,
            CustomElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              text: context.tr("done"),
            ),
            CustomElevatedButton(
              backgroundColor: Palette.transparntColor,
              onPressed: () {
                _fromDateController.text = "";
                _toDateController.text = "";
                Navigator.pop(context);
              },
              text: context.tr("cancel"),
              textColor: Palette.primaryBackgroundDarkTheme,
            ),
          ],
        ));
  }
}
