import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/kf_managment_entity.dart';
import '../../../domain/use_cases/get_kf_managment_usecase.dart';
import '../../../../shared/entity/base_entity.dart';

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
