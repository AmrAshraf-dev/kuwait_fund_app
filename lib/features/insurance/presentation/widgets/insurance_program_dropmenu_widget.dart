import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/app_validator.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../di/dependency_init.dart';
import '../../domain/entities/insurance_programs.dart';
import '../cubits/insurance_cubit.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/forms/drop_down_field.dart';

class InsuranceProgramDropmenu extends StatelessWidget {
  final String? initalValue;
  final bool isReadOnly;
  InsuranceProgramDropmenu({
    super.key,
    this.initalValue,
    this.isReadOnly = false,
  });

  final InsuranceCubit insuranceCubit = getIt<InsuranceCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => insuranceCubit..getInsurancePrograms(),
      child: BlocBuilder<InsuranceCubit, InsuranceState>(
          builder: (context, state) {
        if (state is InsuranceLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is InsuranceErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
        } else if (state is InsuranceReadyState) {
          ViewsToolbox.dismissLoading();

          return CustomDropDownField<InsuranceProgramsEntity?>(
            keyName: "insuranceProgram",
            initialValue: initalValue == "null" || initalValue == null
                ? null
                : InsuranceProgramsEntity(name: initalValue),
            labelText: context.tr("insurance_program"),
            disableSearch: true,
            disableFiled: isReadOnly,
            labelAboveField: context.tr("insurance_program"),
            onChanged: (
              InsuranceProgramsEntity? newSelectedService,
            ) {},
            items: state.response.data == null
                ? []
                : state.response.data!.map((InsuranceProgramsEntity item) {
                    return DropdownMenuItem<InsuranceProgramsEntity>(
                      value: item,
                      child: AppText(
                        text: item.name,
                        style: AppTextStyle.medium_18,
                      ),
                    );
                  }).toList(),
            itemsSearchable: state.response.data == null
                ? []
                : state.response.data!
                    .map(
                      (InsuranceProgramsEntity item) =>
                          <String, InsuranceProgramsEntity>{
                        item.name!: item,
                      },
                    )
                    .toList(),
            validator: (InsuranceProgramsEntity? value) =>
                AppValidator.validatorRequired(
              value,
              context,
            ),
          );
        }
        return Container();
      }),
    );
  }
}
