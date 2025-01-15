import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/beneficiary_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

class BeneficiaryItemCard extends StatelessWidget {
  final List<BeneficiaryEntity> beneficiaries;
  final Function(int) onDelete;

  const BeneficiaryItemCard({
    super.key,
    required this.beneficiaries,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: beneficiaries.length,
      itemBuilder: (context, index) {
        final beneficiary = beneficiaries[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              title: AppText(
                text: beneficiary.beneficiaryName,
                style: AppTextStyle.medium_18,
              ),
              subtitle: AppText(
                text: beneficiary.relationshipWithBeneficiary,
                style: AppTextStyle.regular_16,
              ),
              trailing: IconButton(
                icon: Assets.svg.delete.svg(),
                onPressed: () => onDelete(index),
              ),
            ),
          ),
        );
      },
    );
  }
}
