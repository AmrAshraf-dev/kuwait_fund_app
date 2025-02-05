import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
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

  void generateCertificate(String statmentType) async {
    emit(CertificatesLoadingState());
    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await generateCertificateUserCase(statmentType);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CertificatesErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      if (response.data == null) {
        emit(CertificatesErrorState(
          message: "can't_generate_certificate",
        ));
        return;
      }
      ViewsToolbox.dismissLoading();
      CustomMainRouter.push(
          CertificateDetailsRoute(certificatePdf: response.data!));
    });
  }

  Future<void> sharePdf(String certificatePdf) async {
    try {
      final response = await get(Uri.parse(certificatePdf));
      final documentDirectory = (await getApplicationDocumentsDirectory()).path;
      final file = File('$documentDirectory/certificate.pdf');
      file.writeAsBytesSync(response.bodyBytes);

      await Share.shareXFiles([XFile(file.path)], text: 'Certificate');
    } catch (e) {
      print('Error sharing image: $e');
    }
  }

  Future<void> downloadPdf(String certificatePdf) async {
    try {
      await get(Uri.parse(certificatePdf)).then((response) async {
        final documentDirectory =
            (await getApplicationDocumentsDirectory()).path;
        final file = File(
            '$documentDirectory/certificate${DateTime.now().millisecondsSinceEpoch}.pdf');
        file.writeAsBytesSync(response.bodyBytes);
      });
    } catch (e) {
      print('Error downloading image: $e');
    }
  }
}
