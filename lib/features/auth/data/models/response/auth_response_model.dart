import 'package:json_annotation/json_annotation.dart';
import 'package:kf_ess_mobile_app/features/auth/data/models/response/token_info_model.dart';
import 'package:kf_ess_mobile_app/features/auth/data/models/response/user_info_model.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/auth_entity.dart';

part 'auth_response_model.g.dart';

/// Model that transforms the Auth data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class AuthModel extends AuthEntity {
  const AuthModel({
    required super.tokenInfo,
    required super.userInfo,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);
}

@JsonSerializable()
class AuthResponseModel extends BaseEntity<AuthModel> {
  const AuthResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
