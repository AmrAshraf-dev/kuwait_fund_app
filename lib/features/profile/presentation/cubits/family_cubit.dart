import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/family_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/get_family_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";

part 'family_state.dart';

@injectable
class FamilyCubit extends Cubit<FamilyState> {
  final GetFamilyUseCase getFamilyUseCase;
  FamilyCubit({required this.getFamilyUseCase}) : super(FamilyInitialState()) {
    getFamily();
  }

  Future<void> getFamily() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(FamilyLoadingState());

    final CustomResponseType<BaseEntity<List<FamilyModel>>>
        eitherPackagesOrFailure = await getFamilyUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(FamilyErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<FamilyModel>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(FamilyEmptyState());
        return;
      } else {
        emit(FamilyReadyState(response));
      }
    });
  }
}
