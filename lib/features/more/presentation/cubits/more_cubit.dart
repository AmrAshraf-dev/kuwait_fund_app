import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
 import '../../domain/entities/more_entity.dart';
import '../../domain/use_cases/get_more_usecase.dart';

part 'more_state.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  final GetMoreUseCase getMoreUseCase;
  MoreCubit({required this.getMoreUseCase}) : super(MoreInitialState());

  Future<void> getMore() async {
    await Future.delayed(const Duration(milliseconds: 50));
    emit(MoreLoadingState());

    final CustomResponseType<BaseEntity<List<MoreEntity>>> eitherPackagesOrFailure =
        await getMoreUseCase( );

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(MoreErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<MoreEntity>> response) {
      emit(MoreReadyState(response));
    });
  }
}
