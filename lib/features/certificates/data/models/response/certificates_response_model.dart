import 'package:json_annotation/json_annotation.dart';

import '../../../../shared/entity/base_entity.dart';
import '../../../domain/entities/certificates_entity.dart';

part 'certificates_response_model.g.dart';

/// Model that transforms the Certificates data from the API to the
/// application entity

/*
  The model is responsible for converting the data into a format that the rest of the application can use. 
  This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
  */

@JsonSerializable()
class CertificatesModel extends CertificatesEntity {
  const CertificatesModel({
    required super.id,
    required super.name,
  });

  factory CertificatesModel.fromJson(Map<String, dynamic> json) =>
      _$CertificatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CertificatesModelToJson(this);
}

@JsonSerializable()
class CertificatesResponseModel extends BaseEntity<List<CertificatesModel>> {
  const CertificatesResponseModel({
    super.code,
    super.data,
    super.message,
    super.totalRecords,
    super.hasMorePages,
  });

  factory CertificatesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CertificatesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CertificatesResponseModelToJson(this);
}
