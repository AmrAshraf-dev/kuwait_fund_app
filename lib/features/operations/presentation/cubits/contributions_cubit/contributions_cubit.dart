import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/contribution_entity.dart';
import '../../../domain/use_cases/contributions_usecase/get_contributions_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

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
