import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../cubits/annual_leave_balance_cubit/annual_leave_balance_cubit.dart';
import '../cubits/annual_leave_remining_balance_cubit/annual_leave_remining_balance_cubit.dart';
import '../cubits/annual_leave_request_cubit.dart';
import '../widgets/urgent_leave_request_form_widget.dart';
import '../widgets/urgent_leave_request_details_row_widget.dart';
import '../widgets/urgent_leave_request_submit_button_widget.dart';
import '../../../di/dependency_init.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class CreateAnnualLeaveRequestScreen extends StatefulWidget {
  const CreateAnnualLeaveRequestScreen({super.key});

  @override
  State<CreateAnnualLeaveRequestScreen> createState() =>
      _CreateAnnualLeaveRequestScreenState();
}

class _CreateAnnualLeaveRequestScreenState
    extends State<CreateAnnualLeaveRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final AnnualLeaveRequestCubit annualLeaveRequestCubit =
      getIt<AnnualLeaveRequestCubit>();
  final AnnualLeaveBalanceCubit leaveBalanceCubit =
      getIt<AnnualLeaveBalanceCubit>();
  final AnnualLeaveReminingLeaveBalanceCubit reminingLeaveBalanceCubit =
      getIt<AnnualLeaveReminingLeaveBalanceCubit>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      waterMarkImage: waterMarkImage2,
      screenTitle: context.tr("annual_leave"),
      appBarHeight: 90.h,
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
      BlocProvider<AnnualLeaveRequestCubit>(
        create: (context) => annualLeaveRequestCubit,
      ),
      BlocProvider<AnnualLeaveReminingLeaveBalanceCubit>(
        create: (context) => reminingLeaveBalanceCubit,
      ),
      BlocProvider<AnnualLeaveBalanceCubit>(
        create: (context) => leaveBalanceCubit..getAnnualLeaveBalance(),
      ),
    ],
        child: BlocConsumer<AnnualLeaveBalanceCubit, LeaveBalanceState>(
          listener: _leaveBalanceListener,
          builder: (context, leaveBalanceState) {
            if (leaveBalanceState is LeaveBalanceErrorState) {
              return Center(
      child: AppText(
        text: context.tr(leaveBalanceState.message!),
        style: AppTextStyle.medium_18,
      ),
    );
            } else if (leaveBalanceState is LeaveBalanceReadyState) {
              ViewsToolbox.dismissLoading();
              return FormContentWidget(
                formKey: _formKey,
                leaveBalanceState: leaveBalanceState,
                annualLeaveRequestCubit: annualLeaveRequestCubit,
                reminingLeaveBalanceCubit: reminingLeaveBalanceCubit,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

 
  void _leaveBalanceListener(BuildContext context, LeaveBalanceState state) {
    if (state is LeaveBalanceErrorState) {
      ViewsToolbox.dismissLoading();
    }
  }
}

 

class FormContentWidget extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final LeaveBalanceReadyState leaveBalanceState;
  final AnnualLeaveRequestCubit annualLeaveRequestCubit;
  final AnnualLeaveReminingLeaveBalanceCubit reminingLeaveBalanceCubit;

  const FormContentWidget({
    required this.formKey,
    required this.leaveBalanceState,
    required this.annualLeaveRequestCubit,
    required this.reminingLeaveBalanceCubit,
    Key? key,
  }) : super(key: key);

  @override
  State<FormContentWidget> createState() => _FormContentWidgetState();
}

class _FormContentWidgetState extends State<FormContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          44.verticalSpace,
           UrgentLeaveRequestFormWidget(
            formKey: widget.formKey,
            leaveBalanceState: widget.leaveBalanceState,
            reminingLeaveBalanceCubit: widget.reminingLeaveBalanceCubit,
          ),
          20.verticalSpace,
          UrgentLeaveRequestDetailsRowWidget(
            formKey: widget.formKey,
            leaveBalanceState: widget.leaveBalanceState,
            reminingLeaveBalanceCubit: widget.reminingLeaveBalanceCubit,
          ),
          60.verticalSpace,
          SubmitUrgentLeaveButtonWidget(
            formKey: widget.formKey,
            leaveBalanceState: widget.leaveBalanceState,
            annualLeaveRequestCubit: widget.annualLeaveRequestCubit,
          ),
        ],
      ),
    );
  }
}

