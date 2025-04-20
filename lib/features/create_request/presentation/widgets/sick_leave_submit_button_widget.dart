import 'dart:convert';
import 'package:path/path.dart' as path;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/create_request/data/models/request/sick_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../cubits/sick_leave_request_cubit.dart';

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
    return BlocConsumer<CreateSickLeaveRequestCubit,
        CreateSickLeaveRequestState>(
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
            subtitle: context
                .tr("your_sick_leave_request_has_been_submitted_successfully"),
          ));
        } else {
          return CustomElevatedButton(
            onPressed: () async {
              if (selectedFile == null) {
                ViewsToolbox.showMessageBottomsheet(
                  context: context,
                  status: ConfirmationPopupStatus.failure,
                  message: context.tr("please_attach_medical_report_file"),
                  closeOnlyPopup: true,
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
