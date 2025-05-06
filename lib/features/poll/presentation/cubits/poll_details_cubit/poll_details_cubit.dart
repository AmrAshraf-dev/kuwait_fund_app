import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/use_cases/get_poll_by_id_usecase.dart';
 import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';


part 'poll_details_state.dart';

@injectable
class PollDetailsCubit extends Cubit<PollDetailsState> {
  final GetPollByIdUseCase getPollByIdUseCase;
  PollDetailsCubit({required this.getPollByIdUseCase}) : super(PollDetailsInitialState());

  void getPollById({required int pollId}) async {
    await Future.delayed(const Duration(milliseconds: 50));
    emit(PollDetailsLoadingState());
    final CustomResponseType<BaseEntity<PollDetailsEntity>> eitherPackagesOrFailure =
        await getPollByIdUseCase(pollId);
    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(PollDetailsErrorState(message: massage.mapFailureToMessage(failure)));
    }, (BaseEntity<PollDetailsEntity> response) {
      emit(PollDetailsReadyState(response));
    });
  }



}