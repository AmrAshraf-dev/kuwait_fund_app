import "package:equatable/equatable.dart";

/// Entity that contains the data of the Certificates.
class CertificatesEntity extends Equatable {
  final String? id;

  final String? name;

  /// Entity that contains the data of the Certificates.
  const CertificatesEntity({required this.id, required this.name});

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
