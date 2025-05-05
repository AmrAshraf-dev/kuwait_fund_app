import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/child_entity.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/child_request_model.dart';
import '../../data/models/request/edit_child_request_model.dart';
import '../../data/models/response/child_response_model.dart';
import '../../domain/entities/look_up_entity.dart';
import '../../domain/use_cases/edit_child_usecase.dart';
import '../../domain/use_cases/get_child_usecase.dart';
import '../../domain/use_cases/get_lookup_usecase.dart';

part 'child_state.dart';

@injectable
class ChildCubit extends Cubit<ChildState> {
  final GetChildUseCase getChildUseCase;
  final EditChildRequestUseCase editChildUseCase;
  final GetLookupUsecase getLookupUsecase;
  ChildCubit({required this.getChildUseCase , required this.editChildUseCase, required this.getLookupUsecase}) : super(ChildInitialState());

  Future<void> getChild({ChildRequestModel? childModel}) async {
    emit(ChildLoadingState());

    final CustomResponseType<BaseEntity<ChildEntity>> eitherPackagesOrFailure =
        await getChildUseCase(childModel!);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ChildErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<ChildEntity> response) {
      emit(ChildReadyState(response));
    });
  }


    void editChild(EditChildRequestModel editChildRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ChildLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await editChildUseCase(editChildRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ChildErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(EditChildReadyState(response));
    });
  }

  getChildDisabilityTypes() async  {
    

    await Future.delayed(const Duration(milliseconds: 100));
    emit(ChildLoadingState());

    final CustomResponseType<BaseEntity<List<LookUpEntity>>> eitherPackagesOrFailure =
        await getLookupUsecase("Profile/GetChildDisabilityTypes");

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(ChildErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<LookUpEntity>> response) {
      emit(ChildDisabilityTypesReadyState(response));
    });

  }

}
