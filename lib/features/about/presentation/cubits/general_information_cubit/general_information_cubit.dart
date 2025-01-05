import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/about/domain/entities/general_information_entity.dart';
import 'package:kf_ess_mobile_app/features/about/domain/use_cases/get_general_information_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'general_information_state.dart';

@injectable
class GeneralInformationCubit extends Cubit<GeneralInformationState> {
  final GetGeneralInformationUseCase getGeneralInformationUseCase;
  GeneralInformationCubit({required this.getGeneralInformationUseCase})
      : super(GeneralInformationInitialState()) {
    getGeneralInformation();
  }

  Future<void> getGeneralInformation() async {
    emit(GeneralInformationLoadingState());

    final CustomResponseType<BaseEntity<List<GeneralInformationEntity>>>
        eitherPackagesOrFailure = await getGeneralInformationUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(GeneralInformationErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<GeneralInformationEntity>> response) {
      emit(GeneralInformationReadyState(response));
    });
  }
}
