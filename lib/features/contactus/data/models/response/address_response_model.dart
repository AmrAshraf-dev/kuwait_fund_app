import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/contactus/domain/entities/address_entity.dart';

part 'address_response_model.g.dart';

/// Model that transforms the Contactus data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AddressModel extends AddressEntity {
  const AddressModel({
    required super.text,
   
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
