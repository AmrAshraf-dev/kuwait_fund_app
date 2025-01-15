import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/certificates/domain/use_cases/generate_certificates_usecase.dart';

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
      CustomMainRouter.push(CertificateDetailsRoute());
    });
  }
}
