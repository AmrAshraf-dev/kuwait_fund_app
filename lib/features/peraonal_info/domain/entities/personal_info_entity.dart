import "package:equatable/equatable.dart";

/// Entity that contains the data of the Profile.
class PersonalInfoEntity extends Equatable {
  final String? employeeNumber;
  final String? name;
  final String? designationName;
  final String? email;
  final String? phone1;
  final String? phone2;
  final String? civilID;
  final String? recidancyExpiryDate;
  final String? nationalityName;
  final String? passportExpiryDate;
  final String? contractTypeName;
  final String? contactStartDate;
  final String? contactEndDate;
  final String? joiningDate;
  final String? attachmentInfo;

  /// Entity that contains the data of the Profile.
  PersonalInfoEntity(
      {this.employeeNumber,
      this.name,
      this.designationName,
      this.email,
      this.phone1,
      this.phone2,
      this.civilID,
      this.recidancyExpiryDate,
      this.nationalityName,
      this.passportExpiryDate,
      this.contractTypeName,
      this.contactStartDate,
      this.contactEndDate,
      this.joiningDate,
      this.attachmentInfo});

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
