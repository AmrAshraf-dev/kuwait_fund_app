 import "package:kf_ess_mobile_app/features/profile/data/models/response/profile_response_model.dart";

/// Entity that contains the data of the Profile.
class MainProfileEntity   {
  final ProfileModel? profile;
  final EmployeeAddressModel?  employeeAddress;
 

  /// Entity that contains the data of the Profile.
  const MainProfileEntity({
    this.profile,
    this.employeeAddress,
    
  });

 
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

//   /// Entity that contains the data of the Profile.
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
