import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/extensions/size_extensions.dart';
import '../../../../core/routes/route_sevices.dart';
import '../../../../core/utility/palette.dart';
import '../app_text.dart';
import '../custom_elevated_button_widget.dart';
import 'custom_file_picker_cubit.dart';
 
class GenericFilePicker extends StatelessWidget {
  const GenericFilePicker({
    super.key,
    required this.filePickerCubit,
    this.isFromCamera = false,
    this.isFromGallery = false,
    this.isFromFile = false,
    this.buttonTitle,
    this.keyName = 'file',
  });
  final FilePickerCubit filePickerCubit;
  final bool isFromCamera;
  final bool isFromGallery;
  final bool isFromFile;
  final String keyName;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilePickerCubit, FilePickerState>(
      bloc: filePickerCubit,
      builder: (BuildContext context, FilePickerState state) {
        return FormBuilderField<String>(
          name: keyName,
          initialValue: state is FilePickerReadyState
              ? state.xFile.isNotEmpty
                  ? state.xFile.first.path
                  : ''
              : null,
          builder: (FormFieldState<String> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (isFromCamera)
                  CustomElevatedButton(
                    backgroundColor: Palette.primaryColor,
                    onPressed: () {
                      filePickerCubit.pickCamera();
                      CustomMainRouter.pop();
                    },
                    text: context.tr('takePhoto'),
                  ),
                20.heightBox,
                if (isFromGallery)
                  CustomElevatedButton(
                    backgroundColor: Palette.primaryColor,
                    onPressed: () {
                      filePickerCubit.pickFile(
                         filetype: FileType.image,
                       // allowedExtensions: ['jpg', 'png', 'jpeg'],
                      );
                      CustomMainRouter.pop();
                    },
                    customChild: 
                      AppText(
                        maxLines: 2,
                       text: context.tr('choosePhoto'),
                        style: AppTextStyle.semiBold_18,
                       ),
                   
                  ),
                20.heightBox,
                if (isFromFile)
                  CustomElevatedButton(
                    showBorder: true,
                     backgroundColor: Palette.primaryColor,
                    onPressed: () {
                      filePickerCubit.pickFile(
                        filetype: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );
                      CustomMainRouter.pop();
                    },
                    
                    customChild: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_file_outlined,
                          color: Palette.white,
                        ),
                        5.horizontalSpace,

                        Flexible(
                          child: AppText(
                            maxLines: 2,
                            text:  context.tr("attach_file"),
                            style: AppTextStyle.semiBold_18,
                           ),
                        )
                      ],
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
