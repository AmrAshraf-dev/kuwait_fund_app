import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/main_profile_entity.dart';
import 'profile_response_model.dart';

part 'main_profile_response_model.g.dart';

/// Model that transforms the Profile data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class MainProfileModel extends MainProfileEntity {
  const MainProfileModel({
    super.profile,
    super.employeeAddress,

  });

  factory MainProfileModel.fromJson(Map<String, dynamic> json) =>
      _$MainProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainProfileModelToJson(this);
}

// @JsonSerializable()
// class EmployeeAddressModel extends MyAddressEntity {
//   const EmployeeAddressModel({
//     super.apartmentNumber,
//     super.building,
//     super.street,
//     super.city,
//     super.block,
//     super.avenue,
//     super.attachmentInfo,
//     super.phone1,
//     super.phone2,
//   });

//   factory EmployeeAddressModel.fromJson(Map<String, dynamic> json) =>
//       _$EmployeeAddressModelFromJson(json);

//   Map<String, dynamic> toJson() => _$EmployeeAddressModelToJson(this);
// }

@JsonSerializable()
class MainProfileResponseModel extends BaseEntity<MainProfileModel> {
  const MainProfileResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory MainProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainProfileResponseModelToJson(this);
}
