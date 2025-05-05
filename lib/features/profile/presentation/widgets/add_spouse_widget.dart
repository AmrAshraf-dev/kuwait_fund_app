import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_form_field_widget.dart';

import '../../../../core/helper/view_toolbox.dart';
import '../../../shared/widgets/file_picker_section_widget.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import '../../../shared/widgets/forms/drop_down_field.dart';
import '../../../shared/widgets/forms/single_date_picker.dart';
import '../../../shared/widgets/forms/text_field_widget.dart';
import '../../domain/entities/look_up_entity.dart';
import '../cubits/spouse_cubit.dart';

class AddSpouseWidget extends StatefulWidget {
  const AddSpouseWidget({super.key, required this.formKeySpouse});
  final GlobalKey<FormBuilderState> formKeySpouse;
  @override
  State<AddSpouseWidget> createState() => _AddSpouseWidgetState();
}

class _AddSpouseWidgetState extends State<AddSpouseWidget> {
 
   DateTime? maritalDate;
  List<LookUpEntity> maritalStatus = [];

@override
  void initState() {
    super.initState();
    context.read<SpouseCubit>().getSpouseStatus();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                labelAboveField: context.tr("nameArabic"),
                keyName: "nameArabic",
                textInputAction: TextInputAction.next,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  // FormBuilderValidators.alphabetical(),
                  FormBuilderValidators.minLength(3),
                  FormBuilderValidators.maxLength(15),
                  (value) {
                    final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
                    if (value == null || !arabicRegex.hasMatch(value)) {
                      return context.tr("please_enter_valid_arabic_name");
                    }
                    return null;
                  },
                ]),
              ),
              20.verticalSpace,
              TextFieldWidget(
                labelAboveField: context.tr("nameEnglish"),
                keyName: "nameEnglish",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  // FormBuilderValidators.alphabetical(),
                  FormBuilderValidators.minLength(3),
                  FormBuilderValidators.maxLength(15),
                  (value) {
                    final englishRegex = RegExp(r'^[a-zA-Z\s]+$');
                    if (value == null || !englishRegex.hasMatch(value)) {
                      return context.tr("please_enter_valid_english_name");
                    }
                    return null;
                  },
                ]),
                textInputAction: TextInputAction.next,
              ),
              20.verticalSpace,
              TextFieldWidget(
                labelAboveField: context.tr("civilIDNumber"),
                keyName: "civilIDNumber",
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                  // FormBuilderValidators.alphabetical(),
                  FormBuilderValidators.minLength(11),
                  FormBuilderValidators.maxLength(11),
                ]),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
              20.verticalSpace,
              CustomSingleRangeDatePicker(
                lastDate: DateTime.now(),
                validator: (p0) {
                  if (p0 == null) {
                    return context.tr("please_select_date");
                  }
                  return null;
                },
                fromLabelAboveField: context.tr("birthDate"),
                customFormKey: widget.formKeySpouse,
                keyNameFrom: "birthDate",
              ),
              20.verticalSpace,
              BlocConsumer<SpouseCubit, SpouseState>(
                listener: (context, state) {

                  if (state is SpouseLoadingState) {
                               ViewsToolbox.showLoading();

                  } else if (state is EditSpouseReadyState) {
                                   ViewsToolbox.dismissLoading();

                  } else if (state is SpouseErrorState) {
                                                   ViewsToolbox.dismissLoading();
                                                 

                  }
                  if (state is SpouseErrorState) {
                  }
              else    if (state is SpouseStatusReadyState) {
                                                   ViewsToolbox.dismissLoading();

                    maritalStatus = state.response.data ?? [];
                  }
                },

                buildWhen: (previous, current) =>  
                    current is SpouseStatusReadyState,
                builder: (context, state) {
                  return CustomDropDownField(
                    labelAboveField: context.tr('maritalStatus'),
                    keyName: 'maritalStatus',
                    labelText: context.tr('maritalStatus'),
                    disableSearch: true,
                    items: maritalStatus.map((status) {
                      return DropdownMenuItem<LookUpEntity>(
                        value: status,
                        child: AppText(text: status.name),
                      );
                    }).toList(),
                  );
                },
              ),
              20.verticalSpace,
              CustomSingleRangeDatePicker(
                lastDate: DateTime.now(),
                validator: (p0) {
                  if (p0 == null) {
                    return context.tr("please_select_date");
                  }
                  return null;
                },
                fromLabelAboveField: context.tr("marriageDate"),
                customFormKey: widget.formKeySpouse,
                keyNameFrom: "marriageDate",
              ),
              40.verticalSpace,
              CustomFormFieldWidget(
                keyName: "spouseFile",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.tr("please_select_file"),
                    ),
                  ]),
                  child: FilePickerSection(
                  keyName:  "spouseFile",
                  customFormKey:  widget.formKeySpouse,
                    title: context.tr("mirriageContract/divorceDocument"),
                    filePickerCubit: context.read<FilePickerCubit>(),
                    ),
              ),
              40.verticalSpace,
            ],
          ),
        ),
        20.verticalSpace,
      ],
    );
  }
}
