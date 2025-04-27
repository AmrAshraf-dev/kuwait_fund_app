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
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_host_name_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_selectable_days_chips_widget.dart';

class VisitsBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final List<String> calendarVisitorsLogsDates;
  final VisitorsLogsCubit visitorsLogsCubit;
  final List<VisitorsLogsDetailsEntity> visitorsLogsDetails;

  const VisitsBottomSheet({
    super.key,
    required this.selectedDate,
    required this.calendarVisitorsLogsDates,
    required this.visitorsLogsCubit,
    required this.visitorsLogsDetails,
  });

  @override
  VisitsBottomSheetState createState() => VisitsBottomSheetState();
}

class VisitsBottomSheetState extends State<VisitsBottomSheet> {
  VisitorsLogsHostsEntity? selectedHostName;
  late DateTime selectedDate;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedDate = widget.selectedDate;

     WidgetsBinding.instance.addPostFrameCallback((_) async {
        widget.visitorsLogsCubit.getHostsList(
          DateFormat("yyyy-MM-dd").format(selectedDate)
          );
    });

   
  }



  @override
  Widget build(BuildContext context) {
    return  Container(
      color:  Colors.white,
      child: SafeArea(
        bottom: true,
        child:
    
    
    BlocProvider.value(
      value: widget.visitorsLogsCubit,
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
            _buildHeader(),
            _buildSelectableDaysChips(),
            _buildHostNameDropdown(),
            10.verticalSpace,
              Flexible(
              child: SingleChildScrollView(
                child: VisitorsLogsDetailsListView(
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
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        AppText(
          text: DateFormat("MMMM yyyy").format(selectedDate),
          style: AppTextStyle.bold_21,
        ),
        16.verticalSpace,
      ],
    );
  }

  Widget _buildSelectableDaysChips() {
    return SelectableDaysChips(
      selectedDate: selectedDate,
      calendarVisitorsLogsDates: widget.calendarVisitorsLogsDates,
      onDaySelected: (day) {
        setState(() {
          selectedDate = DateFormat("dd/MM/yyyy").parse(day);
          selectedHostName = null;
        });
        widget.visitorsLogsCubit.getHostsList(
          DateFormat("yyyy-MM-dd").format(selectedDate)
          );
        widget.visitorsLogsCubit.getVisitorLogsDetails(
          VisitorsLogsDetailsRequestModel(
            date: DateFormat("yyyy-MM-dd").format(
                                          DateFormat("dd/MM/yyyy").parse(day)),
            hostName: selectedHostName?.name,
          ),
          showNewBottomSheet: false,
        );
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
          ViewsToolbox.dismissLoading();
        }
      },
      builder: (context, state) {
       
          return HostNameDropdown(
            visitorsLogsCubit: widget.visitorsLogsCubit,
            initialValue: selectedHostName,
            onHostSelected: (host) {
              setState(() {
                selectedHostName = host;
              });
              widget.visitorsLogsCubit.getVisitorLogsDetails(
                VisitorsLogsDetailsRequestModel(
                  date: DateFormat("yyyy-MM-dd").format(selectedDate),
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

if (router.canPop()) {
  router.back(); // or router.back();
}
      },

      textColor: Palette.primaryColor,
      text: context.tr("close"),
    );
  }
}

class VisitorsLogsDetailsListView extends StatelessWidget {
  final VisitorsLogsCubit visitorsLogsCubit;
  final VisitorsLogsHostsEntity? selectedHostName;

    VisitorsLogsDetailsListView({
    super.key,
    required this.visitorsLogsCubit,
    required this.selectedHostName,
  });
List<VisitorsLogsDetailsEntity> visitorsLogsDetailsList = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
      listener: (context, state) {
        if (state is VisitorsLogsLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is VisitorsLogsErrorState) {
          ViewsToolbox.showMessageBottomsheet(
            context: context,
            status: ConfirmationPopupStatus.failure,
            message: state.message,
            closeOnlyPopup: true
          );
        } else if (state is VisitorsLogsDetailsReadyState) {
          ViewsToolbox.dismissLoading();
          visitorsLogsDetailsList = state.response.data ?? [];
        }
      },

      buildWhen: (previous, current) => 
          current is VisitorsLogsDetailsReadyState  ,
      builder: (context, state) {
     
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ((state is VisitorsLogsDetailsReadyState)?
               ( state.response.data?.length ?? 0)
                : visitorsLogsDetailsList.length),

            shrinkWrap: true,
            itemBuilder: (context, index) {
              final visit =   
                  (state is VisitorsLogsDetailsReadyState)
                      ? state.response.data![index]
                      : visitorsLogsDetailsList[index];
              return _buildVisitTile(visit, context);
            },
          );
      }
       
    );
  }

  Widget _buildVisitTile(VisitorsLogsDetailsEntity visit, BuildContext context) {
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
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: visit.visitorName,
                  style: AppTextStyle.bold_14,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: visit.visitType == "Red"
                        ? Colors.red
                        : Palette.blue_3542B9,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    text: visit.visitType == "Red"
                        ? context.tr("official_visit")
                        : context.tr("private_visit"),
                    style: AppTextStyle.semiBold_12,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text: "${visit.visitDate} - ${visit.visitTime}",
                ),
                AppText(
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text:
                      "${context.tr("number_of_delegation")}: ${visit.visitorsCount}",
                ),
                AppText(
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text: "${context.tr("remarks")}: ${visit.remarks}",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
