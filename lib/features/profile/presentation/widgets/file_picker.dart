import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kf_ess_mobile_app/core/extensions/size_extensions.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/family_file_picker_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:path/path.dart' as path;

class FilePicker extends StatelessWidget {
  final FilePickerFamilyCubit filePickerFamilyCubit;
  final ValueChanged<String?> onFileSelected;
  const FilePicker({
    super.key,
    required this.filePickerFamilyCubit,
    required this.onFileSelected,
  });

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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<FilePickerFamilyCubit, FilePickerFamilyState>(
              listener: (context, state) {
                if (state is FilePickerFamilyReadyState) {
                  onFileSelected(
                      state.xFile.isNotEmpty ? state.xFile.first.path : null);
                } else if (state is FilePickerFamilyErrorState) {
                  onFileSelected(null);
                  ViewsToolbox.showAwesomeSnackBar(
                    context,
                    state.message,
                    isError: true,
                  );
                }
              },
              builder: (context, state) {
                if (state is FilePickerFamilyReadyState) {
                  return _SelectedFilePreview(
                      state: state.xFile,
                      filePickerFamilyCubit: filePickerFamilyCubit);
                } else if (state is FilePickerFamilyInitialState) {
                  return FilePickerFamilyButton(
                      filePickerFamilyCubit: filePickerFamilyCubit);
                } else {
                  return FilePickerFamilyButton(
                      filePickerFamilyCubit: filePickerFamilyCubit);
                }
              },
            ),
            10.verticalSpace,
            AppText(
              text: context.tr("max_file_size_1mb"),
              style: AppTextStyle.regular_12,
              textColor: Palette.black,
            ),
            10.verticalSpace,
            Row(
              children: [
                AppText(
                  text: context.tr("supported_file_types"),
                  style: AppTextStyle.regular_12,
                  textColor: Palette.black,
                ),
                5.horizontalSpace,
                AppText(
                  text: context.tr("pdf_jpg_png"),
                  style: AppTextStyle.regular_12,
                  textColor: Palette.blue_002A69,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SelectedFilePreview extends StatelessWidget {
  final List<XFile> state;
  final FilePickerFamilyCubit filePickerFamilyCubit;

  const _SelectedFilePreview({
    super.key,
    required this.state,
    required this.filePickerFamilyCubit,
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
            Expanded(
              // Prevent overflow by wrapping in Expanded
              child: Row(
                children: [
                  Icon(isPdf ? Icons.picture_as_pdf : Icons.image),
                  5.widthBox,
                  Flexible(
                    // Ensure text wraps instead of overflowing
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
              onTap: () => filePickerFamilyCubit.clear(),
              child: Icon(Icons.close,
                  color: Palette.redBackgroundTheme, size: 25.sp),
            ),
          ],
        ),
        5.verticalSpace,
        if (!isPdf)
          Image.file(
            File(file.path),
            height: 150.h,
            width: 150.w,
            fit: BoxFit.cover,
          ),
      ],
    );
  }

  String _getFileExtension(String filePath) {
    return path.extension(filePath).replaceFirst(".", "");
  }
}
