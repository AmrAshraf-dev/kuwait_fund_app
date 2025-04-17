import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_mission/domain/entities/director_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_mission/presentation/cubits/director_mission_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
 
 
class DirectorNameDropdown extends StatefulWidget {
  final DirectorMissionCubit directorMissionCubit;
  final DirectorEntity? initialValue;
  final ValueChanged<DirectorEntity?> onDirectorSelected;

    DirectorNameDropdown({
    required this.directorMissionCubit,
    required this.onDirectorSelected,
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  State<DirectorNameDropdown> createState() => _DirectorNameDropdownState();
}

class _DirectorNameDropdownState extends State<DirectorNameDropdown> {
   List<DirectorEntity>  directorsListResponse  = <DirectorEntity>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: BlocConsumer<DirectorMissionCubit, DirectorMissionState>(
        listener: (context, state) {
         if (state is DirectorMissionErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showMessageBottomsheet(
              context: context,
              status: ConfirmationPopupStatus.failure,
              message: tr("general-error"),
            );
          } else if (state is DirectorMissionLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is DirectorsListReadyState) {
            ViewsToolbox.dismissLoading();
              directorsListResponse = state.response.data ?? [];
          }
          
        },
        builder: (context, state) {
             return CustomDropDownField<DirectorEntity>(
              keyName: "directorName",
              labelText: context.tr("director_name"),
              disableSearch: true,
              disableFiled: false,
              onChanged: widget.onDirectorSelected,
            initialValue:  widget.initialValue,
              items: directorsListResponse.map((item) {
                return DropdownMenuItem<DirectorEntity>(
                  value: item,
                  child: AppText(
                    text: item.employeeName,
                    style: AppTextStyle.regular_16,
                  ),
                );
              }).toList(),
              validator: (value) =>
                  AppValidator.validatorRequired(value, context),
            );
         },
      ),
    );
  }
}