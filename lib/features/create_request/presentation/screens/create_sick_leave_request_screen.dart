import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/images.dart';
import '../../../../core/utility/palette.dart';
import '../../../di/dependency_init.dart';
import '../../../shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import '../../../shared/widgets/leave_row_details_widget.dart';
import '../../../shared/widgets/master_widget.dart';
import '../cubits/sick_leave_request_cubit.dart';
import '../../../shared/widgets/file_picker_section_widget.dart';
import '../widgets/sick_leave_submit_button_widget.dart';

@RoutePage()
class CreateSickLeaveRequestScreen extends StatefulWidget {
  const CreateSickLeaveRequestScreen({super.key});

  @override
  State<CreateSickLeaveRequestScreen> createState() =>
      _CreateSickLeaveRequestScreenState();
}

class _CreateSickLeaveRequestScreenState
    extends State<CreateSickLeaveRequestScreen> {
  final CreateSickLeaveRequestCubit createSickLeaveRequestCubit =
      getIt<CreateSickLeaveRequestCubit>();
  final FilePickerCubit filePickerCubit = getIt<FilePickerCubit>();
  // final LeaveBalanceCubit leaveBalanceCubit = getIt<LeaveBalanceCubit>();
 final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
 
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      waterMarkImage: waterMarkImage2,
      screenTitle: context.tr("sick_leave"),
      appBarHeight: 90.h,
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => createSickLeaveRequestCubit),
          //     BlocProvider(create: (context) => leaveBalanceCubit),
          BlocProvider(create: (context) => filePickerCubit),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          child: FormBuilder(
            key:  _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.verticalSpace,
                FilePickerSection(
                   keyName:  "medicalReportFile",
                    customFormKey: _formKey,
                    title: context.tr("attach_medical_report_file"),
                    filePickerCubit: filePickerCubit,
                   ),
                40.verticalSpace,
                LeaveBalanceSection(
                    //leaveBalanceCubit: leaveBalanceCubit
                    ),
                120.verticalSpace,
                SubmitButton(
                  formKey: _formKey,
                   createSickLeaveRequestCubit: createSickLeaveRequestCubit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeaveBalanceSection extends StatelessWidget {
  const LeaveBalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return _LeaveBalanceDetails(days: "0");
  }
}

class _LeaveBalanceDetails extends StatelessWidget {
  final String days;

  const _LeaveBalanceDetails({required this.days});

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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Palette.white_F7F7F7,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            5.verticalSpace,
            LeaveDaysRowItemWidget(
              title: context.tr("available_days"),
              days: days,
            ),
          ],
        ),
      ),
    );
  }
}
