import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/app_validator.dart';
import '../../../../../../core/helper/view_toolbox.dart';
import '../../../../../shared/widgets/app_text.dart';
import '../../../../../shared/widgets/forms/drop_down_field.dart';
import '../../../domain/entities/director_entity.dart';
import '../../cubits/director_mission_cubit.dart';
  
 
class DirectorNameDropdown extends StatefulWidget {
     DirectorEntity? initialValue;
  final ValueChanged<DirectorEntity?> onDirectorSelected;
     DirectorNameDropdown({
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
         if (state is DirectorMissionListErrorState) {
            ViewsToolbox.dismissLoading();
            // ViewsToolbox.showMessageBottomsheet(
            //   context: context,
            //   status: ConfirmationPopupStatus.failure,
            //   message: tr("general-error"),
            // );
          } else if (state is DirectorMissionLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is DirectorsListReadyState) {
            ViewsToolbox.dismissLoading();
              directorsListResponse = state.response.data ?? [];
                setState(() {
            if (directorsListResponse.isNotEmpty) {
              // setting first list item as default item to show in dropdown
              widget.initialValue = directorsListResponse.first;
                widget.onDirectorSelected(
                directorsListResponse.first,
              );
           
            }
          });       
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