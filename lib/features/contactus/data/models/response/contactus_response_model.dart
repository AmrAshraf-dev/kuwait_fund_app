import 'package:json_annotation/json_annotation.dart';
import 'address_response_model.dart';
import 'contact_info_response_model.dart';
import 'map_coordinates_response_model.dart';
import 'telephone_and_fax_repsonse_model.dart';

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
       required super.telephoneAndFax,
      required super.contactInfo,
      required super.mapCoordinates
    
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
