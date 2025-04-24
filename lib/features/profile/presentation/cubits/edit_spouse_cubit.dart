import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/edit_spouse_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'edit_spouse_state.dart';

@injectable
class EditSpouseCubit extends Cubit<EditSpouseState> {
  final EditSpouseRequestUseCase editSpouseUseCase;
  EditSpouseCubit({required this.editSpouseUseCase})
      : super(EditSpouseInitialState());

  void editSpouse(EditSpouseRequestModel editSpouseRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(EditSpouseLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await editSpouseUseCase(editSpouseRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EditSpouseErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(EditSpouseReadyState(response));
    });
  }
}
