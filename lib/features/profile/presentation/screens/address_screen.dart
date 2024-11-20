import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/peraonal_info/presentation/widget/EditButton.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/personal_info_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("Personal Info"),
      isBackEnabled: true,
      widget: Padding(
        padding:
        EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.svg.refresh.svg(),
                  CustomElevatedButton(
                    onPressed: () {},
                    backgroundColor: Palette.white,
                    borderColor: Palette.gray_B6B7B8,
                    showBorder: true,
                    customChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.png.paci.image(),
                        6.horizontalSpace,
                        AppText(
                          text: context.tr("Update with PACI"),
                          style: AppTextStyle.semiBold_14,
                          textColor: Palette.black,
                        ),
                      ],
                    ),
                    width: 197.w,
                    height: 40.h,
                    radius: 10.r,
                  ),
                ]
            ),
            25.verticalSpace,
            MainTitleWidget(title: context.tr("Address")),
            12.verticalSpace,
            SizedBox(
              height: 411.h,
              width: 364.w,
              child: Card(
                margin: EdgeInsets.zero,
                color: Palette.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Palette.gery_DADADA, width: 0.5),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: EditButton(
                          onPressed: () {
                            CustomMainRouter.push(EditAddressRoute());
                          },
                        ),
                      ),
                      PersonalInfoItemWidget(title: context.tr("Governate"), body: "Farwaniya" , withDivider: false),
                      12.verticalSpace,
                      PersonalInfoItemWidget(title: context.tr("Street"), body: "Ahmad Riyad Abdel" , withDivider: false),
                      12.verticalSpace,
                      PersonalInfoItemWidget(title: context.tr("Block"), body: "12" , withDivider: false),
                      12.verticalSpace,
                      PersonalInfoItemWidget(title: context.tr("Building Number"), body: "230" , withDivider: false),
                      12.verticalSpace,
                      PersonalInfoItemWidget(title: context.tr("Floor"), body: "1" , withDivider: false),
                      12.verticalSpace,
                      PersonalInfoItemWidget(title: context.tr("Flat"), body: "13" , withDivider: false),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


