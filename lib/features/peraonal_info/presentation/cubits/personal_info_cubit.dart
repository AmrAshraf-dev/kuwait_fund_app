import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_personal_info_usecase.dart';
import '../../domain/entities/personal_info_entity.dart';

part 'personal_info_state.dart';

@injectable
class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  final GetPersonalInfoUseCase getPersonalInfoUseCase;
  PersonalInfoCubit({required this.getPersonalInfoUseCase})
      : super(PersonalInfoInitialState());

  Future<void> getPersonalInfo() async {
    emit(PersonalInfoLoadingState());

    final CustomResponseType<BaseEntity<PersonalInfoEntity>>
        eitherPackagesOrFailure = await getPersonalInfoUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(PersonalInfoErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<PersonalInfoEntity> response) {
      emit(PersonalInfoReadyState(response));
    });
  }
}
