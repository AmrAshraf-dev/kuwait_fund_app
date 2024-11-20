import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/peraonal_info/presentation/widget/EditButton.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
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
            MainTitleWidget(title: context.tr("Employee Details")),
            12.verticalSpace,
            SizedBox(
              height: 568.h,
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
                            CustomMainRouter.push(EditProfileRoute());
                          },
                        ),
                      ),
                      PersonalInfoItem(title: context.tr("Employee Number"), body: "876887"),
                      PersonalInfoItem(title: context.tr("Full Name"), body: "Ahmad Riyad Abdel"),
                      PersonalInfoItem(title: context.tr("Civil Id Number"), body: "TE987345"),
                      PersonalInfoItem(title: context.tr("Residency Expiry Date"), body: "12/3/2030"),
                      PersonalInfoItem(title: context.tr("Nationality"), body: "Jordan"),
                      PersonalInfoItem(title: context.tr("Passport No."), body: "TE987345"),
                      PersonalInfoItem(title: context.tr("Passport Expiry Date"), body: "12/3/2030"),
                      PersonalInfoItem(title: context.tr("Email"), body: "ahmed@domainname.com"),
                      PersonalInfoItem(title: context.tr("Phone"), body: "+965 54365478, +965 87654322" , withDivider: false),
                    ],
                  ),
                ),
              ),
            ),
            25.verticalSpace,
            MainTitleWidget(title: context.tr("Contract Details")),
            12.verticalSpace,
            SizedBox(
              height: 329.h,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PersonalInfoItem(title: context.tr("Contract Type"), body: "Work" , withDivider: false),
                      8.verticalSpace,
                      PersonalInfoItem(title: context.tr("Job Title"), body: "Project Manager" , withDivider: false),
                      8.verticalSpace,
                      PersonalInfoItem(title: context.tr("Contract Start Date"), body: "12/3/2022" , withDivider: false),
                      8.verticalSpace,
                      PersonalInfoItem(title: context.tr("Contract End Date."), body: "12/3/2030" , withDivider: false),
                      8.verticalSpace,
                      PersonalInfoItem(title: context.tr("Joining Date"), body: "12/3/2030" , withDivider: false),
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


class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem({super.key ,required this.title,required this.body , this.withDivider = true});

  final String title;
  final String body;
  final bool? withDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: title,
          style: AppTextStyle.regular_14,
        ),
        6.verticalSpace,
        AppText(
          text: body,
          style: AppTextStyle.bold_16,
        ),
        if(withDivider ?? true)
        Divider(
          color: Palette.grey_E5DEDE,
          thickness: 1,
        ),
      ],
    );
  }
}
