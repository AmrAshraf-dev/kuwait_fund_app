import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/request/poll_request_model.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_answers_entity.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart';
 import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_entity.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/use_cases/get_poll_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";

part 'poll_state.dart';

@injectable
class PollCubit extends Cubit<PagingState<int, PollEntity>> {
  final GetPollUseCase getPollUseCase;
   int totalRecords = 0; // Track total records
  int pageSize = 10; // Set the page size
  PollCubit({required this.getPollUseCase}) : super(PagingState());

  Future<void> fetchNextPollsPage() async {
    final currentState = state;

    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      final pageNumber = (currentState.keys?.last ?? 0) + 1;
      final newItems = await getPolls(PollRequestModel(pageNumber: pageNumber, pageSize: pageSize));
      final isLastPage = newItems.isEmpty;

      emit(state.copyWith(
        pages: [...?currentState.pages, newItems],
        keys: [...?currentState.keys, pageNumber],
        hasNextPage: !isLastPage,
        isLoading: false,
      ));
    } catch (error) {
      emit(state.copyWith(
        error: error,
        isLoading: false,
      ));
    }
  }

  Future<List<PollEntity>> getPolls(PollRequestModel pollRequestModel) async {
    final CustomResponseType<BaseEntity<List<PollEntity>>> eitherPackagesOrFailure =
        await getPollUseCase(pollRequestModel);

    return eitherPackagesOrFailure.fold((Failure failure) {
        return [];
    }, (BaseEntity<List<PollEntity>> response) {
      if (response.data != null) {
        return response.data!;
      } else {
        return [];
      }
    });
  }



}
