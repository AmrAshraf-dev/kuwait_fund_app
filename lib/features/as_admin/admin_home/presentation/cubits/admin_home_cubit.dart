import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../../core/network/base_handling.dart";
import '../../../../../error/failure.dart';
import "../../../../shared/entity/base_entity.dart";
import '../../data/models/request/admin_home_request_model.dart';
import '../../domain/entities/admin_home_entity.dart';
import '../../domain/use_cases/get_admin_home_usecase.dart';

part 'admin_home_state.dart';

@injectable
class AdminHomeCubit extends Cubit<AdminHomeState> {
  final GetAdminHomeUseCase getAdminHomeUseCase;
  AdminHomeCubit({required this.getAdminHomeUseCase})
      : super(AdminHomeInitialState());

  Future<void> getAdminHome(
      {required AdminHomeRequestModel adminHomeModel}) async {
    emit(AdminHomeLoadingState());

    final CustomResponseType<BaseEntity<AdminHomeEntity>>
        eitherPackagesOrFailure = await getAdminHomeUseCase(adminHomeModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AdminHomeErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AdminHomeEntity> response) {
      emit(AdminHomeReadyState(response));
    });
  }
}
