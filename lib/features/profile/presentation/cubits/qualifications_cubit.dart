import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/qualifications_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/get_qualifications_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";

part 'qualifications_state.dart';

@injectable
class QualificationsCubit extends Cubit<QualificationsState> {
  final GetQualificationsUseCase getQualificationsUseCase;
  QualificationsCubit({required this.getQualificationsUseCase})
      : super(QualificationsInitialState()) {
    getQualifications();
  }

  Future<void> getQualifications() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(QualificationsLoadingState());

    final CustomResponseType<BaseEntity<List<QualificationsModel>>>
        eitherPackagesOrFailure = await getQualificationsUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(QualificationsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<QualificationsModel>> response) {
      if (response.data?.isEmpty ?? true) {
        emit(QualificationsEmptyState());
        return;
      } else {
        emit(QualificationsReadyState(response));
      }
    });
  }
}
