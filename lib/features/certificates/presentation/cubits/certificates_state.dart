part of 'certificates_cubit.dart';

class CertificatesErrorState extends CertificatesState {
  final String? message;

  CertificatesErrorState({this.message});
}

final class CertificatesInitialState extends CertificatesState {}

final class CertificatesLoadingState extends CertificatesState {}

final class CertificatesReadyState extends CertificatesState {
  CertificatesReadyState(this.response);
    BaseEntity<CertificatesEntity> response;

}

abstract class CertificatesState {}
