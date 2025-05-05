import "package:equatable/equatable.dart";

/// Entity that contains the data of the Profile.
class ChildEntity extends Equatable {
  final String? id;
  final String? nameEnglish;
  final String? nameArabic;
  final String? civilID;
  final String? birthDate;
  final String? gender;
  final String? childDisabilityDate;
  final String? childDisabilityType;
  final String? attachmentInfo;

  /// Entity that contains the data of the Profile.
  const ChildEntity(
      {this.id,
      this.nameArabic,
      this.nameEnglish,
      this.civilID,
      this.birthDate,
      this.gender,
      this.childDisabilityDate,
      this.childDisabilityType,
      this.attachmentInfo});

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
    id,
      ];
}
