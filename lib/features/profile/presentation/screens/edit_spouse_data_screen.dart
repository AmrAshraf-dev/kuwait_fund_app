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
import 'package:kf_ess_mobile_app/features/profile/domain/entities/look_up_entity.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_form_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/file_picker_section_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/spouse_cubit.dart';
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
class EditSpouseDataScreen extends StatefulWidget {
  String? id;
 
  EditSpouseDataScreen({
    super.key,
    this.id,
    
  });

  @override
  State<EditSpouseDataScreen> createState() => _EditSpouseDataScreenState();
}

class _EditSpouseDataScreenState extends State<EditSpouseDataScreen> {
  final SpouseCubit spouseCubit = getIt<SpouseCubit>();
  final FilePickerCubit filePickerFamilyCubit = getIt<FilePickerCubit>();

  final GlobalKey<FormBuilderState> formKeySpouse =
      GlobalKey<FormBuilderState>();
  List<LookUpEntity> maritalStatus = [];
   @override
  void initState() {
    super.initState();
    spouseCubit.getSpouseStatus();
  }

  SpouseEntity? spouseEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => spouseCubit,
      child: MasterWidget(
          isBackEnabled: true,
          screenTitle: context.tr("editSpouseData"),
          widget: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => spouseCubit
                    ..getSpouse(
                        spouseModel: SpouseRequestModel(id: widget.id))),
              BlocProvider(create: (context) => filePickerFamilyCubit),
            ],
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: FormBuilder(
                      key: formKeySpouse,
                      child: BlocConsumer<SpouseCubit, SpouseState>(
                          listener: (context, state) {
                        if (state is SpouseErrorState) {
                          ViewsToolbox.dismissLoading();
                          ViewsToolbox.showErrorAwesomeSnackBar(
                              context, state.message!);
                        }
                        
                      },
                      buildWhen: (previous, current) => 
                          current is SpouseReadyState  ,
                      
                       builder: (context, state) {
                        if (state is SpouseLoadingState) {
                          ViewsToolbox.showLoading();
                        } else if (state is SpouseReadyState) {
                          spouseEntity = state.response.data!;
                          ViewsToolbox.dismissLoading();
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                20.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextFieldWidget(
                                        initalValue: spouseEntity?.nameArabic,
                                        labelAboveField:
                                            context.tr("nameArabic"),
                                        keyName: "nameArabic",
                                        textInputAction: TextInputAction.next,
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          // FormBuilderValidators.alphabetical(),
                                          FormBuilderValidators.minLength(3),
                                          FormBuilderValidators.maxLength(15),
                                          (value) {
                                            final arabicRegex =
                                                RegExp(r'^[\u0600-\u06FF\s]+$');
                                            if (value == null ||
                                                !arabicRegex.hasMatch(value)) {
                                              return context.tr(
                                                  "please_enter_valid_arabic_name");
                                            }
                                            return null;
                                          },
                                        ]),
                                      ),
                                      20.verticalSpace,
                                      TextFieldWidget(
                                        initalValue: spouseEntity?.nameEnglish,
                                        labelAboveField:
                                            context.tr("nameEnglish"),
                                        keyName: "nameEnglish",
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(),
                                          // FormBuilderValidators.alphabetical(),
                                          FormBuilderValidators.minLength(3),
                                          FormBuilderValidators.maxLength(15),
                                          (value) {
                                            final englishRegex =
                                                RegExp(r'^[a-zA-Z\s]+$');
                                            if (value == null ||
                                                !englishRegex.hasMatch(value)) {
                                              return context.tr(
                                                  "please_enter_valid_english_name");
                                            }
                                            return null;
                                          },
                                        ]),
                                        textInputAction: TextInputAction.next,
                                      ),
                                      20.verticalSpace,
                                      TextFieldWidget(
                                        initalValue: spouseEntity?.civilID,
                                        labelAboveField:
                                            context.tr("civilIDNumber"),
                                        keyName: "civilIDNumber",
                                        validator:
                                            FormBuilderValidators.compose([
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
                                        initialDate:  spouseEntity?.birthDate != null
                                            ? DateFormat('dd/MM/yyyy').parse(
                                                spouseEntity!.birthDate!)
                                            : null,
                                        lastDate: DateTime.now(),
                                        validator: (p0) {
                                          if (p0 == null) {
                                            return context
                                                .tr("please_select_date");
                                          }
                                          return null;
                                        },
                                        fromLabelAboveField:
                                            context.tr("birthDate"),
                                        customFormKey: formKeySpouse,
                                        keyNameFrom: "birthDate",
                                      ),
                                      20.verticalSpace,
                                      BlocConsumer<SpouseCubit, SpouseState>(
                                        listener: (context, state) {
                                          if (state is SpouseLoadingState) {
                                            ViewsToolbox.showLoading();
                                          } else if (state
                                              is SpouseErrorState) {
                                            ViewsToolbox.dismissLoading();
                                          }
                                          if (state is SpouseErrorState) {
                                          } else if (state
                                              is SpouseStatusReadyState) {
                                            ViewsToolbox.dismissLoading();

                                            maritalStatus =
                                                state.response.data ?? [];
                                          }
                                        },
                                        buildWhen: (previous, current) =>
                                            current is SpouseStatusReadyState,
                                        builder: (context, state) {
                                          return CustomDropDownField(
                                            initialValue: spouseEntity?.status,
                                            labelAboveField:
                                                context.tr('maritalStatus'),
                                            keyName: 'maritalStatus',
                                            labelText:
                                                context.tr('maritalStatus'),
                                            disableSearch: true,
                                            items: maritalStatus.map((status) {
                                              return DropdownMenuItem<
                                                  LookUpEntity>(
                                                value: status,
                                                child:
                                                    AppText(text: status.name),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ),
                                      20.verticalSpace,
                                      CustomSingleRangeDatePicker(
                                        initialDate:  spouseEntity?.statusDate != null
                                            ? DateFormat('dd/MM/yyyy').parse(
                                                spouseEntity!.statusDate!)
                                            : null,
                                        lastDate: DateTime.now(),
                                        validator: (p0) {
                                          if (p0 == null) {
                                            return context
                                                .tr("please_select_date");
                                          }
                                          return null;
                                        },
                                        fromLabelAboveField:
                                            context.tr("marriageDate"),
                                        customFormKey: formKeySpouse,
                                        keyNameFrom: "marriageDate",
                                      ),
                                      40.verticalSpace,
                                      CustomFormFieldWidget(
                                        keyName: "spouseFile",
                                        validator:
                                            FormBuilderValidators.compose([
                                          FormBuilderValidators.required(
                                            errorText: context
                                                .tr("please_select_file"),
                                          ),
                                        ]),
                                        child: FilePickerSection(
                                          keyName: "spouseFile",
                                          customFormKey: formKeySpouse,
                                          title: context.tr(
                                              "mirriageContract/divorceDocument"),
                                          filePickerCubit:
                                              context.read<FilePickerCubit>(),
                                        ),
                                      ),
                                      40.verticalSpace,
                                    ],
                                  ),
                                ),
                                20.verticalSpace,
                              ],
                            ),
                          );
                        }
                        return Container();
                      }),
                    ),
                  ),
                  120.verticalSpace,
                  BlocConsumer<SpouseCubit, SpouseState>(
                    listener: (context, state) {
                      if (state is SpouseErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      } else if (state is SpouseLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is SpouseReadyState) {
                        ViewsToolbox.dismissLoading();
                         
                      }
                      else if ( state is EditSpouseReadyState){
                                                ViewsToolbox.dismissLoading();
                        CustomMainRouter.push(
                          ThankYouRoute(
                            subtitle: 
                                "submitted_successfully_waiting_administrator",
                          ));
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        text: context.tr("submit"),
                        onPressed: () async {
                          if (formKeySpouse.currentState!.saveAndValidate()) {
                            spouseCubit.editSpouse(EditSpouseRequestModel(
                              spouseId: int.parse(spouseEntity?.id ?? '0'),
                           
                       spouseArabicName: formKeySpouse
                                    .currentState?.fields["nameArabic"]?.value
                                    .toString(),
                                spouseEnglishName: formKeySpouse
                                    .currentState?.fields["nameEnglish"]?.value
                                    .toString(),
                                spouseCivilID: formKeySpouse.currentState
                                    ?.fields["civilIDNumber"]?.value
                                    .toString(),
                                spouserBirthDate: formKeySpouse.currentState
                                            ?.fields["birthDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            formKeySpouse.currentState!
                                                .fields["birthDate"]!.value
                                                .toString()))
                                    : null,
                                spouseStatus:  
                                    formKeySpouse.currentState
                                            ?.fields["maritalStatus"]?.value.name
                                           ,
                                spouseStatusDate: formKeySpouse.currentState
                                            ?.fields["marriageDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            formKeySpouse.currentState!
                                                .fields["marriageDate"]!.value
                                                .toString()))
                                    : null,
                                FileExtension:
                                    _getFileExtension( formKeySpouse
                                        .currentState
                                        ?.fields["spouseFile"]
                                        ?.value
                                        .toString() ??
                                        ''),
                                bytes: await _getFileBytes(
                                    XFile( formKeySpouse
                                        .currentState
                                        ?.fields["spouseFile"]
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
            ),
          )),
    );
  }

  String _getFileExtension(String filePath) {
    return path.extension(filePath).replaceFirst(".", "");
  }

  Future<String> _getFileBytes(XFile value) async {
    final bytes = await value.readAsBytes();
    return base64Encode(bytes);
  }
}
