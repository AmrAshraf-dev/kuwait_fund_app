
import 'package:json_annotation/json_annotation.dart';

part 'peraonal_info_request_model.g.dart';


  /*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */


@JsonSerializable()
class PeraonalInfoRequestModel {
  PeraonalInfoRequestModel({required this.email, required this.lang});

  factory PeraonalInfoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PeraonalInfoRequestModelFromJson(json);
  final String? email;
  final String? lang;

  Map<String, dynamic> toJson() => _$PeraonalInfoRequestModelToJson(this);
}

