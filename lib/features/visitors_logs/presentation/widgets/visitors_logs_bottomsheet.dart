import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitors_logs_details_request_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_details_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/host_name_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class VisitsBottomSheet extends StatefulWidget {
  String selectedDate;
  final List<VisitorsLogsEntity> selectedMonthDays;

  VisitsBottomSheet(
      {super.key, required this.selectedDate, required this.selectedMonthDays});
  @override
  VisitsBottomSheetState createState() => VisitsBottomSheetState();
}

class VisitsBottomSheetState extends State<VisitsBottomSheet> {
  final VisitorsLogsCubit visitorsLogsCubit = getIt<VisitorsLogsCubit>();
  VisitorsLogsHostsEntity? selectedHostName;
  

  @override
  Widget build(BuildContext conAppText) {
     

   

    return BlocProvider(
      create: (context) => visitorsLogsCubit
        ..getVisitorLogsDetails(
          VisitorsLogsDetailsRequestModel(
            date: widget.selectedDate.toString(),
          ),
        ),
      child: Container(
        padding: EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            topRight: Radius.circular(35.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.verticalSpace,
            AppText(
              text: DateFormat("MMMM yyyy").format(DateTime.parse(widget.selectedDate)), // Display the formatted date
              style: AppTextStyle.bold_21,
            ),
            16.verticalSpace,

            SelectableDaysChips(
              selectedDate: widget.selectedDate,
              selectedMonthDays: widget.selectedMonthDays,
              onDaySelected: (day) {
                setState(() {
                  widget.selectedDate = day;
                });
              },
            ),
          
            HostNameDropdown(
              visitorsLogsCubit: visitorsLogsCubit,
              onHostSelected: (host) => setState(() => selectedHostName = host),
            ),
            10.verticalSpace,

            VisitorsLogsDetilsListItemsWidget(
              visitorsLogsCubit: visitorsLogsCubit,
              selectedHostName: selectedHostName,
            ),
            
            16.verticalSpace,
            CustomElevatedButton(
                backgroundColor: Colors.transparent,
                onPressed: () => Navigator.pop(conAppText),
                text: context.tr("close")),
          ],
        ),
      ),
    );
  }
}

class VisitorsLogsDetilsListItemsWidget  extends StatelessWidget {
  final VisitorsLogsCubit visitorsLogsCubit;
  final VisitorsLogsHostsEntity? selectedHostName;

  const VisitorsLogsDetilsListItemsWidget({
    super.key,
    required this.visitorsLogsCubit,
    required this.selectedHostName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
      listener: (context, state) {
if( state is VisitorsLogsLoadingState){
  ViewsToolbox.showLoading(   );
}

        if (state is VisitorsLogsErrorState) {
           ViewsToolbox.showMessageBottomsheet(context: context, status: ConfirmationPopupStatus.failure,
            message: state.message);  
        }
      
      },
      builder: (context, state) {
       if (state is VisitorsLogsDetailsReadyState) {
          return ListView.builder(
              itemCount: state.response.data?.length?? 0,
              shrinkWrap: true,
              itemBuilder: (conAppText, index) {
                final VisitorsLogsDetailsEntity visit = state.response.data![index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Palette.grey_7B7B7B.withOpacity(0.3),
                          blurRadius: 10.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Palette.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: Container(
                          width: 35.w,
                          height: 35.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Palette.yellow_FBD823,
                              width: 2.0,
                            ),
                          ),
                          child: Assets.svg.userCircleIcon.svg(
                              width: 50.w,
                              height: 50.w,
                              color: Palette.black),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: visit.visitType,
                              style: AppTextStyle.bold_14,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: visit.visitType == "private_visit"
                                    ? Palette.blue_3542B9
                                    : Palette.blue_5490EB,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: AppText(
                                text: context.tr(visit.visitType),
                                style: AppTextStyle.semiBold_12,
                                textColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.verticalSpace,
                                AppText(
                                    style: AppTextStyle.regular_14,
                                    textColor: Colors.black,
                                    text:
                                        "${context.tr("host_name")}:${visit.visitType}"),
                                AppText(
                                    style: AppTextStyle.regular_14,
                                    textColor: Colors.black,
                                    text:
                                        visit.visitDate),
                                AppText(
                                    style: AppTextStyle.regular_14,
                                    textColor: Colors.black,
                                    text:
                                        "${context.tr("number_of_delegation")} : ${visit.visitorsCount}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
        }
        return Container();
      },
    );
  }
}

class SelectableDaysChips  extends StatelessWidget {
  final String selectedDate;
  final List<VisitorsLogsEntity> selectedMonthDays;
  final Function(String) onDaySelected;

  const SelectableDaysChips({
    super.key,
    required this.selectedDate,
    required this.selectedMonthDays,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: selectedMonthDays.map((visitoreLogsEntity) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () {
                onDaySelected(visitoreLogsEntity.date);
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: selectedDate == visitoreLogsEntity.date
                      ? Colors.yellow
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: selectedDate == visitoreLogsEntity.date
                          ? Colors.transparent
                          : Palette.gery_DADADA),
                ),
                child: AppText(
                  text:
                      DateFormat("dd/MM/yyyy").parse(visitoreLogsEntity.date).day.toString(), // Format as "dd/MM/yyyy"
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
