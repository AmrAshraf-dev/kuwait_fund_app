import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/src/form_builder.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

import '../../../../core/helper/view_toolbox.dart';
import '../../../../core/routes/route_sevices.dart';
import '../../../../core/routes/routes.gr.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../data/models/request/sick_leave_request_model.dart';
import '../cubits/sick_leave_request_cubit.dart';

class SubmitButton extends StatelessWidget {
   final CreateSickLeaveRequestCubit createSickLeaveRequestCubit;
 final GlobalKey<FormBuilderState> formKey;
  const SubmitButton({
    super.key,
     required this.createSickLeaveRequestCubit, required this. formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateSickLeaveRequestCubit,
        CreateSickLeaveRequestState>(
      listener: (context, state) {
        if (state is CreateSickLeaveRequestErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(
              context, context.tr(state.message!));
        }
      },
      builder: (context, state) {
        if (state is CreateSickLeaveRequestLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is CreateSickLeaveRequestReadyState) {
          ViewsToolbox.dismissLoading();
          CustomMainRouter.pop(); // Remove current page from stack

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
            subtitle: context
                .tr("your_sick_leave_request_has_been_submitted_successfully"),
          ));
        } else {
          return CustomElevatedButton(
            onPressed: () async {
           if(formKey.currentState?.saveAndValidate() == true){
                createSickLeaveRequestCubit.createSickLeaveRequest(
                  SickLeaveRequestModel(
                    bytes: await _getFileBytes(XFile(formKey.currentState?.fields["medicalReportFile"]?.value)),
                    fileExtention: _getFileExtension(formKey.currentState?.fields["medicalReportFile"]?.value),
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
