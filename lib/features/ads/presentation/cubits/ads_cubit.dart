import 'package:bloc/bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/ads/domain/entities/ads_entity.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_ads_usecase.dart';

part 'ads_state.dart';

@injectable
class AdsCubit extends Cubit<PagingState<int, AdsEntity>> {
  final GetAdsUseCase getAdsUseCase;
  int totalRecords = 0; // Track total records
int pageSize = 10; // Set the page size
  AdsCubit({required this.getAdsUseCase}) : super(PagingState());

  Future<void> fetchNextAdsPage() async {
    final currentState = state;

    emit(currentState.copyWith(isLoading: true, error: null));

    try {
      final pageNumber = (currentState.keys?.last ?? 0) + 1;
      final newItems = await getAds(pageNumber);
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

  Future<List<AdsEntity>> getAds(int newKey) async {
    final CustomResponseType<BaseEntity<List<AdsEntity>>> eitherPackagesOrFailure =
        await getAdsUseCase(newKey);

    return eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      final String errorMessage = massage.mapFailureToMessage(failure);
      return [];
    }, (BaseEntity<List<AdsEntity>> response) {
      if (response.data != null) {
        return response.data!;
      } else {
        return [];
      }
    });
  }


}
