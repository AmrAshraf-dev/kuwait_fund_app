import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/notifications/domain/entities/notifications_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class LoanNotificationWidget extends StatelessWidget {
  const LoanNotificationWidget({super.key , required this.notification});

  final NotificationsEntity notification;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CustomMainRouter.push(DocumentsRoute());
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 14.w, end: 15.w, top: 14.h),
        child: Container(
            height: 125.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Palette.grey_7B7B7B.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
              color: Palette.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: notification.date,
                    style: AppTextStyle.semiBold_12,
                    textColor: Palette.semiTextGrey,
                  ),
                  6.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: 'Loan Request - Sign Required',
                              style: AppTextStyle.bold_16,
                              textColor: Palette.black,
                            ),
                            5.verticalSpace,
                            AppText(
                              text: 'Loan request requires your signature on the contract and loan agreement documents.',
                              style: AppTextStyle.medium_14,
                              textColor: Palette.black_2A2A2A,
                              lineHeight: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 22.h),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Palette.gery_DADADA,
                          size: 20.sp,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
