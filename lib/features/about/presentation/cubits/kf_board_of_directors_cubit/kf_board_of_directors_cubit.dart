import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/kf_board_of_directors_entity.dart';
import '../../../domain/use_cases/get_kf_board_of_directors_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

part 'kf_board_of_directors_state.dart';

@injectable
class KFBoardOfDirectorsCubit extends Cubit<KFBoardOfDirectorsState> {
  final GetKFBoardOfDirectorsUseCase getKFBoardOfDirectorsUseCase;
  KFBoardOfDirectorsCubit({required this.getKFBoardOfDirectorsUseCase})
      : super(KFBoardOfDirectorsInitialState()) {
    getKFBoardOfDirectors();
  }

  Future<void> getKFBoardOfDirectors() async {
    emit(KFBoardOfDirectorsLoadingState());

    final CustomResponseType<BaseEntity<List<KFBoardOfDirectorsEntity>>>
        eitherPackagesOrFailure = await getKFBoardOfDirectorsUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(KFBoardOfDirectorsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<KFBoardOfDirectorsEntity>> response) {
      emit(KFBoardOfDirectorsReadyState(response));
    });
  }
}
