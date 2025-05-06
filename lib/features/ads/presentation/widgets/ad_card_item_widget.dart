import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/extensions/date_extensions.dart';
import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/ads/domain/entities/ads_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class AdsCardItemWidget extends StatelessWidget {
  const AdsCardItemWidget({super.key, required this.item});

  final AdsEntity item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: AppText(
              text: item.createdOn?.showDateWithFormat(),
              style: AppTextStyle.semiBold_12,
              textColor: Palette.grey_707070,
            ),
          ),
          6.verticalSpace,
          InkWell(
            onTap: () {
                  CustomMainRouter.push(AdsDetailsRoute(adItem: item));
            },
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(22.0.r)),
                    child:
                    (item.externalImage ==null || item.externalImage!.isEmpty )
                    && (item.templateImageUrl ==null || item.templateImageUrl!.isEmpty)
                    ? Image.asset(
                      Assets.png.adsPlaceholder.path,
                      fit: BoxFit.cover,
                    ):

                     CachedNetworkImage(
                    imageUrl:   item.templateImageUrl!=null && item.templateImageUrl!.isNotEmpty
                        ? item.templateImageUrl!
                        :
                             item.externalImage!,

                      fit: BoxFit.cover,
                    )


                    )



                    ,
                Align(
                  alignment: LanguageHelper.isAr(context)
                      ? Alignment.topLeft
                      : Alignment.topLeft,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              if (item.title != null)
                                SizedBox(
                                  width: 200.w,
                                  child: AppText(
                                    maxLines: 4,
                                    text: context.tr(item.title!),
                                    style: AppTextStyle.bold_20,
                                    textColor: item.id == 1
                                        ? Palette.white
                                        : Palette.black,
                                  ),
                                ),
                              // if (item.body != null)
                              //   SizedBox(
                              //     width: 140.w,
                              //     child: AppText(
                              //       text: context.tr(item.body!),
                              //       style: AppTextStyle.regular_18,
                              //       textColor: item.id == 1
                              //           ? Palette.white
                              //           : Palette.black,
                              //     ),
                              //   ),
                            ],
                          ),
                             Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10.r),
                                color: item.id == 1
                                    ? Palette.yellow_FBD823
                                    : Palette.blue_002A69,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
