
import 'package:json_annotation/json_annotation.dart';

part 'survey_request_model.g.dart';


  /*
  The params class is responsible for holding the data that will be used to make the request to the API.
  It is also responsible for converting the data into a format that the API can use.
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */


@JsonSerializable()
class SurveyRequestModel {
  SurveyRequestModel({required this.pageNumber, required this.pageSize});

  factory SurveyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyRequestModelFromJson(json);
  final int pageNumber;
  final int? pageSize;


  Map<String, dynamic> toJson() => _$SurveyRequestModelToJson(this);
}

