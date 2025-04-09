import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
 import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_logs_hosts_response_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart';

import '../../../../../core/network/api/network_apis_constants.dart';
import '../../../../../core/network/base_handling.dart';
import '../../../../../core/network/network_helper.dart';
import '../../../../../error/failure.dart';
import '../../models/request/visitors_logs_request_model.dart';
import '../../models/response/visitors_logs_response_model.dart';

abstract class VisitorsLogsRemoteDataSource {
  Future<CustomResponseType<VisitorsLogsResponseModel>> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsRequestModel});
  Future<CustomResponseType<VisitorsLogsHostsResponseModel>> getVisitorsHostsLogs(
      {required String date});

  Future<CustomResponseType<bool>> getCanViewVisitorsLogs() ;

  
}

@Injectable(as: VisitorsLogsRemoteDataSource)
class VisitorsLogsDataSourceImpl implements VisitorsLogsRemoteDataSource {
  VisitorsLogsDataSourceImpl(this.networkHelper);
  final NetworkHelper networkHelper;

  @override
  Future<CustomResponseType<VisitorsLogsResponseModel>> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsRequestModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
        path: ApiConstants.getManagementVisitorsCalendar,
        queryParams: <String, dynamic>{
          "month": visitorsLogsRequestModel.month ?? "",
          "year": visitorsLogsRequestModel.year ?? ""
        });

    if (result.success) {
      return right(VisitorsLogsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<VisitorsLogsHostsResponseModel>> getVisitorsHostsLogs(
      {required String date}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getHosts,
  queryParams: {"date": date},
    );


    if (result.success) {
      return right(
          VisitorsLogsHostsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
  
  @override
   Future<CustomResponseType<bool>> getCanViewVisitorsLogs() async {

        ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getCanViewVisitorsLogs,
  
    );


    if (result.success) {
      return right(
          result.response["data"]);
    } else {
      return left(ServerFailure(message: result.response as String));
    }

  }
 
  
}
