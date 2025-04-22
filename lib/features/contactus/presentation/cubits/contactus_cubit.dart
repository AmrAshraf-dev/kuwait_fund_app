import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
  }

  Future<void> _fetchAllData() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ContactusLoadingState(contactusEntity: state.contactusEntity));

    final List<Either<Failure, BaseEntity<ContactusEntity>>> results = await Future.wait([
      getContactusUseCase.call(),
      getCoordinatesUseCase.call(),
      getTelephoneFaxUseCase.call(),
    ]);

    List<String> failureMessages = [];
    ContactusEntity? updatedEntity = state.contactusEntity;

    for (var result in results) {
      result.fold(
        (failure) {
          final massage = FailureToMassage();
          failureMessages.add(massage.mapFailureToMessage(failure));
        },
        (response) {
          updatedEntity = updatedEntity?.copyWith(
                operationsEmail: response.data?.operationsEmail ?? updatedEntity?.operationsEmail,
                webmasterEmail: response.data?.webmasterEmail ?? updatedEntity?.webmasterEmail,
                fax: response.data?.fax ?? updatedEntity?.fax,
                telephoneNumber: response.data?.telephoneNumber ?? updatedEntity?.telephoneNumber,
                address: response.data?.address ?? updatedEntity?.address,
                latitude: response.data?.latitude ?? updatedEntity?.latitude,
                longitude: response.data?.longitude ?? updatedEntity?.longitude,
              ) ??
              response.data;
        },
      );
    }

    if (failureMessages.isNotEmpty) {
      emit(ContactusErrorState(
        message: failureMessages.first,
        contactusEntity: state.contactusEntity,
      ));
    } else {
      emit(ContactusReadyState(contactusEntity: updatedEntity!));
    }
  }

  Future<void> getContactInformation() async {
    await _fetchAllData();
  }

  Future<void> getMapCoordinates() async {
    // No longer needed as all calls are handled in _fetchAllData
  }

  Future<void> getTelephoneFax() async {
    // No longer needed as all calls are handled in _fetchAllData
  }
}
