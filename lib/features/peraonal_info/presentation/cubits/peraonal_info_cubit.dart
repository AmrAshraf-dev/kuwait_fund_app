import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_peraonal_info_usecase.dart';
import '../../domain/entities/peraonal_info_entity.dart';
import '../../data/models/request/peraonal_info_request_model.dart';

part 'peraonal_info_state.dart';





@injectable
class PeraonalInfoCubit extends Cubit<PeraonalInfoState> {
  final GetPeraonalInfoUseCase getPeraonalInfoUseCase;
  PeraonalInfoCubit({required this.getPeraonalInfoUseCase}) : super(PeraonalInfoInitialState());

  Future<void> getPeraonalInfo(
      {required PeraonalInfoRequestModel peraonalInfoModel}) async {
    emit(PeraonalInfoLoadingState());

    final CustomResponseType<BaseEntity<PeraonalInfoEntity>> eitherPackagesOrFailure =
        await getPeraonalInfoUseCase(peraonalInfoModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(PeraonalInfoErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<PeraonalInfoEntity> response) {
      emit(PeraonalInfoReadyState(response));
    });
  }
}















