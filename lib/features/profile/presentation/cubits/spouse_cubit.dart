import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/get_spouse_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";

part 'spouse_state.dart';

@injectable
class SpouseCubit extends Cubit<SpouseState> {
  final GetSpouseUseCase getSpouseUseCase;
  SpouseCubit({required this.getSpouseUseCase}) : super(SpouseInitialState());

  Future<void> getSpouse({SpouseRequestModel? spouseModel}) async {
    emit(SpouseLoadingState());

    final CustomResponseType<BaseEntity<SpouseEntity>> eitherPackagesOrFailure =
        await getSpouseUseCase(spouseModel!);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SpouseErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<SpouseEntity> response) {
      emit(SpouseReadyState(response));
    });
  }
}
