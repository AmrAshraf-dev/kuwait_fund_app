part of 'request_types_cubit.dart';

abstract class RequestTypesState {}

class RequestTypesInitial extends RequestTypesState {}

class RequestTypesLoading extends RequestTypesState {}

class RequestTypesLoaded extends RequestTypesState {
  final List<RequestTypeEntity> requestTypes;
   RequestTypesLoaded({required this.requestTypes  });
}

class RequestTypesError extends RequestTypesState {
  final String message;

  RequestTypesError({required this.message});
}

 
