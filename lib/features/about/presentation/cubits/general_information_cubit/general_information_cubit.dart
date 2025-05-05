import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/general_information_entity.dart';
import '../../../domain/use_cases/get_general_information_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

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
