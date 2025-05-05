import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/kf_board_of_directors_entity.dart';

import '../../../../shared/entity/base_entity.dart';

part 'kf_board_of_directors_response_model.g.dart';

/// Model that transforms the About data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class KFBoardOfDirectorsModel extends KFBoardOfDirectorsEntity {
  const KFBoardOfDirectorsModel({
    required super.imageUrl,
    required super.name,
    required super.role,
  });

  factory KFBoardOfDirectorsModel.fromJson(Map<String, dynamic> json) =>
      _$KFBoardOfDirectorsModelFromJson(json);

  Map<String, dynamic> toJson() => _$KFBoardOfDirectorsModelToJson(this);
}

@JsonSerializable()
class KFBoardOfDirectorsResponseModel
    extends BaseEntity<List<KFBoardOfDirectorsModel>> {
  const KFBoardOfDirectorsResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory KFBoardOfDirectorsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$KFBoardOfDirectorsResponseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$KFBoardOfDirectorsResponseModelToJson(this);
}
