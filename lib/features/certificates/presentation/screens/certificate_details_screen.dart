import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/certificates/presentation/cubits/certificates_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/pdf_bottomsheet_widget/pdf_cubit.dart';

@RoutePage()
class CertificateDetailsScreen extends StatelessWidget {
  final String certificatePdf;
  final CertificatesCubit certificatesCubit = getIt<CertificatesCubit>();
  CertificateDetailsScreen({
    super.key,
    required this.certificatePdf,
  });

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("certificates"),
        isBackEnabled: true,
        widget: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [
              22.verticalSpace,
              SizedBox(
                height: 500.h,
                width: 1.sw,
                child: PdfViewWidget(pdfPath: certificatePdf),
              ),
              17.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      width: 130.w,
                      height: 50.h,
                      backgroundColor: Palette.yellow_FBD823,
                      onPressed: () async {
                       await certificatesCubit.saveBase64PdfToFolder(certificatePdf);
                   
                        ViewsToolbox.showSuccessAwesomeSnackBar(
                            context, context.tr("downloaded"));
                      },
                      customChild: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download,
                              color: Palette.white, size: 25.sp),
                          5.horizontalSpace,
                          AppText(
                            fontSize: 14.sp,
                            textColor:  Palette.white,
                            text: context.tr("download"),
                          )
                        ],
                      )),
                  10.horizontalSpace,
                  CustomElevatedButton(
                      width: 130.w,
                      height: 50.h,
                      backgroundColor: Palette.primaryColor,
                      onPressed: () {
                        certificatesCubit.shareBase64Pdf(certificatePdf);
                      },
                      customChild: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.share_outlined,
                              color: Palette.white, size: 25.sp),
                          5.horizontalSpace,
                          AppText(
                            text: context.tr("share"),
                            textColor: Palette.white,
                            fontSize: 14.sp,
                          )
                        ],
                      ))
                ],
              ),
              22.verticalSpace,

              // cancel button
              // CustomElevatedButton(
              //     width: 200.w,
              //     height: 50.h,
              //     backgroundColor: Palette.transparntColor,
              //     onPressed: () {
              //      d
              //     },
              //     customChild: AppText(
              //       text: context.tr("cancel"),
              //       textColor: Palette.blue_5490EB,
              //       fontSize: 18.sp,
              //     )),

              40.verticalSpace
            ],
          ),
        ));
  }
}

class PdfViewWidget extends StatelessWidget {
  final String pdfPath;
  const PdfViewWidget({
    super.key,
    required this.pdfPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PDFCubit()..loadPDF(pdfPath: pdfPath),
      child: BlocBuilder<PDFCubit, PDFState>(
        builder: (BuildContext context, PDFState state) {
          if (state is PDFLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PDFLoaded) {
            return PDFView(
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{},
              filePath: state.filePath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: true,
            );
          } else if (state is PDFError) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('No PDF loaded'));
          }
        },
      ),
    );
  }
}
