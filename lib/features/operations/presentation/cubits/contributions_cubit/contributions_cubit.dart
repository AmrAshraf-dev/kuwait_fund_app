import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/contribution_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/use_cases/contributions_usecase/get_contributions_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'contributions_state.dart';

@injectable
class ContributionsCubit extends Cubit<ContributionsState> {
  final GetContributionsUseCase getContributionsUseCase;
  ContributionsCubit({required this.getContributionsUseCase})
      : super(ContributionsInitialState()) {
    getContributions();
  }

  Future<void> getContributions() async {
    emit(ContributionsLoadingState());

    final CustomResponseType<BaseEntity<List<ContributionEntity>>>
        eitherSuccessOrFailure = await getContributionsUseCase();

    eitherSuccessOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ContributionsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<ContributionEntity>> response) {
      emit(ContributionsReadyState(response));
    });
  }
}
