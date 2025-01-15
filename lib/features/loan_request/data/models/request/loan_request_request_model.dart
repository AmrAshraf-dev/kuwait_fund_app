import 'package:json_annotation/json_annotation.dart';

part 'loan_request_request_model.g.dart';

/*
  The params class is responsible for holding the data that will be used to make the request to the API. 
  It is also responsible for converting the data into a format that the API can use. 
  This could involve serializing objects into JSON, or mapping objects to database rows.
  */

@JsonSerializable()
class LoanRequestRequestModel {
  LoanRequestRequestModel(
      {required this.userName,
      required this.applicationDate,
      required this.reason,
      required this.reasonRemarks,
      required this.loanAmount,
      required this.noOfInstalments});

  factory LoanRequestRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoanRequestRequestModelFromJson(json);
  final String? userName;
  final String? applicationDate;
  final String? reason;
  final String? reasonRemarks;
  final String? loanAmount;
  final String? noOfInstalments;

  Map<String, dynamic> toJson() => _$LoanRequestRequestModelToJson(this);
}
