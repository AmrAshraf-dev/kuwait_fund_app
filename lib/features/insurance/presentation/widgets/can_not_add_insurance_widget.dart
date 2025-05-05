import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/palette.dart';
import '../../domain/entities/insurance_entity.dart';
import 'insurance_program_dropmenu_widget.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/forms/text_field_widget.dart';

class CanNotAddInsuranceWidget extends StatelessWidget {
  final InsuranceEntity insuranceEntity;

  const CanNotAddInsuranceWidget({
    super.key,
    required this.insuranceEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Column(
                children: [
                  if (insuranceEntity.insurenceStatus != null &&
                      insuranceEntity.insurenceStatus != "null" &&
                      insuranceEntity.insurenceStatus != "")
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Palette.blue_5490EB,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: Palette.blue_5490EB,
                          ),
                          10.horizontalSpace,
                          Flexible(
                            child: AppText(
                              maxLines: 3,
                              text: insuranceEntity.insurenceStatus,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  20.verticalSpace,
                  TextFieldWidget(
                    keyName: "empolyeeName",
                    labelAboveField: context.tr("employee_name"),
                    initalValue: insuranceEntity.employeeName,
                    readOnly: true,
                  ),
                  20.verticalSpace,
                  TextFieldWidget(
                    keyName: "companyName",
                    labelAboveField: context.tr("company_name"),
                    initalValue: insuranceEntity.insuranceCompanyName
                        ?.replaceAll("null", ""),
                    readOnly: true,
                  ),
                  20.verticalSpace,
                  TextFieldWidget(
                    keyName: "startDate",
                    labelAboveField: context.tr("start_date"),
                    initalValue:
                        insuranceEntity.startDate?.replaceAll("null", ""),
                    readOnly: true,
                  ),
                  20.verticalSpace,
                  InsuranceProgramDropmenu(
                    initalValue: insuranceEntity.programSubscribed,
                    isReadOnly: true,
                  ),
                  20.verticalSpace,
                  TextFieldWidget(
                    keyName: "lifeInsuranceBeneficiaries",
                    labelAboveField: context.tr("life_insurance_beneficiaries"),
                    initalValue:
                        insuranceEntity.noOfPersons?.replaceAll("null", ""),
                    readOnly: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        50.verticalSpace,
      ],
    );
  }
}
