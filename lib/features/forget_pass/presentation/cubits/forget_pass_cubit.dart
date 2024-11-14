import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_forget_pass_usecase.dart';
import '../../domain/entities/forget_pass_entity.dart';
import '../../data/models/request/forget_pass_request_model.dart';

part 'forget_pass_state.dart';





@injectable
class ForgetPassCubit extends Cubit<ForgetPassState> {
  final GetForgetPassUseCase getForgetPassUseCase;
  ForgetPassCubit({required this.getForgetPassUseCase}) : super(ForgetPassInitialState());

  Future<void> getForgetPass(
      {required ForgetPassRequestModel forgetPassModel}) async {
    emit(ForgetPassLoadingState());

    final CustomResponseType<BaseEntity<ForgetPassEntity>> eitherPackagesOrFailure =
        await getForgetPassUseCase(forgetPassModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ForgetPassErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<ForgetPassEntity> response) {
      emit(ForgetPassReadyState(response));
    });
  }
}















