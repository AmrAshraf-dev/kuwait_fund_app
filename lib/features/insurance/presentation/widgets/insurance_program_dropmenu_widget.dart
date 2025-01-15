import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_entity.dart';
import 'package:kf_ess_mobile_app/features/insurance/presentation/cubits/insurance_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';

class InsuranceProgramDropmenu extends StatelessWidget {
  const InsuranceProgramDropmenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsuranceCubit, InsuranceState>(
        builder: (context, state) {
      if (state is InsuranceLoadingState) {
        ViewsToolbox.showLoading();
      } else if (state is InsuranceErrorState) {
        ViewsToolbox.dismissLoading();
        ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
      } else if (state is InsuranceReadyState) {
        ViewsToolbox.dismissLoading();

        return CustomDropDownField<InsuranceEntity>(
          keyName: "insuranceProgram",
          labelText: context.tr("insurance_program"),
          disableSearch: true,
          disableFiled: false,
          labelAboveField: context.tr("insurance_program"),
          onChanged: (
            InsuranceEntity? newSelectedService,
          ) {},
          items: state.response.data == null
              ? []
              : state.response.data!.map((InsuranceEntity item) {
                  return DropdownMenuItem<InsuranceEntity>(
                    value: item,
                    child: AppText(
                      text: item.programName,
                      style: AppTextStyle.medium_18,
                    ),
                  );
                }).toList(),
          itemsSearchable: state.response.data == null
              ? []
              : state.response.data!
                  .map(
                    (InsuranceEntity item) => <String, InsuranceEntity>{
                      item.programName!: item,
                    },
                  )
                  .toList(),
          validator: (InsuranceEntity? value) => AppValidator.validatorRequired(
            value,
            context,
          ),
        );
      }
      return Container();
    });
  }
}
