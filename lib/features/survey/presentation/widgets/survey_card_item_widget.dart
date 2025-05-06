 import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
 import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
 import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_entity.dart';

class SurveyCardItemWidget extends StatelessWidget {
  const SurveyCardItemWidget({super.key, required this.item});

  final SurveyEntity item;
  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Palette.grey_7B7B7B.withOpacity(0.2),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
          color: Palette.white,
          borderRadius: BorderRadius.circular(25.r),
        ),

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: AppText(
                text: item.createdOn?.showDateWithFormat(),
                style: AppTextStyle.semiBold_12,
                textColor: Palette.grey_707070,
              ),
            ),
            6.verticalSpace,
            InkWell(
              onTap: () {
                    CustomMainRouter.push(SurveyDetailsRoute(surveyItem: item));
              },
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (item.title != null)
                        SizedBox(
                          width: 250.w,
                          child: AppText(
                            maxLines: 4,
                            text: context.tr(item.title!),
                            style: AppTextStyle.bold_20,
                            textColor:  Palette.black,

                          ),
                        ),
                         Container(
                          width: 30.w,
                          height: 30.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10.r),
                            color: Palette.blue_002A69,
                          ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Palette.white,
                        ),
                      ),
                       ),
                    ],
                  ),
                ),
              ),
            ),
                        20.verticalSpace,

          ],
        ),
      ),
    );
  }
}
