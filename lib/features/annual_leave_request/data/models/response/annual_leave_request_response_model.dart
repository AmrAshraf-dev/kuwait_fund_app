// import 'package:json_annotation/json_annotation.dart';
// import 'package:kf_ess_mobile_app/features/annual_leave_request/data/models/request/annual_leave_request_request_model.dart';

// import '../../../../shared/entity/base_entity.dart';

// part 'annual_leave_request_response_model.g.dart';

// /// Model that transforms the AnnualLeaveRequest data from the API to the
// /// application entity

// /*
//   The model is responsible for converting the data into a format that the rest of the application can use. 
//   This could involve deserializing JSON from an API into objects, or mapping database rows to objects.
//   */

// @JsonSerializable()
// class AnnualLeaveRequestResponseModel extends BaseEntity<String> {
//   const AnnualLeaveRequestResponseModel({
//     super.code,
//     super.data,
//     super.message,
//     super.totalRecords,
//     super.hasMorePages,
//   });

//   factory AnnualLeaveRequestResponseModel.fromJson(Map<String, dynamic> json) =>
//       _$AnnualLeaveRequestResponseModelFromJson(json);

//   Map<String, dynamic> toJson() =>
//       _$AnnualLeaveRequestResponseModelToJson(this);
// }
