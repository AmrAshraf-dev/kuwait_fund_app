import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_auth_usecase.dart';
import '../../domain/entities/auth_entity.dart';
import '../../data/models/request/auth_request_model.dart';

part 'auth_state.dart';





@injectable
class AuthCubit extends Cubit<AuthState> {
  final GetAuthUseCase getAuthUseCase;
  AuthCubit({required this.getAuthUseCase}) : super(AuthInitialState());

  Future<void> getAuth(
      {required AuthRequestModel authModel}) async {
    emit(AuthLoadingState());

    final CustomResponseType<BaseEntity<AuthEntity>> eitherPackagesOrFailure =
        await getAuthUseCase(authModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AuthErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AuthEntity> response) {
      emit(AuthReadyState(response));
    });
  }
}















