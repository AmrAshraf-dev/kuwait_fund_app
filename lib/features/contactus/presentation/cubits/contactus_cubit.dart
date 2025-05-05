import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../domain/use_cases/get_map_coordinates_usecase.dart';
import '../../domain/use_cases/get_telephone_fax_usecase.dart';

import "../../../../core/network/base_handling.dart";
import '../../../../error/failure.dart';
import "../../../shared/entity/base_entity.dart";
import '../../domain/entities/contactus_entity.dart';
import '../../domain/use_cases/get_contactus_usecase.dart';

part 'contactus_state.dart';

@injectable
class ContactusCubit extends Cubit<ContactusState> {
  final GetContactusUseCase getContactusUseCase;
 

  ContactusCubit({
    required this.getContactusUseCase,
 
  }) : super(ContactusInitialState()) {
    getContactInformation();
  }

  Future<void> _fetchAllData() async {
    await Future.delayed(const Duration(milliseconds: 100));
    emit(ContactusLoadingState(contactusEntity: state.contactusEntity));

    final List<Either<Failure, BaseEntity<ContactusEntity>>> results = await Future.wait([
      getContactusUseCase.call(),
    
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
          updatedEntity =  response.data;
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
