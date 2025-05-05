import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/generate_certificates_usecase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:file_picker/file_picker.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/entities/certificates_entity.dart';
import '../../domain/use_cases/get_certificates_usecase.dart';

part 'certificates_state.dart';

@injectable
class CertificatesCubit extends Cubit<CertificatesState> {
  final GetCertificatesUseCase getCertificatesUseCase;

  final GenerateCertificateUserCase generateCertificateUserCase;

  CertificatesCubit(
      {required this.getCertificatesUseCase,
      required this.generateCertificateUserCase})
      : super(CertificatesInitialState()) {
    getCertificates();
  }

  Future<void> getCertificates() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(CertificatesLoadingState());

    final CustomResponseType<BaseEntity<List<CertificatesEntity>>>
        eitherPackagesOrFailure = await getCertificatesUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CertificatesErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<CertificatesEntity>> response) {
      emit(CertificatesReadyState(response));
    });
  }

  Future<void> shareBase64Pdf(String base64Pdf) async {
    try {
      final List<int> pdfBytes = base64Decode(base64Pdf);
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String path = '$dir/temp_shared.pdf';
      final File file = File(path);
      await file.writeAsBytes(pdfBytes, flush: true);
      SharePlus.instance.share(ShareParams(
        files:
        [XFile(file.path)], text: 'Certificate'
      ));
    } catch (e) {
      print('Error sharing PDF: $e');
    }
  }

  // Future<void> downloadBase64Pdf(String certificateBase64Pdf) async {
  //   try {
  //     final List<int> pdfBytes = base64Decode(certificateBase64Pdf);
  //     final String dir = (await getApplicationDocumentsDirectory()).path;
  //     final String path = '$dir/temp_base64.pdf';

  //     // Ensure the directory exists
  //     final Directory directory = Directory(dir);
  //     if (!directory.existsSync()) {
  //       await directory.create(recursive: true);
  //     }

  //     final File file = File(path);
  //     await file.writeAsBytes(pdfBytes, flush: true);
  //     print('PDF downloaded successfully to $path');
  //   } catch (e) {
  //     print('Error downloading PDF: $e');
  //   }
  // }

  Future<void> saveBase64PdfToFolder(String certificateBase64Pdf) async {
    try {
      final List<int> pdfBytes = base64Decode(certificateBase64Pdf);

      // Open file picker to select a folder
      final String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

      if (selectedDirectory != null) {
        final String path = '$selectedDirectory/certificate.pdf';
        final File file = File(path);
        await file.writeAsBytes(pdfBytes, flush: true);
        print('PDF saved successfully to $path');
      } else {
        print('No folder selected.');
      }
    } catch (e) {
      print('Error saving PDF: $e');
    }
  }
}
