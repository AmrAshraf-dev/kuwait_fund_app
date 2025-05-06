
import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/poll_entity.dart';

part 'poll_response_model.g.dart';



/// Model that transforms the Poll data from the API to the
/// application entity

  /*
  The model is responsible for converting the data into a format that the rest of the application can use.
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */



@JsonSerializable()
class PollModel extends PollEntity {
 const PollModel(
      {
   required super.id,
    required super.createdOn,
    required super.expiresOn,
    required super.question,
    required super.sortOrder,});

  factory PollModel.fromJson(Map<String, dynamic> json) =>
      _$PollModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollModelToJson(this);
}

@JsonSerializable()
class PollResponseModel extends BaseEntity<List<PollModel>> {
  const PollResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory PollResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PollResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PollResponseModelToJson(this);
}