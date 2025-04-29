import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/profile_entity.dart';

part 'profile_response_model.g.dart';

/// Model that transforms the Profile data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class ProfileModel extends ProfileEntity {
  const ProfileModel({
    super.passportNumber,
    super.employeeNumber,
    super.nameArabic,
    super.nameEnglish,
    super.designationName,
    super.email,
    super.phone1,
    super.phone2,
    super.civilID,
    super.recidancyExpiryDate,
    super.nationalityName,
    super.passportExpiryDate,
    super.mobile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}

@JsonSerializable()
class EmployeeAddressModel extends EmployeeAddressEntity {
  const EmployeeAddressModel({
    super.apartmentNumber,
    super.building,
    super.street,
    super.city,
    super.block,
    super.avenue,
   
  });

  factory EmployeeAddressModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeAddressModelToJson(this);
}

@JsonSerializable()
class ProfileResponseModel extends BaseEntity<ProfileModel> {
  const ProfileResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}
