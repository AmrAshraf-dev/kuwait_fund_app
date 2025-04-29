import 'package:json_annotation/json_annotation.dart';

part 'edit_spouse_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class EditSpouseRequestModel {
  EditSpouseRequestModel({
    this.spouseId,
    this.spouseArabicName,
    this.spouseEnglishName,
    this.spouseCivilID,
    this.spouserBirthDate,
    this.spouseStatus,
    this.spouseStatusDate,
    this.fileExtention,
    this.bytes,
  });

  factory EditSpouseRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditSpouseRequestModelFromJson(json);
  final int? spouseId;
  final String? spouseArabicName;
  final String? spouseEnglishName;
  final String? spouseCivilID;
  final String? spouserBirthDate;
  final int? spouseStatus;
  final String? spouseStatusDate;
  final String? fileExtention;
  final String? bytes;

  Map<String, dynamic> toJson() => _$EditSpouseRequestModelToJson(this);
}
