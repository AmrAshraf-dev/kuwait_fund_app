import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_create_request_usecase.dart';
import '../../domain/entities/create_request_entity.dart';
import '../../data/models/request/create_request_request_model.dart';

part 'create_request_state.dart';





@injectable
class CreateRequestCubit extends Cubit<CreateRequestState> {
  final GetCreateRequestUseCase getCreateRequestUseCase;
  CreateRequestCubit({required this.getCreateRequestUseCase}) : super(CreateRequestInitialState());

  Future<void> getCreateRequest(
      {required CreateRequestRequestModel createRequestModel}) async {
    emit(CreateRequestLoadingState());

    final CustomResponseType<BaseEntity<CreateRequestEntity>> eitherPackagesOrFailure =
        await getCreateRequestUseCase(createRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(CreateRequestErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<CreateRequestEntity> response) {
      emit(CreateRequestReadyState(response));
    });
  }
}















