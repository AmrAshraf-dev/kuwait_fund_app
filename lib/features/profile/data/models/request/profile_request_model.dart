
import 'package:json_annotation/json_annotation.dart';

part 'profile_request_model.g.dart';


  /*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */


@JsonSerializable()
class ProfileRequestModel {
  ProfileRequestModel({
    this.nameArabic,
    this.nameEnglish,
    this.mobile,
    this.recidancyExpiryDate,
    this.passportExpiryDate,
  });

  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestModelFromJson(json);
  final String? nameArabic;
  final String? nameEnglish;
  final String? mobile;
  final String? recidancyExpiryDate;
  final String? passportExpiryDate;

  Map<String, dynamic> toJson() => _$ProfileRequestModelToJson(this);
}

