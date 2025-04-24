import 'package:json_annotation/json_annotation.dart';

part 'edit_child_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class EditChildRequestModel {
  EditChildRequestModel({
    this.childId,
    this.childArabicName,
    this.childEnglishName,
    this.childCivilId,
    this.childBirthDate,
    this.childGender,
    this.childDisabilityDate,
    this.childDisabilityType,
    this.fileExtention,
    this.bytes,
  });

  factory EditChildRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditChildRequestModelFromJson(json);
  final int? childId;
  final String? childArabicName;
  final String? childEnglishName;
  final String? childCivilId;
  final String? childBirthDate;
  final String? childGender;
  final String? childDisabilityDate;
  final String? childDisabilityType;
  final String? fileExtention;
  final String? bytes;

  Map<String, dynamic> toJson() => _$EditChildRequestModelToJson(this);
}
