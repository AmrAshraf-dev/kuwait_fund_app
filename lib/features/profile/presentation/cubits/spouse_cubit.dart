import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/edit_spouse_request_model.dart';
import '../../data/models/request/spouse_request_model.dart';
import '../../domain/entities/look_up_entity.dart';
import '../../domain/entities/spouse_entity.dart';
import '../../domain/use_cases/edit_spouse_usecase.dart';
import '../../domain/use_cases/get_lookup_usecase.dart';
import '../../domain/use_cases/get_spouse_usecase.dart';

part 'spouse_state.dart';

@injectable
class SpouseCubit extends Cubit<SpouseState> {
  final SpouseRequestUseCase spouseUseCase;
    final GetSpouseUseCase getSpouseUseCase;
    final GetLookupUsecase  getLookupUsecase;

  SpouseCubit({required this.spouseUseCase,
  required this.getSpouseUseCase,
  required this.getLookupUsecase
  }) : super(SpouseInitialState());



  void editSpouse(EditSpouseRequestModel editSpouseRequestModel) async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(SpouseLoadingState());

    final CustomResponseType<BaseEntity<String>> eitherPackagesOrFailure =
        await spouseUseCase(editSpouseRequestModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SpouseErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<String> response) {
      emit(EditSpouseReadyState(response));
    });
  }



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

  Future<void> getSpouseStatus() async {


   await Future.delayed(const Duration(milliseconds: 100));
    emit(SpouseLoadingState());

    final CustomResponseType<BaseEntity<List<LookUpEntity>>> eitherPackagesOrFailure =
        await getLookupUsecase("Profile/GetSpouseStatus");

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(SpouseErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<LookUpEntity>> response) {
      emit(SpouseStatusReadyState(response));
    });

  }
  

}
