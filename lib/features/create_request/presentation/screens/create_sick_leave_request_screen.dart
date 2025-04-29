import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_file_picker_section_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/create_request/presentation/cubits/sick_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_submit_button_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import '../cubits/leave_balance_cubit.dart';

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

  String? _selectedFile;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              FilePickerSection(
                  title: context.tr("attach_medical_report_file"),
                  filePickerCubit: filePickerCubit,
                  onFileSelected: (filePath) => setState(() {
                        _selectedFile = filePath;
                      })),
              40.verticalSpace,
              LeaveBalanceSection(
                  //leaveBalanceCubit: leaveBalanceCubit
                  ),
              120.verticalSpace,
              SubmitButton(
                selectedFile: _selectedFile,
                createSickLeaveRequestCubit: createSickLeaveRequestCubit,
              ),
            ],
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
