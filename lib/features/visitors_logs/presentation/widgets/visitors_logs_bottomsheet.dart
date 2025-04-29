import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitors_logs_details_request_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_details_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_details_list_view_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_host_name_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_selectable_days_chips_widget.dart';

class VisitsBottomSheet extends StatefulWidget {
  final DateTime calendarPressedDate;
  final List<String> calendarVisitorsLogsDates;
  final VisitorsLogsCubit visitorsLogsCubit;
  final List<VisitorsLogsDetailsEntity> visitorsLogsDetails;
  List<VisitorsLogsHostsEntity> calendarPressedDateHostsListResponse;
    VisitsBottomSheet({
    super.key,
    required this.calendarPressedDate,
    required this.calendarVisitorsLogsDates,
    required this.visitorsLogsCubit,
    required this.visitorsLogsDetails,
    required this.calendarPressedDateHostsListResponse,
  });

  @override
  VisitsBottomSheetState createState() => VisitsBottomSheetState();
}

class VisitsBottomSheetState extends State<VisitsBottomSheet> {
  VisitorsLogsHostsEntity? selectedHostName;
  late DateTime calendarPressedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    calendarPressedDate = widget.calendarPressedDate;
    selectedHostName = widget.calendarPressedDateHostsListResponse.first;
    //  WidgetsBinding.instance.addPostFrameCallback((_) async {
    //     widget.visitorsLogsCubit.getHostsList(
    //       DateFormat("yyyy-MM-dd").format(calendarPressedDate)
    //       );
    // });

   
  }



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        child: Container(
      color:  Colors.white,
      child: SafeArea(
        bottom: true,
        child:
    
    
    BlocProvider.value(
      value: widget.visitorsLogsCubit,
      child:  Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSelectableDaysChips(),
            _buildHostNameDropdown(),
            10.verticalSpace,
              Flexible(
              child: SingleChildScrollView(
                child: VisitorsLogsDetailsListView(
                  visitorsLogsDetails: widget.visitorsLogsDetails,
              visitorsLogsCubit: widget.visitorsLogsCubit,
              selectedHostName: selectedHostName,
            ),
              )
              ),
            16.verticalSpace,
            _buildCloseButton(context),
          ],
        ),
      ),
    )
      )
    ));
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        AppText(
          text: DateFormat("MMMM yyyy").format(calendarPressedDate),
          style: AppTextStyle.bold_21,
        ),
        16.verticalSpace,
      ],
    );
  }

  Widget _buildSelectableDaysChips() {
    return SelectableDaysChips(
      selectedDate: calendarPressedDate,
      calendarVisitorsLogsDates: widget.calendarVisitorsLogsDates,
      onDaySelected: (day) {
        setState(() {
          calendarPressedDate = DateFormat("dd/MM/yyyy").parse(day);
          selectedHostName = null;
        });
        widget.visitorsLogsCubit.getHostsList(
          DateFormat("yyyy-MM-dd").format(calendarPressedDate),
          showNewBottomSheet: false,
           );
        // widget.visitorsLogsCubit.getVisitorLogsDetails(
        //   VisitorsLogsDetailsRequestModel(
        //     date: DateFormat("yyyy-MM-dd").format(
        //                                   DateFormat("dd/MM/yyyy").parse(day)),
        //     hostName: selectedHostName?.name,
        //   ),
        //   showNewBottomSheet: false,
        // );
      },
    );
  }

  Widget _buildHostNameDropdown() {
    return BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
      listener: (context, state) {
        if (state is VisitorsLogsLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is VisitorsLogsErrorState) {
          ViewsToolbox.dismissLoading();
          
        } else if (state is VisitorsLogsHostsReadyState) {
          //TODO: to check if this called when change dropmenu value inside buttomsheet
          ViewsToolbox.dismissLoading();
setState(() {
 widget.calendarPressedDateHostsListResponse = state.response.data ?? [];
});


                        widget.visitorsLogsCubit.getVisitorLogsDetails(
                        VisitorsLogsDetailsRequestModel(
                        date: DateFormat("yyyy-MM-dd").format(calendarPressedDate),
                        hostName: state.response.data?.first.name,),
                        showNewBottomSheet: state.showNewBottomSheet);
        }
      },
      builder: (context, state) {
       
          return HostNameDropdown(
              calendarPressedDateHostsListResponse:widget.calendarPressedDateHostsListResponse,
             initialValue: selectedHostName,
            onHostSelected: (host) {
              setState(() {
                selectedHostName = host;
              });
              widget.visitorsLogsCubit.getVisitorLogsDetails(
                VisitorsLogsDetailsRequestModel(
                  date: DateFormat("yyyy-MM-dd").format(calendarPressedDate),
                  hostName: selectedHostName?.name,
                ),
                showNewBottomSheet: false,
              );
            },
          );
         
       },
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return CustomElevatedButton(
      backgroundColor: Colors.transparent,
      onPressed: () {

                                                      final router = getIt<AppRouter>();
Navigator.pop(context);
      },
      textColor: Palette.primaryColor,
      text: context.tr("close"),
    );
  }
}


