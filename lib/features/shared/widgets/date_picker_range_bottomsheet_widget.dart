import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utility/palette.dart';
import '../../di/dependency_init.dart';
import '../cubit/date_picker_range_cubit/range_date_picker_cubit.dart';
import 'app_text.dart';
import 'custom_elevated_button_widget.dart';

class RangeDatePickerBottomsheetWidget extends StatelessWidget {
  RangeDatePickerBottomsheetWidget({
    super.key,
    this.fromDateController,
    this.toDateController,
    this.consumedDays,
    this.totalDays,
    this.labelTitle,
    this.initialDate,
    this.initNull,
    this.firstDate,
    this.lastDate,
    this.customFormKey,
    this.selectedRange,
    this.isReadOnly = false,
    this.isMustSelectToday = false,
    required this.onDoneCallback,
  });

  final TextEditingController? fromDateController;
  final TextEditingController? toDateController;
  final int? consumedDays;
  final int? totalDays;
  final String? labelTitle;
  final DateTime? initialDate;
  final bool? initNull;
  final bool isMustSelectToday;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final GlobalKey<FormBuilderState>? customFormKey;
  final DateTimeRange? selectedRange;
  final bool isReadOnly;
  final void Function(bool, DateTimeRange? pickedRange) onDoneCallback;
  final RangeDatePickerCubit rangeDatePickerCubit =
      getIt<RangeDatePickerCubit>();

      DateTime? _selectedFromDate ;
      DateTime? _selectedToDate ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => rangeDatePickerCubit,
      child: BlocBuilder<RangeDatePickerCubit, RangeDatePickerState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              10.verticalSpace,
              if (state.consumedDays != null && totalDays != null)
                Container(
                  decoration: BoxDecoration(
                    color: Palette.yellow_FBD823,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.0.h, horizontal: 20.w),
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
                          text: "${state.consumedDays}" "/",
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
                selectedRange: selectedRange,
                initialDate:
                    initialDate ?? ((initNull ?? true) ? null : DateTime.now()),
                minDate: firstDate ?? DateTime.now(),
                maxDate: lastDate ??
                    DateTime.now().add(const Duration(days: 365 * 10)),
                selectedCellsDecoration: BoxDecoration(
                  color: Palette.blue_ECEEF4,
                ),
                selectedCellsTextStyle: TextStyle(
                    color: Palette.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
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
                initialPickerType: PickerType.days,
                leadingDateTextStyle: const TextStyle(
                    color: Palette.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
                slidersColor: Palette.primaryColor.withOpacity(0.2),
                highlightColor: Colors.redAccent,
                slidersSize: 20,
                splashRadius: 20,
                centerLeadingDate: false,
                onRangeSelected: (DateTimeRange? value) {
                  if (value != null) {
                    final selectedDays =
                        value.end.difference(value.start).inDays;

                    if (totalDays != null && selectedDays > totalDays!) {
                      // fromDateController?.text = "";
                      // toDateController?.text = "";
                      // customFormKey?.currentState!.fields["from"]!
                      //     .didChange("");
                      // customFormKey?.currentState!.fields["to"]!.didChange("");
                      // Show a message if the selected range exceeds totalDays
                      rangeDatePickerCubit.emitErrorMessage(
                          context.tr("selected_days_exceeds_available_days"));

                      return; // Prevent further processing
                    }
                    else if(isMustSelectToday){
                      if (value.start.isAfter(DateTime.now())) {
                        // fromDateController?.text = "";
                        // toDateController?.text = "";
                        // customFormKey?.currentState!.fields["from"]!
                        //     .didChange("");
                        // customFormKey?.currentState!.fields["to"]!.didChange("");
                        // Show a message if the selected range exceeds totalDays
                        rangeDatePickerCubit.emitErrorMessage(
                            context.tr("please_select_today"));

                        return; // Prevent further processing
                      }
                    }
                     

                    // Update the consumed days in the cubit
                    rangeDatePickerCubit.updateConsumedDays(selectedDays);



                    _selectedFromDate = value.start;
                    _selectedToDate = value.end;
                  
                  }
                },
              ),
              if (state.errorMessage != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: AppText(
                    text: state.errorMessage!,
                    style: AppTextStyle.regular_14,
                    textColor: Palette.red_FF0606,
                  ),
                ),
              10.verticalSpace,
              CustomElevatedButton(
                onPressed: () {
                  if (rangeDatePickerCubit.state.consumedDays == 0) {
                    rangeDatePickerCubit.emitErrorMessage(
                        context.tr("please_select_from_and_to_dates"));
                    return;
                  } else {
                    onDoneCallback(state.errorMessage == null, selectedRange);

                      if (fromDateController != null) fromDateController?.text = "";
                  if (toDateController != null) toDateController?.text = "";

                  
                   if (fromDateController != null && _selectedFromDate != null) {
                      fromDateController?.text =
                          DateFormat("dd/MM/yyyy", "en").format(_selectedFromDate!);
                      customFormKey?.currentState!.fields["from"]!.didChange(
                          DateFormat("dd/MM/yyyy", "en").format(_selectedFromDate!));
                      
                    }
                    if (toDateController != null && _selectedToDate != null) {
                      toDateController?.text =
                          DateFormat("dd/MM/yyyy", "en").format( _selectedToDate!);

                      customFormKey?.currentState!.fields["to"]!.didChange(
                          DateFormat("dd/MM/yyyy", "en").format(_selectedToDate!));
                    }
                  }
                },
                text: context.tr("done"),
              ),
              CustomElevatedButton(
                backgroundColor: Palette.transparntColor,
                onPressed: () {
                
                  Navigator.pop(context);
                },
                text: context.tr("cancel"),
                textColor: Palette.primaryBackgroundDarkTheme,
              ),
            ],
          );
        },
      ),
    );
  }
}
