import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/contactus/data/models/response/address_response_model.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/contactus_entity.dart';

part 'contactus_response_model.g.dart';

/// Model that transforms the Contactus data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class ContactusModel extends ContactusEntity {
  const ContactusModel({
    required super.address,
    required super.fax,
    required super.latitude,
    required super.longitude,
    required super.operationsEmail,
    required super.telephoneNumber,
    required super.webmasterEmail,
  });

  factory ContactusModel.fromJson(Map<String, dynamic> json) =>
      _$ContactusModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactusModelToJson(this);
}

@JsonSerializable()
class ContactusResponseModel extends BaseEntity<ContactusModel> {
  const ContactusResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory ContactusResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactusResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactusResponseModelToJson(this);
}
