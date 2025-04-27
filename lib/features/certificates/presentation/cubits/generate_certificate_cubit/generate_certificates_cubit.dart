import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/certificates/domain/use_cases/generate_certificates_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'generate_certificates_state.dart';

@injectable
class GenerateCertificatesCubit extends Cubit<GenerateCertificatesState> {
  final GenerateCertificateUserCase generateCertificateUserCase;

  GenerateCertificatesCubit({required this.generateCertificateUserCase})
      : super(GenerateCertificatesInitialState());

  void generateCertificate(String statmentType) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(GenerateCertificatesLoadingState());
    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await generateCertificateUserCase(statmentType);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(GenerateCertificatesErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      if(response.data == null) {
        emit(GenerateCertificatesErrorState(
          message: "noDataFound",
        ));
        return;
      }
      emit(GenerateCertificatesReadyState(response));
    });
  }
}
