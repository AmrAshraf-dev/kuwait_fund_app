import "package:equatable/equatable.dart";

/// Entity that contains the data of the PersonalInfo.
class PersonalInfoEntity extends Equatable {
  final String? employeeNumber;
  final String? name;
  final String? designationName;
  final String? email;
  final String? phone1;
  final String? phone2;
  final String? mobile;
  final String? civilID;
  final String? recidancyExpiryDate;
  final String? nationalityName;
  final String? passportExpiryDate;
  final String? city;
  final String? block;
  final String? street;
  final String? avenue;
  final String? building;
  final String? apartmentNumber;
  final String? attachmentInfo;

  /// Entity that contains the data of the PersonalInfo.
  const PersonalInfoEntity({
    this.employeeNumber,
    this.name,
    this.designationName,
    this.email,
    this.mobile,
    this.phone1,
    this.phone2,
    this.civilID,
    this.recidancyExpiryDate,
    this.nationalityName,
    this.passportExpiryDate,
    this.city,
    this.block,
    this.street,
    this.avenue,
    this.building,
    this.apartmentNumber,
    this.attachmentInfo,
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

// class EmployeeAddressEntity extends Equatable {
//   final String? city;
//   final String? block;
//   final String? street;
//   final String? avenue;
//   final String? building;
//   final String? apartmentNumber;
//   final String? phone1;
//   final String? phone2;
//   final String? attachmentInfo;

//   /// Entity that contains the data of the PersonalInfo.
//   const EmployeeAddressEntity({
//     this.city,
//     this.block,
//     this.street,
//     this.avenue,
//     this.building,
//     this.apartmentNumber,
//     this.phone1,
//     this.phone2,
//     this.attachmentInfo,
//   });

//   /*
//   An entity represents a real-world object with a distinct identity. 
//   */

//   @override
//   List<Object?> get props => [
//         /*
//   List your entity attributes here 
//   */
//       ];
// }
