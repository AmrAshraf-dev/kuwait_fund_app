import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/telephone_and_fax_entity.dart';

part 'telephone_and_fax_repsonse_model.g.dart';

/// Model that transforms the Contactus data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class TelephoneAndFaxModel extends TelephoneAndFaxEntity {
    TelephoneAndFaxModel({
    required super.fax,
    required super.telephoneNumber,
 
  });

  factory TelephoneAndFaxModel.fromJson(Map<String, dynamic> json) =>
      _$TelephoneAndFaxModelFromJson(json);

  Map<String, dynamic> toJson() => _$TelephoneAndFaxModelToJson(this);
}
