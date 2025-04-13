import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/extensions/size_extensions.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/create_request/data/models/request/sick_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/create_request/presentation/cubits/sick_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:path/path.dart' as path;
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
  final LeaveBalanceCubit leaveBalanceCubit = getIt<LeaveBalanceCubit>();
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
          BlocProvider(create: (context) => leaveBalanceCubit),
          BlocProvider(create: (context) => filePickerCubit),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              44.verticalSpace,
              FilePickerSection(
                filePickerCubit: filePickerCubit,
                onFileSelected: (filePath) => _selectedFile = filePath,
              ),
              20.verticalSpace,
              LeaveBalanceSection(leaveBalanceCubit: leaveBalanceCubit),
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

class FilePickerSection extends StatelessWidget {
  final FilePickerCubit filePickerCubit;
  final ValueChanged<String?> onFileSelected;

  const FilePickerSection({
    super.key,
    required this.filePickerCubit,
    required this.onFileSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: _boxDecoration(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: BlocConsumer<FilePickerCubit, List<XFile>>(
                listener: (context, state) {
                  onFileSelected(state.isNotEmpty ? state.first.path : null);
                },
                builder: (context, state) {
                  if (state.isEmpty) {
                    return _FilePickerButton(filePickerCubit: filePickerCubit);
                  } else {
                    return _SelectedFilePreview(state: state, filePickerCubit: filePickerCubit);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
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

class _FilePickerButton extends StatelessWidget {
  final FilePickerCubit filePickerCubit;

  const _FilePickerButton({required this.filePickerCubit});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      showBorder: true,
      borderColor: Palette.gery_6C6D6F,
      backgroundColor: Palette.transparntColor,
      onPressed: () {
        ViewsToolbox.showBottomSheet(
          height: 400.h,
          context: context,
          widget: GenericFilePicker(
            filePickerCubit: filePickerCubit,
            keyName: 'file',
            buttonTitle: context.tr("attach_medical_report_file"),
            isFromCamera: true,
            isFromGallery: true,
            isFromFile: true,
          ),
        );
      },
      customChild: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.attach_file_outlined, color: Palette.blue_002A69),
          5.horizontalSpace,
          AppText(
            text: context.tr("attach_medical_report_file"),
            style: AppTextStyle.medium_16,
            textColor: Palette.black,
          ),
        ],
      ),
    );
  }
}

class _SelectedFilePreview extends StatelessWidget {
  final List<XFile> state;
  final FilePickerCubit filePickerCubit;

  const _SelectedFilePreview({
    super.key,
    required this.state,
    required this.filePickerCubit,
  });

  @override
  Widget build(BuildContext context) {
    final file = state.first;
    final isPdf = _getFileExtension(file.path) == 'pdf';

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded( // Prevent overflow by wrapping in Expanded
              child: Row(
                children: [
                  Icon(isPdf ? Icons.picture_as_pdf : Icons.image),
                  5.widthBox,
                  Flexible( // Ensure text wraps instead of overflowing
                    child: AppText(
                      text: file.name,
                      textColor: Palette.blue_002A69,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () => filePickerCubit.clear(),
              child: Icon(Icons.close, color: Palette.redBackgroundTheme, size: 25.sp),
            ),
          ],
        ),
        5.verticalSpace,
        if (!isPdf)
          Image.file(File(file.path), height: 150.h, width: 150.w, fit:  BoxFit.cover,),
      ],
    );
  }

  String _getFileExtension(String filePath) {
    return path.extension(filePath).replaceFirst(".", "");
  }
}

class LeaveBalanceSection extends StatelessWidget {
  final LeaveBalanceCubit leaveBalanceCubit;

  const LeaveBalanceSection({super.key, required this.leaveBalanceCubit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LeaveBalanceCubit, LeaveBalanceState>(
      listener: (context, state) {
        if (state is LeaveBalanceErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is LeaveBalanceLoading) {
          ViewsToolbox.showLoading();
        } else if (state is LeaveBalanceReadyState) {
          ViewsToolbox.dismissLoading();
          return _LeaveBalanceDetails(days: state.leaveBalance.data ?? '');
        }
        return Container();
      },
    );
  }
}

class _LeaveBalanceDetails extends StatelessWidget {
  final String days;

  const _LeaveBalanceDetails({required this.days});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration(),
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
              title: context.tr("remaining_days_after_vacation"),
              days: days,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Divider(thickness: 1),
            ),
          ],
        ),
      ),
    );
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

class SubmitButton extends StatelessWidget {
  final String? selectedFile;
  final CreateSickLeaveRequestCubit createSickLeaveRequestCubit;

  const SubmitButton({
    super.key,
    required this.selectedFile,
    required this.createSickLeaveRequestCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateSickLeaveRequestCubit, CreateSickLeaveRequestState>(
      listener: (context, state) {
        if (state is CreateSickLeaveRequestErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
        }
      },
      builder: (context, state) {
        if (state is CreateSickLeaveRequestLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is CreateSickLeaveRequestReadyState) {
          ViewsToolbox.dismissLoading();
          CustomMainRouter.push(ThankYouRoute(
            title: context.tr("request_submitted_successfully"),
            subtitle: context.tr("your_sick_leave_request_has_been_submitted_successfully"),
          ));
        } else {
          return CustomElevatedButton(
            onPressed: () async {
              if (selectedFile == null) {
                ViewsToolbox.showMessageBottomsheet(
                  context: context,
                  status: ConfirmationPopupStatus.failure,
                  message: context.tr("please_attach_medical_report_file"),
                );
              } else {
                createSickLeaveRequestCubit.createSickLeaveRequest(
                  SickLeaveRequestModel(
                    bytes: await _getFileBytes(XFile(selectedFile!)),
                    fileExtention: _getFileExtension(selectedFile!),
                  ),
                );
              }
            },
            text: context.tr("submit"),
          );
        }
        return Container();
      },
    );
  }

  String _getFileExtension(String filePath) {
    return path.extension(filePath).replaceFirst(".", "");
  }

  Future<String> _getFileBytes(XFile value) async {
    final bytes = await value.readAsBytes();
    return base64Encode(bytes);
  }
}
