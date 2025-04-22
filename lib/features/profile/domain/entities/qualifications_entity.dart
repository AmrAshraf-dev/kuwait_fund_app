// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:equatable/equatable.dart";

/// Entity that contains the data of the Qualifications.
class QualificationsEntity extends Equatable {
  final String? id;
  final String? educationName;
  final String? graduationDate;

  /// Entity that contains the data of the Qualifications.
  const QualificationsEntity({
    this.id,
    this.educationName,
    this.graduationDate,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        /*
  List your entity attributes here 
  */
      ];
}
