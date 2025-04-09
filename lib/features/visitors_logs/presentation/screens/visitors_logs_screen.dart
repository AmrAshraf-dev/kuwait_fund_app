import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitors_logs_request_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/use_cases/get_can_view_visitors_logs_usecase.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/host_name_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_bottomsheet.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_calender_widget.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class VisitorsLogsScreen extends StatefulWidget {
  const VisitorsLogsScreen({super.key});

  @override
  State<VisitorsLogsScreen> createState() => _VisitorsLogsScreenState();
}

class _VisitorsLogsScreenState extends State<VisitorsLogsScreen> {
  final VisitorsLogsCubit visitorsLogsCubit = getIt<VisitorsLogsCubit>();
  DateTime _focusedDay = DateTime.now();
  VisitorsLogsHostsEntity? selectedHostName;

  @override
  Widget build(BuildContext context) {
    return 
     
     
     MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => visitorsLogsCubit..getCanViewVisitorsLogs(),
              ),
            ],
       child: BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
              listener: (context, state) {
                if(state is VisitorsLogsCanNotViewState){
                  ViewsToolbox.dismissLoading();
                  ViewsToolbox.showMessageBottomsheet(
                    context: context,
                    status: ConfirmationPopupStatus.failure,
                    message: tr("you_can_not_view_visitors_logs"),
                  );
                }
              else if (state is VisitorsLogsErrorState) {
                  ViewsToolbox.dismissLoading();
        ViewsToolbox.showMessageBottomsheet(
                context: context,
                status: ConfirmationPopupStatus.failure,
                message: tr("general-error"),
              ); 
              } else if (state is VisitorsLogsLoadingState) {
                  ViewsToolbox.showLoading();
                } else if (state is VisitorsLogsCanViewState) {
                  
                 
                   visitorsLogsCubit.getVisitorsLogs(
                  visitorsLogsModel: _createVisitorsLogsRequestModel(),
                );
                   visitorsLogsCubit.getHostsList(DateTime.now().toString());
                }
              },
              builder: (context, state) {
                
                return MasterWidget(
        screenTitle: context.tr("visitors_logs"),
        isBackEnabled: true,
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         20.verticalSpace,
            VisitorsLogsCalenderWidget(
              visitorsLogsCubit: visitorsLogsCubit,
              focusedDay: _focusedDay,
               onFocusedDayChanged: (day) => setState(() => _focusedDay = day),
            ),
            30.verticalSpace,
            LegendWidget(),
            30.verticalSpace,
          ],
        ),
           );
              },
            ),
     );
    
  }

  VisitorsLogsRequestModel _createVisitorsLogsRequestModel() {
    return VisitorsLogsRequestModel(
      month: _focusedDay.month.toString().padLeft(2, '0'),
      year: _focusedDay.year.toString(),
    );
  }
}





class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        10.horizontalSpace,
        Row(
          children: [
            LegendItem(color: Palette.blue_3542B9, labelKey: "private_visit"),
            20.horizontalSpace,
            LegendItem(color: Colors.red, labelKey: "official_visit"),
          ],
        ),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String labelKey;

  const LegendItem({required this.color, required this.labelKey, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.h,
          width: 20.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.rectangle),
        ),
        10.horizontalSpace,
        AppText(
          text: context.tr(labelKey),
          style: AppTextStyle.medium_18,
        ),
      ],
    );
  }
}


