part of 'generate_certificates_cubit.dart';

class GenerateCertificatesErrorState extends GenerateCertificatesState {
  final String? message;

  GenerateCertificatesErrorState({this.message});
}

final class GenerateCertificatesInitialState
    extends GenerateCertificatesState {}

final class GenerateCertificatesLoadingState
    extends GenerateCertificatesState {}

final class GenerateCertificatesReadyState extends GenerateCertificatesState {
  GenerateCertificatesReadyState(this.response);
  BaseEntity<String> response;
}

abstract class GenerateCertificatesState {}
