import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/use_cases/get_account_usecase.dart';
import '../../domain/entities/account_entity.dart';
import '../../data/models/request/account_request_model.dart';

part 'account_state.dart';





@injectable
class AccountCubit extends Cubit<AccountState> {
  final GetAccountUseCase getAccountUseCase;
  AccountCubit({required this.getAccountUseCase}) : super(AccountInitialState());

  Future<void> getAccount(
      {required AccountRequestModel accountModel}) async {
    emit(AccountLoadingState());

    final CustomResponseType<BaseEntity<AccountEntity>> eitherPackagesOrFailure =
        await getAccountUseCase(accountModel);

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AccountErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<AccountEntity> response) {
      emit(AccountReadyState(response));
    });
  }
}















