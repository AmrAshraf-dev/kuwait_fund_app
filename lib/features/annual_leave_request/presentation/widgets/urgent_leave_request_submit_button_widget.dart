import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../../core/routes/route_sevices.dart';
import '../../../../core/routes/routes.gr.dart';
import '../../../../core/utility/palette.dart';
import '../../data/models/request/annual_leave_request_request_model.dart';
import '../cubits/annual_leave_balance_cubit/annual_leave_balance_cubit.dart';
import '../cubits/annual_leave_request_cubit.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';

class SubmitUrgentLeaveButtonWidget extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final LeaveBalanceReadyState leaveBalanceState;
  final AnnualLeaveRequestCubit annualLeaveRequestCubit;

  const SubmitUrgentLeaveButtonWidget({
    required this.formKey,
    required this.leaveBalanceState,
    required this.annualLeaveRequestCubit,
    super.key,
  });

  @override
  State<SubmitUrgentLeaveButtonWidget> createState() => _SubmitUrgentLeaveButtonWidgetState();
}

class _SubmitUrgentLeaveButtonWidgetState extends State<SubmitUrgentLeaveButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnualLeaveRequestCubit, AnnualLeaveRequestState>(
      listener: _submitButtonListener,
      builder: (context, state) {
        if (widget.leaveBalanceState.response.data?.availableBalance == "0") {
          return AppText(
            maxLines: 2,
            text: context.tr("no_available_days_for_urgent_leave"),
            style: AppTextStyle.semiBold_16,
            textColor: Palette.redBackgroundTheme,
          );
        }
        return CustomElevatedButton(
          onPressed: _onSubmitPressed,
          text: context.tr("submit"),
        );
      },
    );
  }

  void _submitButtonListener(BuildContext context, AnnualLeaveRequestState state) {
    if (state is AnnualLeaveRequestErrorState) {
      ViewsToolbox.dismissLoading();
      ViewsToolbox.showErrorAwesomeSnackBar(context, context.tr(state.message!));
    } else if (state is AnnualLeaveRequestLoadingState) {
      ViewsToolbox.showLoading();
    } else if (state is AnnualLeaveRequestReadyState) {
      ViewsToolbox.dismissLoading();
      CustomMainRouter.push(ThankYouRoute(
        onContinueCallback: () {
          CustomMainRouter.navigate(
            NavigationMainRoute(
              children: <PageRouteInfo>[
                RequestsRoute(isBackButtonEnabled: false),
              ],
            ),
          );
        },
        title: context.tr("request_submitted_successfully"),
        subtitle: context.tr(
            "your_annual_leave_request_has_been_submitted_successfully"),
      ));
    }
  }

  void _onSubmitPressed() {
    if (widget.formKey.currentState!.saveAndValidate()) {
      if (widget.formKey.currentState!.isValid) {
        widget.annualLeaveRequestCubit.createAnnualLeaveRequest(
          AnnualLeaveRequestRequestModel(
            leaveType: 0,
            startDate: _formatDate(widget.formKey.currentState!.fields["from"]!.value),
            endDate: _formatDate(widget.formKey.currentState!.fields["to"]!.value),
            exitDate: widget.formKey.currentState?.fields["exit_date"]?.value != null
                ? _formatDate(widget.formKey.currentState!.fields["exit_date"]!.value)
                : null,
          ),
        );
      }
    }
  }

  String _formatDate(String date) {
    return DateFormat("yyyy-MM-dd").format(DateFormat("dd/MM/yyyy").parse(date));
  }
}
