import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helper/view_toolbox.dart';
import '../../../core/utility/palette.dart';
import 'app_text.dart';
import 'custom_elevated_button_widget.dart';
import 'custom_file_picker/custom_file_picker_cubit.dart';
import 'custom_file_picker/custom_file_picker_widget.dart';

class  FilePickerButton extends StatelessWidget {
  final FilePickerCubit filePickerCubit;
final String title;
  const  FilePickerButton({required this.filePickerCubit, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      showBorder: true,
      borderColor: Palette.gery_6C6D6F,
      backgroundColor: Palette.transparntColor,
      onPressed: () {
        ViewsToolbox.showBottomSheet(
          height: 330.h,
          context: context,
          widget: GenericFilePicker(
            filePickerCubit: filePickerCubit,
            keyName: 'file',
            buttonTitle:title,
            isFromCamera: false,
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
          Flexible(
             child: AppText(
              maxLines: 2,
              text:title  ,
              style: AppTextStyle.medium_16,
              textColor: Palette.black,
            ),
          ),
        ],
      ),
    );
  }
}