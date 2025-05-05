import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/app_validator.dart';
import '../../../../../core/helper/view_toolbox.dart';
import '../../data/models/request/director_dept_assignment_request_model.dart';
import '../cubits/director_dept_assignment_cubit.dart';
import '../../../director_dept_mission/domain/entities/director_dept_mission_entity.dart';
import '../../../director_dept_mission/presentation/cubits/director_dept_mission_cubit.dart';
import '../../../../shared/widgets/app_text.dart';
import '../../../../shared/widgets/forms/drop_down_field.dart';

class DeptAssignmentNameDropmenuWidget extends StatefulWidget {
  DeptEntity? initialValue;
  final ValueChanged<DeptEntity?> onDeptSelected;
  final DirectorDeptAssignmentCubit directorDeptAssignmentCubit;
  DeptAssignmentNameDropmenuWidget({
    required this.onDeptSelected,
    required this.directorDeptAssignmentCubit,
    Key? key,
    this.initialValue,
  }) : super(key: key);

  @override
  State<DeptAssignmentNameDropmenuWidget> createState() =>
      _DeptAssignmentNameDropmenuWidgetState();
}

class _DeptAssignmentNameDropmenuWidgetState
    extends State<DeptAssignmentNameDropmenuWidget> {
  List<DeptEntity> deptsListResponse = <DeptEntity>[];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: BlocConsumer<DirectorDeptMissionCubit, DirectorDeptMissionState>(
        listener: (context, state) {
          if (state is DirectorDeptDropMenuMissionErrorState) {
            ViewsToolbox.dismissLoading();
            // ViewsToolbox.showMessageBottomsheet(
            //   context: context,
            //               closeOnlyPopup: true,

            //   status: ConfirmationPopupStatus.failure,
            //   message: tr("general-error"),
            // );
          } else if (state is DirectorDeptMissionLoadingState) {
            ViewsToolbox.showLoading();
          } else if (state is DirectorDeptsListReadyState) {
            ViewsToolbox.dismissLoading();
            deptsListResponse = state.response.data ?? [];
               setState(() {
            if (deptsListResponse.isNotEmpty) {
              widget.initialValue = deptsListResponse.first;
            }
          });
          if (deptsListResponse.isNotEmpty) {
            widget.directorDeptAssignmentCubit.getDirectorDeptAssignment(
              DirectorDeptAssignmentRequestModel(
                deptCode: deptsListResponse.first.departmentCode ?? "0",
              ),
            );
          }
          }
       
        },
        builder: (context, state) {
          return CustomDropDownField<DeptEntity>(
            keyName: "deptName",
            labelText: context.tr("dept_name"),
            disableSearch: true,
            disableFiled: false,
            onChanged: widget.onDeptSelected,
            initialValue: widget.initialValue,
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
