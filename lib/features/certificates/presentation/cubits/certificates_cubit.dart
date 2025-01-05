import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/entities/certificates_entity.dart';
import '../../domain/use_cases/get_certificates_usecase.dart';

part 'certificates_state.dart';

@injectable
class CertificatesCubit extends Cubit<CertificatesState> {
  final GetCertificatesUseCase getCertificatesUseCase;
  CertificatesCubit({required this.getCertificatesUseCase})
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
}
