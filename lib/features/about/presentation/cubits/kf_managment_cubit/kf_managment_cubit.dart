import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/about/domain/entities/kf_managment_entity.dart';
import 'package:kf_ess_mobile_app/features/about/domain/use_cases/get_kf_managment_usecase.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

part 'kf_managment_state.dart';

@injectable
class KFManagmentCubit extends Cubit<KFManagmentState> {
  final GetKFManagmentUseCase getKFManagmentUseCase;
  KFManagmentCubit({required this.getKFManagmentUseCase})
      : super(KFManagmentInitialState()) {
    getKFManagment();
  }

  Future<void> getKFManagment() async {
    emit(KFManagmentLoadingState());

    final CustomResponseType<BaseEntity<List<KFManagmentEntity>>>
        eitherPackagesOrFailure = await getKFManagmentUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(KFManagmentErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<KFManagmentEntity>> response) {
      emit(KFManagmentReadyState(response));
    });
  }
}
