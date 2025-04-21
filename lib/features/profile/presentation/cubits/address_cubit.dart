import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/address_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/use_cases/get_address_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
part 'address_state.dart';

@injectable
class AddressCubit extends Cubit<AddressState> {
  final GetAddressUseCase getAddressUseCase;
  AddressCubit({required this.getAddressUseCase})
      : super(AddressInitialState());

  Future<void> getAddress() async {
    emit(AddressLoadingState());

    final CustomResponseType<BaseEntity<MyAddressEntity>>
        eitherPackagesOrFailure = await getAddressUseCase();

    eitherPackagesOrFailure.fold((Failure failure) {
      final FailureToMassage massage = FailureToMassage();
      emit(AddressErrorState(
        message: massage.mapFailureToMessage(failure),
      ));
    }, (BaseEntity<MyAddressEntity> response) {
      emit(AddressReadyState(response));
    });
  }
}
