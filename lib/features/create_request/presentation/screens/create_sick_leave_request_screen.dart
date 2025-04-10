import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/create_request/data/models/request/sick_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/create_request/presentation/cubits/sick_leave_request_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/leave_row_details_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:open_file/open_file.dart';

@RoutePage()
class CreateSickLeaveRequestScreen extends StatefulWidget {
  const CreateSickLeaveRequestScreen({super.key});

  @override
  State<CreateSickLeaveRequestScreen> createState() =>
      _CreateSickLeaveRequestScreenState();
}

class _CreateSickLeaveRequestScreenState
    extends State<CreateSickLeaveRequestScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final CreateSickLeaveRequestCubit createSickLeaveRequestCubit =
      getIt<CreateSickLeaveRequestCubit>();

  File? _pdfFile;
  Uint8List? _imageBytes;
  String? _error;
  String? fileString;
  String? fileType;

  static const maxSizeInBytes = 1048576; // 1MB

  Future<void> _pickFile() async {
    setState(() {
      _error = null;
    });

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      final picked = result.files.first;
      final size = picked.size;
      final extension = picked.extension?.toLowerCase();

      if (size > maxSizeInBytes) {
        setState(() {
          _error = '❌ File is too large. Maximum size is 1MB.';
        });
        return;
      }

      // if (_pdfFile == null && _imageBytes == null) {
      //   setState(() {
      //     _error = '❌ Please upload a file before submitting.';
      //   });
      //   return;
      // }

      if (extension == 'pdf') {
        setState(() {
          _pdfFile = File(picked.path!);
          _imageBytes = null;
        });
      } else if (['jpg', 'jpeg', 'png'].contains(extension)) {
        setState(() {
          _imageBytes = picked.bytes!;
          _pdfFile = null;
        });
      } else {
        setState(() {
          _error = '❌ Unsupported file type.';
        });
      }
    }

    if (_imageBytes != null) {
      fileType = 'image';
      fileString = base64Encode(_imageBytes!);
    } else if (_pdfFile != null) {
      final bytes = _pdfFile!.readAsBytesSync();
      fileType = 'pdf';
      fileString = base64Encode(bytes);
    }

    debugPrint('✅ Submitting $fileType as base64 string to API...');
    debugPrint(fileString!.substring(0, 100) + '...'); // Preview only
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage2,
        screenTitle: context.tr("sick_leave"),
        appBarHeight: 90.h,
        isBackEnabled: true,
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => createSickLeaveRequestCubit,
            ),
          ],
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    44.verticalSpace,

                    Center(
                      child: Container(
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
                        child:
                            // FormBuilder(
                            //   key: _formKey,
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(vertical: 20.h),
                            //     child: CustomDatePickerRange(
                            //       onDoneCallback: (bool isSelectedRangeValid) {},
                            //       labelTitle: context.tr("sick_leave_days"),
                            //       consumedDays: 4,
                            //       totalDays: 4,
                            //       keyNameFrom: "from",
                            //       keyNameTo: "to",
                            //       customFormKey: _formKey,
                            //       fromLabelAboveField: context.tr("from"),
                            //       toLabelAboveField: context.tr("to"),
                            //     ),
                            //   ),
                            // ),
                            Column(
                          children: [
                            ElevatedButton.icon(
                              onPressed: _pickFile,
                              icon: const Icon(Icons.upload),
                              label: AppText(
                                text: context.tr('UploadPDForImage'),
                                textColor: Palette.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            if (_error != null)
                              AppText(
                                text: _error, //context.tr('error'),
                                textColor: Palette.redBackgroundTheme,
                              ),
                            if (_imageBytes != null)
                              Column(
                                children: [
                                  AppText(
                                    text: context.tr('UploadedImage'),
                                  ),
                                  const SizedBox(height: 8),
                                  Image.memory(_imageBytes!, height: 200),
                                ],
                              ),
                            if (_pdfFile != null)
                              Column(
                                children: [
                                  //
                                  AppText(
                                    text: context.tr('UploadedPDF'),
                                    //    textColor: Palette.white,
                                  ),
                                  const SizedBox(height: 8),
                                  InkWell(
                                    onTap: () {
                                      OpenFile.open(_pdfFile!.path);
                                    },
                                    child: Text(
                                      _pdfFile!.path.split('/').last,
                                      style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    //date selector from and two
                    20.verticalSpace,
                    Container(
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
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                            color: Palette.white_F7F7F7,
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.verticalSpace,
                                LeaveDaysRowItemWidget(
                                  title: context.tr("paid_days"),
                                  days: "4",
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                LeaveDaysRowItemWidget(
                                  title: context
                                      .tr("remaining_days_after_vacation"),
                                  days: "4",
                                ),
                                5.verticalSpace,
                              ]),
                        )),
                    120.verticalSpace,
                    BlocConsumer<CreateSickLeaveRequestCubit,
                            CreateSickLeaveRequestState>(
                        listener: (context, state) {
                      if (state is CreateSickLeaveRequestErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      }
                    }, builder: (context, state) {
                      if (state is CreateSickLeaveRequestLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is CreateSickLeaveRequestReadyState) {
                        ViewsToolbox.dismissLoading();
                        CustomMainRouter.push(ThankYouRoute(
                          title: context.tr("request_submitted_successfully"),
                          subtitle: context.tr(
                              "your_sick_leave_request_has_been_submitted_successfully"),
                        ));
                      } else {
                        return CustomElevatedButton(
                            onPressed: () {
                              //   if (_formKey.currentState!.saveAndValidate()) {
                              createSickLeaveRequestCubit
                                  .createSickLeaveRequest(SickLeaveRequestModel(
                                bytes:
                                    fileString ?? '', //_imageBytes.toString(),
                                fileExtention: _pdfFile.toString(),
                              ));
                              //}
                            },
                            text: context.tr("submit"));
                      }

                      return Container();
                    })
                  ])),
        ));
  }
}
