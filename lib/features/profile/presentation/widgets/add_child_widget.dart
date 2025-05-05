import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../../core/helper/view_toolbox.dart';
import '../../../shared/widgets/file_picker_section_widget.dart';
 import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import '../../../shared/widgets/custom_form_field_widget.dart';
import '../../../shared/widgets/forms/drop_down_field.dart';
import '../../../shared/widgets/forms/single_date_picker.dart';
import '../../../shared/widgets/forms/text_field_widget.dart';
import '../../domain/entities/look_up_entity.dart';
import '../cubits/child_cubit.dart';

class AddChildWidget extends StatefulWidget {
  const AddChildWidget({super.key, required this.formKeyChild});
  final GlobalKey<FormBuilderState> formKeyChild;
 
  @override
  State<AddChildWidget> createState() => _AddChildWidgetState();
}

class _AddChildWidgetState extends State<AddChildWidget> {
 final  List<LookUpEntity> _genderStatuses = [
    LookUpEntity(id: "0", name: "male"),
        LookUpEntity(id: "1", name: "female"),

        
  ];

  List<LookUpEntity> disabilityTypes = [];

 

  @override
  void initState() {
    super.initState();
    context.read<ChildCubit>().getChildDisabilityTypes();
  }
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  labelAboveField: context.tr("nameArabic"),
                  keyName: "nameArabic",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    // FormBuilderValidators.alphabetical(),
                    FormBuilderValidators.minLength(3),
                    FormBuilderValidators.maxLength(15),
                    (value) {
                      final arabicRegex =
                          RegExp(r'^[\u0621-\u064A\s]+$');
                      if (value == null || !arabicRegex.hasMatch(value)) {
                        return context.tr("please_enter_valid_arabic_name");
                      }
                      return null;
                    },
                  ]),
                  textInputAction: TextInputAction.next,
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
                    customFormKey: widget.formKeyChild,
                    keyNameFrom: "birthDate",
                  ),
            
                20.verticalSpace,

                CustomDropDownField(
                  labelAboveField: context.tr('gender'),
                  keyName: 'gender',
                  labelText: context.tr('gender'),
                     validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                  disableSearch: true,
               
                  items: _genderStatuses.map((status) {
                    return DropdownMenuItem<LookUpEntity>(
                      value: status,
                      child: AppText(
                        text:context.tr(status.name??"male") ,
                      ),
                    );
                  }).toList(),
                ),
                20.verticalSpace,
                //?DISABILITY datepicker
                CustomSingleRangeDatePicker(
                  lastDate: DateTime.now(),
                  
                  validator: (p0) {
                    if (p0 == null) {
                      return context.tr("please_select_date");
                    }
                    return null;
                  },
                  fromLabelAboveField: context.tr("disabilityDate"),
                  customFormKey: widget.formKeyChild,
                  keyNameFrom: "disabilityDate",
                ),
                20.verticalSpace,

                BlocConsumer<ChildCubit, ChildState>(
                  listener: (context, state) {
                    if (state is ChildLoadingState) {
                      ViewsToolbox.showLoading();
                    } else if (state is ChildErrorState) {
                      ViewsToolbox.dismissLoading();
                    } else if (state is ChildDisabilityTypesReadyState) {
                      ViewsToolbox.dismissLoading();
                      disabilityTypes = state.response.data ?? [];
                    }
                  },
                  buildWhen: (previous, current) =>
                      current is ChildDisabilityTypesReadyState,
                  builder: (context, state) {
                    return CustomDropDownField(
                           validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                      labelAboveField: context.tr('disabilityType'),
                      keyName: 'disabilityType',
                      labelText: context.tr('disabilityType'),
                      disableSearch: true,
                      items: disabilityTypes.map((status) {
                        return DropdownMenuItem<LookUpEntity>(
                          value: status,
                          child: AppText(text: status.name),
                        );
                      }).toList(),
                    );
                  },
                ),

                20.verticalSpace,
              CustomFormFieldWidget(
                keyName: "childBirthCertificate",
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: context.tr("please_select_file"),
                    ),
                  ]),
                  child: FilePickerSection(
                    customFormKey:  widget.formKeyChild,
                    keyName: "childBirthCertificate",
                      title: context.tr("attachChildBirthCertificate"),
                      filePickerCubit: context.read<FilePickerCubit>(),
                      ),
                ),
                40.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
