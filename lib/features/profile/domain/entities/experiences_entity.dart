// ignore_for_file: public_member_api_docs, sort_constructors_first
import "package:equatable/equatable.dart";

/// Entity that contains the data of the Qualifications.
class ExperiencesEntity extends Equatable {
  final String? id;
  final String? employerName;
  final String? jobTitle;
  final String? joinDate;
  final String? resignDate;

  /// Entity that contains the data of the Qualifications.
  const ExperiencesEntity({
    this.id,
    this.employerName,
    this.jobTitle,
    this.joinDate,
    this.resignDate,
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
