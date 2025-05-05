// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/child_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/look_up_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_form_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/file_picker_section_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/child_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class EditChildDataScreen extends StatefulWidget {
  String? id;

  EditChildDataScreen({
    Key? key,
    this.id,
 
  }) : super(key: key);

  @override
  State<EditChildDataScreen> createState() => _EditChildDataScreenState();
}

class _EditChildDataScreenState extends State<EditChildDataScreen> {
  final GlobalKey<FormBuilderState> formKeyChild = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    childCubit.getChildDisabilityTypes();
  }

  final ChildCubit childCubit = getIt<ChildCubit>();
  final FilePickerCubit filePickerFamilyCubit = getIt<FilePickerCubit>();
  ChildEntity? childEntity;
  List<LookUpEntity> disabilityTypes = [];

  final List<LookUpEntity> _genderStatuses = [
    LookUpEntity(id: "0", name: "male"),
    LookUpEntity(id: "1", name: "female"),
  ];

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("editChildData"),
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => childCubit
                  ..getChild(childModel: ChildRequestModel(id: widget.id))),
            BlocProvider(create: (context) => filePickerFamilyCubit),
          ],
          child:
          
          BlocConsumer<ChildCubit, ChildState>(
                        listener: (context, state) {
                          if(state is ChildLoadingState){
                            ViewsToolbox.showLoading();
                          }
                          else
                      if (state is ChildErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      }
else if (state is ChildReadyState) {
                        ViewsToolbox.dismissLoading();
                                                childEntity = state.response.data;

                      }



                    },
                   buildWhen: (previous, current) =>
                      current is ChildReadyState,
                    
                     builder: (context, state) {
                    
           
          
          
        return   Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldWidget(
                  initalValue: childEntity?.nameArabic,
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
                  initalValue: childEntity?.nameEnglish,
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
                  initalValue: childEntity?.civilID,
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
                    initialDate:  childEntity?.birthDate != null
                        ? DateFormat('yyyy-MM-dd').parse(
                            childEntity!.birthDate.toString())
                        : null,
                    lastDate: DateTime.now(),
                    validator: (p0) {
                      if (p0 == null) {
                        return context.tr("please_select_date");
                      }
                      return null;
                    },
                    fromLabelAboveField: context.tr("birthDate"),
                    customFormKey: formKeyChild,
                    keyNameFrom: "birthDate",
                  ),
            
                20.verticalSpace,
              
                CustomDropDownField(
                  initialValue: childEntity?.gender=="0"
                      ? _genderStatuses[0]
                      : _genderStatuses[1] 
              ,
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
                  initialDate:  childEntity?.childDisabilityDate != null && 
                      childEntity?.childDisabilityDate != ""
                      ? DateFormat('yyyy-MM-dd').parse(
                          childEntity!.childDisabilityDate.toString())
                      : null,
                  lastDate: DateTime.now(),
                  
                  validator: (p0) {
                    if (p0 == null) {
                      return context.tr("please_select_date");
                    }
                    return null;
                  },
                  fromLabelAboveField: context.tr("disabilityDate"),
                  customFormKey: formKeyChild,
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
                      initialValue: childEntity?.childDisabilityType != null &&
                          childEntity?.childDisabilityType != ""
                          ? disabilityTypes.firstWhere((element) =>
                              element.name ==
                              childEntity?.childDisabilityType)
                          : null,
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
                    customFormKey: formKeyChild,
                    keyName: "childBirthCertificate",
                      title: context.tr("attachChildBirthCertificate"),
                      filePickerCubit: filePickerFamilyCubit,
                      ),
                ),
                40.verticalSpace,
                  120.verticalSpace,
                  BlocConsumer<ChildCubit, ChildState>(
                    listener: (context, state) {
                      if (state is ChildErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      } else if (state is ChildLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is EditChildReadyState) {
                        ViewsToolbox.dismissLoading();
                          CustomMainRouter.push(ThankYouRoute(
                              subtitle:  
                                  "submitted_successfully_waiting_administrator",
                            ));
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: context.tr("submit"),
                        onPressed: () async {
                          if (formKeyChild.currentState!.saveAndValidate()) {
                            childCubit.editChild(EditChildRequestModel(
                              childId: int.parse(childEntity?.id ?? '0'),
                          childArabicName: formKeyChild
                                    .currentState?.fields["nameArabic"]?.value
                                    .toString(),
                                childEnglishName: formKeyChild
                                    .currentState?.fields["nameEnglish"]?.value
                                    .toString(), //childEntity?.name,
                                childCivilId: formKeyChild.currentState
                                    ?.fields["civilIDNumber"]?.value
                                    .toString(), //childEntity?.civilID,
                                childBirthDate: formKeyChild.currentState
                                            ?.fields["birthDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            formKeyChild.currentState!
                                                .fields["birthDate"]!.value
                                                .toString()))
                                    : null,
                                childDisabilityDate: //disabilityDate
                                    formKeyChild
                                                .currentState
                                                ?.fields["disabilityDate"]
                                                ?.value
                                                .toString() !=
                                            ''
                                        ? DateFormat('yyyy-MM-dd').format(
                                            DateFormat('dd/MM/yyy').parse(
                                                formKeyChild
                                                    .currentState!
                                                    .fields["disabilityDate"]!
                                                    .value
                                                    .toString()))
                                        : null,
                                childGender:    formKeyChild.currentState?.fields["gender"]?.value.id,
                                childDisabilityType: formKeyChild.currentState?.fields["disabilityType"]?.value.name, 
                                    
              
                                FileExtension:
                                    _getFileExtension(formKeyChild
                                        .currentState
                                        ?.fields["childBirthCertificate"]
                                        ?.value
                                        .toString() ??
                                        ''),
                                bytes: await _getFileBytes(
                                    XFile( formKeyChild
                                        .currentState
                                        ?.fields["childBirthCertificate"]
                                        ?.value
                                        .toString() ??
                                        '')),
                              ));
                            
                          
                          
                          }
                        },
                      );
                    },
                  ),
                  20.verticalSpace,
                ],
              ),
            );
                      }
                  
          )
        ));
  }

  String _getFileExtension(String filePath) {
    return path.extension(filePath).replaceFirst(".", "");
  }

  Future<String> _getFileBytes(XFile value) async {
    final bytes = await value.readAsBytes();
    return base64Encode(bytes);
  }
}
