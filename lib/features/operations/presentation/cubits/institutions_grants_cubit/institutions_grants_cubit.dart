import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/error/failure.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/institution_grants_entity.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/institutions_grants_cubit/institutions_grants_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';

import '../../../domain/use_cases/institutions_grants_usecase/get_institutions_grants_usecase.dart';

part 'institutions_grants_state.dart';

@injectable
class InstitutionsGrantsCubit extends Cubit<InstitutionsGrantsState> {
  final GetInstitutionsGrantsUseCase getInstitutionsGrantsUseCase;
  InstitutionsGrantsCubit({required this.getInstitutionsGrantsUseCase})
      : super(InstitutionsGrantsInitialState()) {
    getInstitutionsGrants();
  }

  Future<void> getInstitutionsGrants() async {
    emit(InstitutionsGrantsLoadingState());

    final CustomResponseType<BaseEntity<List<InstitutionGrantsEntity>>>
        eitherSuccessOrFailure = await getInstitutionsGrantsUseCase();

    eitherSuccessOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(InstitutionsGrantsErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<List<InstitutionGrantsEntity>> response) {
      emit(InstitutionsGrantsReadyState(response));
    });
  }
}
