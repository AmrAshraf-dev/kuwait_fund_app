import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/about/domain/entities/kf_board_of_directors_entity.dart';
import 'package:kf_ess_mobile_app/features/about/domain/use_cases/get_kf_board_of_directors_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

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
