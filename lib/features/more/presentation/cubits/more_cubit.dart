import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_more_usecase.dart';
import '../../domain/entities/more_entity.dart';
import '../../data/models/request/more_request_model.dart';

part 'more_state.dart';





@injectable
class MoreCubit extends Cubit<MoreState> {
  final GetMoreUseCase getMoreUseCase;
  MoreCubit({required this.getMoreUseCase}) : super(MoreInitialState());

  Future<void> getMore(
      {required MoreRequestModel moreModel}) async {
    emit(MoreLoadingState());

    final CustomResponseType<BaseEntity<MoreEntity>> eitherPackagesOrFailure =
        await getMoreUseCase(moreModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(MoreErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<MoreEntity> response) {
      emit(MoreReadyState(response));
    });
  }
}















