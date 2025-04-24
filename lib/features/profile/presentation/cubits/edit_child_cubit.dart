import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/edit_child_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'edit_child_state.dart';

@injectable
class EditChildCubit extends Cubit<EditChildState> {
  final EditChildRequestUseCase editChildUseCase;
  EditChildCubit({required this.editChildUseCase})
      : super(EditChildInitialState());

  void editChild(EditChildRequestModel editChildRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(EditChildLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await editChildUseCase(editChildRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(EditChildErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(EditChildReadyState(response));
    });
  }
}
