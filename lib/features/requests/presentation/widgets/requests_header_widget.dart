import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_cubit/requests_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:provider/provider.dart';

class RequestsHeaderWidget extends StatelessWidget {
   const RequestsHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  CustomMainRouter.push(CreateRequestRoute(
                 
                  ));
                },
                child: Container(
                  padding: EdgeInsets.zero,
                  height: 47.h,
                  width: 51.h,
                  decoration: BoxDecoration(
                    color: Palette.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 45.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              AppText(
                text: context.tr("create_request"),
                style: AppTextStyle.medium_18,
                textColor: Palette.primaryColor,
              ),
            ],
          ),
       
        ],
      ),
    );
  }
}