import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/more/domain/entities/ads_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  List<AdsEntity> adsList = [
    AdsEntity(
      id: 1,
      title: "tips_to_achieve_better_productivity",
      description: "ads_details",
      imageUrl: slide1Image,
      date: '22 - Aug - 2024',
    ),
    AdsEntity(
      id: 2,
      title: "drink_plenty_of_water",
      subTitle: "stay_hydrated",
      description: "ads_details",
      imageUrl: slide2Image,
      date: '22 - Aug - 2024',
    ),
    // AdsEntity(
    //   id: 3,
    //   description: "ads_details",
    //   imageUrl: slide2Image,
    //   date: '22 - Aug - 2024',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
              isBackEnabled: true,

      screenTitle: context.tr("advertisement"),
      widget: Column(
        children: [
          25.verticalSpace,
          ListView.separated(
            shrinkWrap: true,
            itemCount: adsList.length,
            separatorBuilder: (context, index) => 20.verticalSpace,
            itemBuilder: (context, index) {
              return AdsCard(item: adsList[index]);
            },
          ),
        ],
      ),
    );
  }
}

class AdsCard extends StatelessWidget {
  const AdsCard({super.key, required this.item});

  final AdsEntity item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppText(
              text: item.date,
              style: AppTextStyle.semiBold_12,
              textColor: Palette.grey_707070,
            ),
          ),
          6.verticalSpace,
          InkWell(
            onTap: () {
          //    CustomMainRouter.push(AdsDetailsRoute(adItem: item));
            },
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(22.0.r)),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    )),
                Align(
                  alignment: LanguageHelper.isAr(context)
                      ? Alignment.topLeft
                      : Alignment.topLeft,
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
                                width: 140.w,
                                child: AppText(
                                  maxLines: 2,
                                  text: context.tr(item.title!),
                                  style: AppTextStyle.bold_20,
                                  textColor: item.id == 1
                                      ? Palette.white
                                      : Palette.black,
                                ),
                              ),
                            if (item.subTitle != null)
                              SizedBox(
                                width: 140.w,
                                child: AppText(
                                  text: context.tr(item.subTitle!),
                                  style: AppTextStyle.regular_18,
                                  textColor: item.id == 1
                                      ? Palette.white
                                      : Palette.black,
                                ),
                              ),
                          ],
                        ),
                        // if (item.id != 3)
                        //   Container(
                        //     width: 30.w,
                        //     height: 30.w,
                        //     decoration: BoxDecoration(
                        //       shape: BoxShape.rectangle,
                        //       borderRadius: BorderRadius.circular(10.r),
                        //       color: item.id == 1
                        //           ? Palette.yellow_FBD823
                        //           : Palette.blue_002A69,
                        //     ),
                            // child: Center(
                            //   child: Icon(
                            //     Icons.arrow_forward,
                            //     color: Palette.white,
                            //   ),
                            // ),
                        //  ),
                      ],
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
