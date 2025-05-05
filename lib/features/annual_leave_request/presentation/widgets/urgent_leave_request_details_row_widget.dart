
 
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/palette.dart';
import '../cubits/annual_leave_balance_cubit/annual_leave_balance_cubit.dart';
import '../cubits/annual_leave_remining_balance_cubit/annual_leave_remining_balance_cubit.dart';
import '../../../shared/widgets/leave_row_details_widget.dart';

class UrgentLeaveRequestDetailsRowWidget extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final LeaveBalanceReadyState leaveBalanceState;
  final AnnualLeaveReminingLeaveBalanceCubit reminingLeaveBalanceCubit;

  const UrgentLeaveRequestDetailsRowWidget({
    required this.formKey,
    required this.leaveBalanceState,
    required this.reminingLeaveBalanceCubit,
    super.key,
  });

  @override
  State<UrgentLeaveRequestDetailsRowWidget> createState() => _UrgentLeaveRequestDetailsRowWidgetState();
}

class _UrgentLeaveRequestDetailsRowWidgetState extends State<UrgentLeaveRequestDetailsRowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
      child: BlocBuilder<AnnualLeaveReminingLeaveBalanceCubit,
          AnnualLeaveReminingLeaveBalanceState>(
        builder: (context, state) {
          if (state.showDetails) {
            return _buildLeaveDetailsContent();
          } else {
            return _buildAvailableDays();
          }
        },
      ),
    );
  }

  Widget _buildLeaveDetailsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        5.verticalSpace,
        LeaveDaysRowItemWidget(
          title: context.tr("paid_days"),
          days: _calculatePaidDays(
                  from: widget.formKey.currentState!.fields["from"]!.value,
                  to: widget.formKey.currentState!.fields["to"]!.value)
              .toString(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Divider(thickness: 1),
        ),
        LeaveDaysRowItemWidget(
          title: context.tr("remaining_days_after_vacation"),
          days: _calculateRemainingDays(
            leaveBalance: int.parse(
                widget.leaveBalanceState.response.data?.availableBalance ??
                    "0"),
            from: widget.formKey.currentState!.fields["from"]!.value,
            to: widget.formKey.currentState!.fields["to"]!.value,
          ),
        ),
        5.verticalSpace,
      ],
    );
  }

  Widget _buildAvailableDays() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Palette.white_F7F7F7,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: LeaveDaysRowItemWidget(
        title: context.tr("available_days"),
        days: widget.leaveBalanceState.response.data?.availableBalance ?? "",
      ),
    );
  }

  String _calculateRemainingDays(
      {required int leaveBalance, required String from, required String to}) {
    return leaveBalance - _calculatePaidDays(from: from, to: to) < 0
        ? "0"
        : (leaveBalance - _calculatePaidDays(from: from, to: to)).toString();
  }

  num _calculatePaidDays({required String from, required String to}) {
    final DateTime fromDate = DateFormat("dd/MM/yyyy").parse(from);
    final DateTime toDate = DateFormat("dd/MM/yyyy").parse(to);
    return fromDate.difference(toDate).inDays == 0
        ? 1
        : fromDate.difference(toDate).inDays;
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
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
    );
  }
}

