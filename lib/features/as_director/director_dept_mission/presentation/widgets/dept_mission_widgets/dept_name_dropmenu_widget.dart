import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/app_validator.dart';
import '../../../../../../core/helper/view_toolbox.dart';
import '../../../domain/entities/director_dept_mission_entity.dart';
import '../../cubits/director_dept_mission_cubit.dart';
import '../../../../../shared/widgets/app_text.dart';
import '../../../../../shared/widgets/confirmation_popup_content_body.dart';
import '../../../../../shared/widgets/forms/drop_down_field.dart';
 
 
class DeptNameDropdown extends StatefulWidget {
    DeptEntity? initialValue;
  final ValueChanged<DeptEntity?> onDeptSelected;

    DeptNameDropdown({
    required this.onDeptSelected,
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  State<DeptNameDropdown> createState() => _DeptNameDropdownState();
}

class _DeptNameDropdownState extends State<DeptNameDropdown> {
   List<DeptEntity>  deptsListResponse  = <DeptEntity>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: BlocConsumer<DirectorDeptMissionCubit, DirectorDeptMissionState>(
        listener: (context, state) {
         if (state is DirectorDeptMissionErrorState) {
       
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showMessageBottomsheet(
              context: context,
              status: ConfirmationPopupStatus.failure,
              message: tr("general-error"),
            );
          } else if (state is DirectorDeptMissionLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is DirectorDeptsListReadyState) {
            

                 ViewsToolbox.dismissLoading();
              deptsListResponse = state.response.data ?? [];
                setState(() {
            if (deptsListResponse.isNotEmpty) {
              // setting first list item as default item to show in dropdown
              widget.initialValue = deptsListResponse.first;
                widget.onDeptSelected(
                deptsListResponse.first,
              );
           
            }
          });  

          }
          
        },
        builder: (context, state) {
             return CustomDropDownField<DeptEntity>(
              keyName: "deptName",
              labelText: context.tr("dept_name"),
              disableSearch: true,
              disableFiled: false,
              onChanged: widget.onDeptSelected,
            initialValue:  widget.initialValue,
              items: deptsListResponse.map((item) {
                return DropdownMenuItem<DeptEntity>(
                  value: item,
                  child: AppText(
                    text: item.name,
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