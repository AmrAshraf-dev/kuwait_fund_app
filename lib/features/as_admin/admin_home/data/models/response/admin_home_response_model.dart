import 'package:json_annotation/json_annotation.dart';

import '../../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/admin_home_entity.dart';

part 'admin_home_response_model.g.dart';

/// Model that transforms the AdminHome data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AdminHomeModel extends AdminHomeEntity {
  AdminHomeModel({
    required super.var1,
    required super.var2,
  });

  factory AdminHomeModel.fromJson(Map<String, dynamic> json) =>
      _$AdminHomeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminHomeModelToJson(this);
}

@JsonSerializable()
class AdminHomeResponseModel extends BaseEntity<AdminHomeModel> {
  const AdminHomeResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AdminHomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AdminHomeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminHomeResponseModelToJson(this);
}
