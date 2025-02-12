import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/certificates/domain/use_cases/generate_certificates_usecase.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

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
      Share.shareXFiles([XFile(file.path)], text: 'Certificate');
    } catch (e) {
      print('Error sharing PDF: $e');
    }
  }

  Future<void> downloadBase64Pdf(String certificateBase64Pdf) async {
    final List<int> pdfBytes = base64Decode(certificateBase64Pdf);
    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/temp_base64.pdf';
    final File file = File(path);
    await file.writeAsBytes(pdfBytes, flush: true);
  }
}
