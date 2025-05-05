import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/more/presentation/cubits/more_cubit.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../data/models/request/auth_request_model.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/use_cases/get_auth_usecase.dart';

part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final GetAuthUseCase getAuthUseCase;
  AuthCubit({required this.getAuthUseCase}) : super(AuthInitialState());

  Future<bool> getAuth({required AuthRequestModel authModel}) async {
    emit(AuthLoadingState());

    final CustomResponseType<BaseEntity<AuthEntity>> eitherPackagesOrFailure =
        await getAuthUseCase(authModel);

    return eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AuthErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
      return false;
    }, (BaseEntity<AuthEntity> response) async {
      if (response.code == 200) {
        emit(AuthReadyState(response));
        await getIt<MoreCubit>().getMore();

        return true;
      } else {
        emit(AuthErrorState(message: "wrong_user_password"));
        return false;
      }
    });
  }
}
