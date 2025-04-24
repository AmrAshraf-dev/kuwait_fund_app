import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/contactus/data/models/response/address_response_model.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/entities/contact_info_entity.dart';

part 'contact_info_response_model.g.dart';

/// Model that transforms the Contactus data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class ContactInfoModel extends ContactInfoEntity {
  const ContactInfoModel({
    required super.address,
    required super.operationsEmail,
    required super.webmasterEmail,
   
  });

  factory ContactInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoModelToJson(this);
}
