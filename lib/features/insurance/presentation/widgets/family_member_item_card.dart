import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/insurance/data/models/response/insurance_family_member_response_model.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/family_member_entity.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/selected_family_members_cubit/selected_family_members_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class FamilyMemberItemCard extends StatelessWidget {
  final List<FamilyMemberEntity> familyMemberList;
  final SelectedFamilyMembersCubit selectedFamilyMembersCubit;
  const FamilyMemberItemCard({
    super.key,
    required this.familyMemberList,
    required this.selectedFamilyMembersCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedFamilyMembersCubit, SelectedFamilyMembersState>(
      builder: (context, state) {
        List<FamilyMemberEntity> selectedFamilyMembers = [];
        if (state is SelectedFamilyMembersUpdatedState) {
          selectedFamilyMembers = state.selectedFamilyMembers;
        }

        return Column(
          children: familyMemberList
              .asMap()
              .map((index, familyMemberEntity) => MapEntry(
                  index,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 13.w),
                    child: GestureDetector(
                      onTap: () {
                        selectedFamilyMembersCubit.toggleFamilyMember(
                            InsuranceFamilyMemberModel(
                                dateOfBirth: familyMemberEntity.dateOfBirth,
                                id: familyMemberEntity.id,
                                isSubscribed: familyMemberEntity.isSubscribed,
                                name: familyMemberEntity.name,
                                englishName: familyMemberEntity.englishName,
                                gender: familyMemberEntity.relativeInd,
                                relativeInd: familyMemberEntity.relativeInd));
                      },
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
                          leading: Checkbox(
                            activeColor: Palette.primaryColor,
                            value: selectedFamilyMembers
                                .contains(familyMemberEntity),
                            onChanged: (bool? value) {
                              selectedFamilyMembersCubit.toggleFamilyMember(
                                  InsuranceFamilyMemberModel(
                                      dateOfBirth:
                                          familyMemberEntity.dateOfBirth,
                                      id: familyMemberEntity.id,
                                      isSubscribed:
                                          familyMemberEntity.isSubscribed,
                                      name: familyMemberEntity.name,
                                      englishName:
                                          familyMemberEntity.englishName,
                                      gender: familyMemberEntity.relativeInd,
                                      relativeInd:
                                          familyMemberEntity.relativeInd));
                            },
                          ),
                          title: AppText(
                            maxLines: 2,
                            text: familyMemberEntity.name,
                            style: AppTextStyle.medium_16,
                          ),
                          subtitle: AppText(
                            text: familyMemberEntity.relativeInd,
                            style: AppTextStyle.regular_16,
                          ),
                        ),
                      ),
                    ),
                  )))
              .values
              .toList(),
        );
      },
    );
  }
}
