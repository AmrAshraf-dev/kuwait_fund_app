import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubits/annual_leave_balance_cubit/annual_leave_balance_cubit.dart';
import '../cubits/annual_leave_remining_balance_cubit/annual_leave_remining_balance_cubit.dart';
import '../../../shared/widgets/forms/single_date_picker.dart';

class UrgentLeaveRequestFormWidget extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final LeaveBalanceReadyState leaveBalanceState;
  final AnnualLeaveReminingLeaveBalanceCubit reminingLeaveBalanceCubit;

  const UrgentLeaveRequestFormWidget({
    required this.formKey,
    required this.leaveBalanceState,
    required this.reminingLeaveBalanceCubit,
    super.key,
  });

  @override
  State<UrgentLeaveRequestFormWidget> createState() => _UrgentLeaveRequestFormWidgetState();
}

class _UrgentLeaveRequestFormWidgetState extends State<UrgentLeaveRequestFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.r),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
      child: FormBuilder(
        key: widget.formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSingleRangeDatePicker(
                disableField: true,
                initialDate: DateTime.now(),
                keyNameFrom: "from",
                customFormKey: widget.formKey,
                fromLabelAboveField: context.tr("from_date"),
              ),
              20.verticalSpace,
              CustomSingleRangeDatePicker(
                disableField: false,
                firstDate: DateTime.now(),
                validator: (p0) =>
                    p0 == null ? context.tr("please_select_date") : null,
                lastDate: DateTime.now().add(Duration(
                    days: int.parse(widget.leaveBalanceState.response.data
                            ?.availableBalance ??
                        "0"))),
                keyNameFrom: "to",
                customFormKey: widget.formKey,
                fromLabelAboveField: context.tr("to_date"),
                // onChanged: (p0) {
                //   widget.reminingLeaveBalanceCubit
                //       .updateFormState(showDetails: true);
                
                // },
              ),
              20.verticalSpace,
              if (widget.leaveBalanceState.response.data?.displayExitDate ??
                  false)
                CustomSingleRangeDatePicker(
                  isFirstDayRequired: false,
                  fromLabelAboveField: context.tr("exit_date"),
                  customFormKey: widget.formKey,
                  keyNameFrom: "exit_date",
                  lastDate: DateTime.now(),
                ),
            ],
          ),
        ),
      ),
    );
  }

  
}
