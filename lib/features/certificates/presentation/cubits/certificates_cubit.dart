import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_certificates_usecase.dart';
import '../../domain/entities/certificates_entity.dart';
import '../../data/models/request/certificates_request_model.dart';

part 'certificates_state.dart';





@injectable
class CertificatesCubit extends Cubit<CertificatesState> {
  final GetCertificatesUseCase getCertificatesUseCase;
  CertificatesCubit({required this.getCertificatesUseCase}) : super(CertificatesInitialState());

  Future<void> getCertificates(
      {required CertificatesRequestModel certificatesModel}) async {
    emit(CertificatesLoadingState());

    final CustomResponseType<BaseEntity<CertificatesEntity>> eitherPackagesOrFailure =
        await getCertificatesUseCase(certificatesModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CertificatesErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<CertificatesEntity> response) {
      emit(CertificatesReadyState(response));
    });
  }
}















