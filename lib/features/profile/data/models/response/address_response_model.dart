import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/address_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'address_response_model.g.dart';

/// Model that transforms the Address data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AddressModel extends MyAddressEntity {
  const AddressModel({
    super.city,
    super.apartmentNumber,
    super.building,
    super.street,
    super.attachmentInfo,
    super.avenue,
    super.block,
    super.phone1,
    super.phone2,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class AddressResponseModel extends BaseEntity<AddressModel> {
  const AddressResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseModelToJson(this);
}
