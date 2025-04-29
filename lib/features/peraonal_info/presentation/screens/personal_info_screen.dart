import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
 import 'package:kf_ess_mobile_app/core/utility/palette.dart';
   import 'package:kf_ess_mobile_app/features/profile/domain/entities/main_profile_entity.dart';
 import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/personal_info_item_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class PersonalInfoScreen extends StatefulWidget {
    PersonalInfoScreen({super.key , required this.personalInfoEntity});
   MainProfileEntity personalInfoEntity;
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
      screenTitle: context.tr("personalInfo"),
      isBackEnabled: true,
      widget: Padding(
        padding:
            EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
        child:  
      
              Column(
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
                              text: context.tr("updateWithPACI"),
                              style: AppTextStyle.semiBold_14,
                              textColor: Palette.black,
                            ),
                          ],
                        ),
                        width: 197.w,
                        height: 40.h,
                        radius: 10.r,
                      ),
                    ]),
                25.verticalSpace,
                MainTitleWidget(title: context.tr("employee_details")),
                12.verticalSpace,
                Card(
                  margin: EdgeInsets.zero,
                  color: Palette.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Palette.gery_DADADA, width: 0.5),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.w, vertical: 13.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Align(
                        //   alignment: AlignmentDirectional.topEnd,
                        //   child: EditButton(
                        //     onPressed: () {
                        //       CustomMainRouter.push(EditProfileRoute());
                        //     },
                        //   ),
                        // ),
                        PersonalInfoItem(
                            title: context.tr("employeeNumber"),
                            body:  widget.personalInfoEntity.profile?.employeeNumber ??
                               '-' //"876887"
                            ),
                        PersonalInfoItem(
                            title: context.tr("nameArabic"),
                            body: widget.personalInfoEntity.profile?.nameArabic ??
                                '-' //"Ahmad Riyad Abdel"
                            ),
                                PersonalInfoItem(
                            title: context.tr("nameEnglish"),
                            body: widget.personalInfoEntity.profile?.nameEnglish ??
                                '-' //"Ahmad Riyad Abdel"
                            ),
                        PersonalInfoItem(
                            title: context.tr("civil_id"),
                            body:
                                widget.personalInfoEntity.profile?.civilID ?? '-' //"TE987345"
                            ),
                        PersonalInfoItem(
                                                    isLTR: true,

                            title: context.tr("residencyExpiryDate"),
                            body: widget.personalInfoEntity.profile?.recidancyExpiryDate ??
                                '-' //"12/3/2030"
                            ),
                        PersonalInfoItem(
                            title: context.tr("nationaliy"),
                            body: widget.personalInfoEntity.profile?.nationalityName ??
                                '-' //"Jordan"
                            ),
                        PersonalInfoItem(
                            title: context.tr("passportNo"),
                            body: '-'),
                        PersonalInfoItem(
                          isLTR: true,
                            title: context.tr("passportExpiryDate"),
                            body: widget.personalInfoEntity.profile?.passportExpiryDate ??
                                '-' //"12/3/2030"
                            ),
                        PersonalInfoItem(
                            title: context.tr("email"),
                            body: widget.personalInfoEntity.profile?.email ??
                                '-' //"ahmed@domainname.com"
                            ),
                        PersonalInfoItem(
                            title: context.tr("phone"),
                            body: widget.personalInfoEntity.profile?.phone1 ??
                                '-', //"+965 54365478, +965 87654322",
                            ),
                             PersonalInfoItem(
                            title: context.tr("phone"),
                            body: widget.personalInfoEntity.profile?.phone2 ??
                                '-', //"+965 54365478, +965 87654322",
                            withDivider: false),
                      ],
                    ),
                  ),
                ),
                25.verticalSpace,
                MainTitleWidget(title: context.tr("myAddress")),
                12.verticalSpace,
                SizedBox(
                  width: 1.sw,
                  child: Card(
                    margin: EdgeInsets.zero,
                    color: Palette.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side:
                          BorderSide(color: Palette.gery_DADADA, width: 0.5),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 13.h),
                      child:
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     PersonalInfoItem(
                          //         title: context.tr("contractType"),
                          //         body: personalInfoEntity?.contractTypeName ??
                          //             '', //"Work",
                          //         withDivider: false),
                          //     8.verticalSpace,
                          //     PersonalInfoItem(
                          //         title: context.tr("jobTitle"),
                          //         body: personalInfoEntity?.designationName ??
                          //             '', //"Project Manager",
                          //         withDivider: false),
                          //     8.verticalSpace,
                          //     PersonalInfoItem(
                          //         title: context.tr("contractStartDate"),
                          //         body: personalInfoEntity?.contactStartDate ??
                          //             '', //"12/3/2022",
                          //         withDivider: false),
                          //     8.verticalSpace,
                          //     PersonalInfoItem(
                          //         title: context.tr("contractEndDate"),
                          //         body: personalInfoEntity?.contactEndDate ??
                          //             '', //"12/3/2030",
                          //         withDivider: false),
                          //     8.verticalSpace,
                          //     PersonalInfoItem(
                          //         title: context.tr("joiningDate"),
                          //         body: personalInfoEntity?.joiningDate ??
                          //             '', //"12/3/2030",
                          //         withDivider: false),
                          //   ],
                          // ),
                          Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Align(
                          //   alignment: AlignmentDirectional.topEnd,
                          //   child: EditButton(
                          //     onPressed: () {
                          //       CustomMainRouter.push(EditAddressRoute());
                          //     },
                          //   ),
                          // ),
                          20.verticalSpace,
                          PersonalInfoItemWidget(
                              title: context.tr("government"),
                              body: widget.personalInfoEntity.employeeAddress?.avenue ??
                                  '-', //"Farwaniya",
                              withDivider: false),
                          12.verticalSpace,
                          PersonalInfoItemWidget(
                              title: context.tr("street"),
                              body:  widget.personalInfoEntity.employeeAddress?.street ??
                                  '-', //"Ahmad Riyad Abdel",
                              withDivider: false),
                          12.verticalSpace,
                          PersonalInfoItemWidget(
                              title: context.tr("block"),
                              body:  widget.personalInfoEntity.employeeAddress?.block ?? '-', //"12",
                              withDivider: false),
                          12.verticalSpace,
                          PersonalInfoItemWidget(
                              title: context.tr("buildingNumber"),
                              body:
                                   widget.personalInfoEntity.employeeAddress?.building ?? '-', //"230",
                              withDivider: false),
                          12.verticalSpace,
                          PersonalInfoItemWidget(
                              title: context.tr("floor"),
                              body:  widget.personalInfoEntity.employeeAddress?.apartmentNumber ??
                                  '-', //"1",
                              withDivider: false),
                          12.verticalSpace,
                          PersonalInfoItemWidget(
                              title: context.tr("flat"),
                              body:  widget.personalInfoEntity.employeeAddress?.apartmentNumber ??
                                  '-', //"13",
                              withDivider: false),
                        ],
                      ),
                    ),
                  ),
                ),
                60.verticalSpace
              ],
       
       
          ),
      ),
    );
  }
}

class PersonalInfoItem extends StatelessWidget {
  const PersonalInfoItem(
      {super.key,
      required this.title,
      required this.body,
      this.withDivider = true,
      this.isLTR = false});

  final String title;
  final String body;
  final bool? withDivider;
  final bool isLTR;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppText(
          text: title,
          style: AppTextStyle. bold_16 ,
        ),
        6.verticalSpace,
        Directionality(
          textDirection: isLTR ? TextDirection.ltr :LanguageHelper.isAr(context)?     TextDirection.rtl : TextDirection.ltr,
          child: AppText(
            text: body,
            style: AppTextStyle.regular_14,
          ),
        ),
        if (withDivider ?? true)
          Divider(
            color: Palette.grey_E5DEDE,
            thickness: 1,
          ),
      ],
    );
  }
}
