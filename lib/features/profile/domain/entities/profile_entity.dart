import "package:equatable/equatable.dart";

/// Entity that contains the data of the Profile.
class ProfileEntity extends Equatable {
    final String? employeeNumber;
  final String? nameEnglish;
  final String? nameArabic;
  final String? designationName;
  final String? email;
  final String? mobile;
  final String? civilID;
  final String? recidancyExpiryDate;
  final String? nationalityName;
  final String? passportExpiryDate;
  final String? passportNumber;


  final String? phone1;
  final String? phone2;


  
  final String? attachmentInfo;

  /// Entity that contains the data of the Profile.
  const ProfileEntity({
    this.passportNumber,
    this.employeeNumber,
    this.nameArabic,
    this.nameEnglish,
    this.designationName,
    this.email,
    this.mobile,
    this.phone1,
    this.phone2,
    this.civilID,
    this.recidancyExpiryDate,
    this.nationalityName,
    this.passportExpiryDate,
  
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

class EmployeeAddressEntity extends Equatable {
  final String? city;
  final String? block;
  final String? street;
  final String? avenue;
  final String? building;
  final String? apartmentNumber;
 
 
  /// Entity that contains the data of the Profile.
  const EmployeeAddressEntity({
   this.city,
    this.block,
    this.street,
    this.avenue,
    this.building,
    this.apartmentNumber,
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
