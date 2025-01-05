import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/use_cases/get_map_coordinates_usecase.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/use_cases/get_telephone_fax_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/entities/contactus_entity.dart';
import '../../domain/use_cases/get_contactus_usecase.dart';

part 'contactus_state.dart';

@injectable
class ContactusCubit extends Cubit<ContactusState> {
  final GetContactusUseCase getContactusUseCase;
  final GetCoordinatesUseCase getCoordinatesUseCase;
  final GetTelephoneFaxUseCase getTelephoneFaxUseCase;

  ContactusCubit({
    required this.getContactusUseCase,
    required this.getCoordinatesUseCase,
    required this.getTelephoneFaxUseCase,
  }) : super(ContactusInitialState()) {
    getContactInformation();
    getMapCoordinates();
    getTelephoneFax();
  }

  Future<void> _fetchData(
    Future<CustomResponseType<BaseEntity<ContactusEntity>>> Function() useCase,
    Function(ContactusEntity) updateCallback,
  ) async {
    emit(ContactusLoadingState(contactusEntity: state.contactusEntity));

    final eitherResult = await useCase();

    eitherResult.fold(
      (failure) {
        final massage = FailureToMassage();
        emit(ContactusErrorState(
          message: massage.mapFailureToMessage(failure),
          contactusEntity: state.contactusEntity,
        ));
      },
      (response) {
        final updatedEntity = updateCallback(response.data!);
        emit(ContactusReadyState(contactusEntity: updatedEntity));
      },
    );
  }

  Future<void> getContactInformation() async {
    await _fetchData(
      getContactusUseCase.call,
      (newData) =>
          state.contactusEntity?.copyWith(
            operationsEmail: newData.operationsEmail,
            webmasterEmail: newData.webmasterEmail,
            fax: newData.fax,
            telephoneNumber: newData.telephoneNumber,
            address: newData.address,
          ) ??
          newData,
    );
  }

  Future<void> getMapCoordinates() async {
    await _fetchData(
      getCoordinatesUseCase.call,
      (newData) =>
          state.contactusEntity?.copyWith(
            latitude: newData.latitude,
            longitude: newData.longitude,
          ) ??
          newData,
    );
  }

  Future<void> getTelephoneFax() async {
    await _fetchData(
      getTelephoneFaxUseCase.call,
      (newData) =>
          state.contactusEntity?.copyWith(
            fax: newData.fax,
            telephoneNumber: newData.telephoneNumber,
          ) ??
          newData,
    );
  }
}
