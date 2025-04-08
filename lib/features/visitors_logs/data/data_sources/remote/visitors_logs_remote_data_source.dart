import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitor_logs_hosts_model.dart';
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
  Future<CustomResponseType<List<VisitorLogsHostsModel>>> getVisitorsHostsLogs(
      {required List<VisitorLogsHostsModel> visitorsLogsHostsModel});

  Future<CustomResponseType<List<VisitorsManagementCalendarModel>>>
      getVisitorsManagementCalendar(
          {required List<VisitorsManagementCalendarModel>
              visitorsManagementCalendarModel});
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
      print('respoooooooonse : ${result.response}');
      return right(VisitorsLogsResponseModel.fromJson(result.response));
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<List<VisitorLogsHostsModel>>> getVisitorsHostsLogs(
      {required List<VisitorLogsHostsModel> visitorsLogsHostsModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
      path: ApiConstants.getHosts,
      // headers: <String, dynamic>{
      //  'date':'',
      // },
    );

    debugPrint(" get response: " + result.response.toString());

    if (result.success) {
      return right((jsonDecode(result.response) as List<dynamic>)
          .map((json) => VisitorLogsHostsModel.fromJson(json))
          .toList());
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }

  @override
  Future<CustomResponseType<List<VisitorsManagementCalendarModel>>>
      getVisitorsManagementCalendar(
          {required List<VisitorsManagementCalendarModel>
              visitorsManagementCalendarModel}) async {
    ({dynamic response, bool success}) result = await networkHelper.get(
        path: '${ApiConstants.getManagementVisitorsCalendar}',
        queryParams: {
          'month': '',
        }
        // headers: <String, dynamic>{
        //  'date':'',
        // },
        );

    debugPrint(" get response: " + result.response.toString());

    if (result.success) {
      return right((jsonDecode(result.response) as List<dynamic>)
          .map((json) => VisitorsManagementCalendarModel.fromJson(json))
          .toList());
    } else {
      return left(ServerFailure(message: result.response as String));
    }
  }
}
