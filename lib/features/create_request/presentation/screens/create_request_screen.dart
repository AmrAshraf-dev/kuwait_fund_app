import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/more/presentation/widgets/more_item_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_cubit/requests_cubit.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class CreateRequestScreen extends StatefulWidget {
    CreateRequestScreen({super.key,  });

   @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
 
 

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        waterMarkImage: waterMarkImage2,
        appBarHeight: 90.h,
        screenTitle: context.tr("create_request"),
        isBackEnabled: true,
        widget: Padding(
          padding: EdgeInsets.only(
              left: 15.w, right: 15.w, top: 24.h, bottom: 24.h),
          child: Column(
            children: [
              MoreItemWidget(
                  text: context.tr("annual_leave"),
                  svgIcon: annualLeaveViewAll,
                  onTap: () {
                    CustomMainRouter.push(CreateAnnualLeaveRequestRoute());
                  }),
    
              MoreItemWidget(
                  text: context.tr("emergency_leave"),
                  svgIcon: Assets.svg.createEmergencyRequestViewAll.path,
                  onTap: () {
                    CustomMainRouter.push(CreateEmergencyLeaveRequestRoute());
                  }),
              MoreItemWidget(
                  text: context.tr("sick_leave"),
                  svgIcon: Assets.svg.createSickLeaveRequestViewAll.path,
                  onTap: () {
                    CustomMainRouter.push(CreateSickLeaveRequestRoute());
                  }),
              //   MoreItemWidget(
              //       text: context.tr("loan_request"),
              //       svgIcon: Assets.svg.loan.path,
              //       onTap: () {
              //         CustomMainRouter.push(CreateLoanRequestRoute());
              //       }),
            ],
          ),
        ));
  }
}
