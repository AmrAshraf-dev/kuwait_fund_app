import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../error/failure.dart';
import '../../../domain/entities/institution_grants_entity.dart';
import 'institutions_grants_cubit.dart';
import '../../../../shared/entity/base_entity.dart';

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
