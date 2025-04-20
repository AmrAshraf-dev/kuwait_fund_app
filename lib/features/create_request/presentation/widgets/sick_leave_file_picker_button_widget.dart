import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_widget.dart';

import '../../../shared/widgets/app_text.dart';

class  FilePickerButton extends StatelessWidget {
  final FilePickerCubit filePickerCubit;

  const  FilePickerButton({required this.filePickerCubit});

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