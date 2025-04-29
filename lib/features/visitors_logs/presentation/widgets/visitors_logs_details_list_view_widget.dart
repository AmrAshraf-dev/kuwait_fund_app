import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';

import '../../../../core/utility/palette.dart';
import '../../../shared/widgets/app_text.dart';
import '../../domain/entities/visitor_logs_details_entity.dart';

class VisitorsLogsDetailsListView extends StatelessWidget {
  final VisitorsLogsCubit visitorsLogsCubit;
  final VisitorsLogsHostsEntity? selectedHostName;
List<VisitorsLogsDetailsEntity> visitorsLogsDetails;
    VisitorsLogsDetailsListView({
    super.key,
    required this.visitorsLogsCubit,
    required this.selectedHostName,
    required this.visitorsLogsDetails,
  });
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
            message:context.tr(state.message!) ,
            closeOnlyPopup: true
          );
        } else if (state is VisitorsLogsDetailsReadyState) {
          ViewsToolbox.dismissLoading();
          visitorsLogsDetails = state.response.data ?? [];
        }
      },

      buildWhen: (previous, current) => 
          current is VisitorsLogsDetailsReadyState  ,
      builder: (context, state) {
     
          return
          
          state is VisitorsLogsDetailsReadyState?
               ( state.response.data?.length ?? 0)==0?
                Center(
                  child: AppText(
                    text: context.tr("no_visitors_logs"),
                    style: AppTextStyle.regular_14,
                  ),
                )
                :ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount:  
           visitorsLogsDetails.length,

            shrinkWrap: true,
            itemBuilder: (context, index) {
              final visit =   
              
                         visitorsLogsDetails[index];
              return _buildVisitTile(visit, context);
            },
          )   : SizedBox();
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
                Flexible(
                  child: AppText(
                    maxLines: 3,
                    text: visit.visitorName,
                    style: AppTextStyle.bold_14,
                  ),
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
                    text: visit.visitTypeName,
                    style: AppTextStyle.semiBold_12,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                                5.verticalSpace,

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