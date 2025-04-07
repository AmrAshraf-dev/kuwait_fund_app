import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/enums/request_type_enum.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class RequestItemWidget extends StatelessWidget {
  final RequestsEntity request;

  const RequestItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (int.parse(request.requestTypeID ?? "1") ==
            RequestTypeEnum.annualLeaveRequest.index) {
          CustomMainRouter.push(AnnualLeaveRequestDetailsRoute());
        }
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
        child: Container(
            height: 130.h,
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
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 18.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: 
                        request.requestDate?.showDateWithFormat(),
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                      if(request.requestStatus != null)
                      Container(
                        decoration: BoxDecoration(
                          color: _getRequestStatusColor(request.requestStatus ?? ""),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: context.tr(request.requestStatus ?? ""),
                            textColor: Colors.white,
                            style: AppTextStyle.semiBold_12,
                          ),
                        ),
                      )
                    ],
                  ),
                  11.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: context.tr(request.requestTitle ?? ""),
                            style: AppTextStyle.bold_16,
                            textColor: Palette.black,
                          ),
                          5.verticalSpace,
                          AppText(
                            text: "${request.details}",
                            style: AppTextStyle.medium_14,
                            textColor: Palette.black_2A2A2A,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.gery_DADADA,
                        size: 20.sp,
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
  
  _getRequestStatusColor(String requestStatus) {
    switch (requestStatus) {
      case "Pending":
        return Palette.orangeBackgroundTheme;
      case "Approved":
        return Palette.green;
      case "Rejected":
        return Palette.redBackgroundTheme;
      default:
        return Palette.grey_7B7B7B;
    }
  }
}
