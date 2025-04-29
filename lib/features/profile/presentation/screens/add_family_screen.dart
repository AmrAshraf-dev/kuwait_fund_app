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
import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_file_picker_section_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/spouse_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/edit_child_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/edit_spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_child_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_spouse_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/file_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/child_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/radio_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class AddFamilyScreen extends StatefulWidget {
  String? id;
  String? name;
  String? civilId;
  String? birthDate;
  String? gender;
  String? disabilityDate;
  String? disabilityType;
  String? maritalStatus;
  String? maritalDate;
  String? fileExtension;
  //String? selectedStatus;
  // String? _selectedChildFile;
  // String? _selectedSpouseFile;
  AddFamilyScreen({
    super.key,
    this.id,
  });

  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {
  //final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  int selectedIndex = 0;
  void onRadioButtonChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final GlobalKey<FormBuilderState> _formKeyChild =
      GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _formKeySpouse =
      GlobalKey<FormBuilderState>();

  String? _selectedGenderStatus;
  late List<String> _genderStatuses = _genderStatuses = [
    context.tr('male'),
    context.tr('female'),
  ];
  String? _selectedDisabilityStatus;

  late List<String> _genderDisabilityStatuses = _genderDisabilityStatuses = [
    'type1',
    'type2',
    'type3',
  ];

  final ChildCubit _childCubit = getIt<ChildCubit>();
  String? selectedChildFile;
  String? selectedSpouseFile;
  final FilePickerCubit filePickerFamilyCubit = getIt<FilePickerCubit>();
  ChildModel? childEntity;
  //?
  //
  //
  final SpouseCubit _spouseCubit = getIt<SpouseCubit>();

  late List<Map<String, dynamic>> _statuses = _statuses = [
    {'label': context.tr('married'), 'value': 0},
    {'label': context.tr('divorced'), 'value': 1},
    {'label': context.tr('single'), 'value': 2},
  ];
  int? selectedStatus;
  SpouseEntity? spouseEntity;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (mounted) {
    //     _childCubit.getChild(childModel: ChildRequestModel(id: widget.id));
    //     _spouseCubit.getSpouse(spouseModel: SpouseRequestModel(id: widget.id));
    //   }
    // });
  }

  //final ChildCubit _childCubit = getIt<ChildCubit>();
  //final SpouseCubit _spouseCubit = getIt<SpouseCubit>();
  final EditSpouseCubit _editSpouseCubit = getIt<EditSpouseCubit>();
  final EditChildCubit _editChildCubit = getIt<EditChildCubit>();
  //ChildModel? childEntity;
  //SpouseModel? spouseEntity;

  // final FilePickerFamilyCubit filePickerFamilyCubit =
  // getIt<FilePickerFamilyCubit>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("addFamilyMember"),
        isBackEnabled: true,
        widget: MultiBlocProvider(
          providers: [
            // BlocProvider(
            //     create: (context) => _childCubit
            //       ..getChild(childModel: ChildRequestModel(id: widget.id))),
            // BlocProvider(
            //     create: (context) => _spouseCubit
            //       ..getSpouse(spouseModel: SpouseRequestModel(id: widget.id))),
            BlocProvider(create: (context) => filePickerFamilyCubit),
            BlocProvider(create: (context) => _editChildCubit),
            BlocProvider(create: (context) => _editSpouseCubit),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        30.verticalSpace,
                        // TODO refactor this widget
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioButtonWidget(
                              title: context.tr("child"),
                              index: 0,
                              onChanged: onRadioButtonChanged,
                              selectedIndex: selectedIndex,
                            ),
                            20.horizontalSpace,
                            RadioButtonWidget(
                              title: context.tr("spouse"),
                              index: 1,
                              onChanged: onRadioButtonChanged,
                              selectedIndex: selectedIndex,
                            ),
                          ],
                        ),
                        20.verticalSpace,
                        // TextFieldWidget(
                        //   labelAboveField: context.tr("name"),
                        //   keyName: "name",
                        //   validator: FormBuilderValidators.required(),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        // 20.verticalSpace,
                        // TextFieldWidget(
                        //   labelAboveField: context.tr("civilIDNumber"),
                        //   keyName: "civilIDNumber",
                        //   validator: FormBuilderValidators.required(),
                        //   textInputAction: TextInputAction.next,
                        // ),
                        // 20.verticalSpace,
                        // CustomSingleRangeDatePicker(
                        //   fromLabelAboveField: context.tr("residencyExpiryDate"),
                        //   customFormKey: _formKey,
                        //   keyNameFrom: "residencyExpiryDate",
                        // ),
                        // 20.verticalSpace,
                        // CustomSingleRangeDatePicker(
                        //   fromLabelAboveField: context.tr("birthDate"),
                        //   customFormKey: _formKey,
                        //   keyNameFrom: "birthDate",
                        // ),
                        // 40.verticalSpace,
                        selectedIndex == 0
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    FormBuilder(
                                      key: _formKeyChild,
                                      child:
                                          //  BlocConsumer<ChildCubit, ChildState>(
                                          //     listener: (context, state) {
                                          //   if (state is ChildErrorState) {
                                          //     ViewsToolbox.dismissLoading();
                                          //     ViewsToolbox.showErrorAwesomeSnackBar(
                                          //         context, context.tr(state.message!));
                                          //   }
                                          // }, builder: (context, state) {
                                          //   if (state is ChildLoadingState) {
                                          //     ViewsToolbox.showLoading();
                                          //   } else if (state is ChildReadyState) {
                                          //     childEntity = state.response.data;
                                          //     ViewsToolbox.dismissLoading();
                                          //     return
                                          Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextFieldWidget(
                                              labelAboveField:
                                                  context.tr("nameArabic"),
                                              keyName: "nameArabic",
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators
                                                    .required(),
                                                // FormBuilderValidators.alphabetical(),
                                                FormBuilderValidators.minLength(
                                                    3),
                                                FormBuilderValidators.maxLength(
                                                    15),
                                                (value) {
                                                  final arabicRegex = RegExp(
                                                      r'^[\u0600-\u06FF\s]+$');
                                                  if (value == null ||
                                                      !arabicRegex
                                                          .hasMatch(value)) {
                                                    return context.tr(
                                                        "please_enter_valid_arabic_name");
                                                  }
                                                  return null;
                                                },
                                              ]),

                                              textInputAction:
                                                  TextInputAction.next,
                                              // initalValue: childEntity?.name ?? '',
                                            ),
                                            20.verticalSpace,
                                            TextFieldWidget(
                                              labelAboveField:
                                                  context.tr("nameEnglish"),
                                              keyName: "nameEnglish",
                                              validator: FormBuilderValidators
                                                  .required(),
                                              textInputAction:
                                                  TextInputAction.next,
                                              // initalValue: childEntity?.name ?? '',
                                            ),
                                            20.verticalSpace,

                                            TextFieldWidget(
                                              labelAboveField:
                                                  context.tr("civilIDNumber"),
                                              keyName: "civilIDNumber",
                                              validator: FormBuilderValidators
                                                  .required(),
                                              textInputAction:
                                                  TextInputAction.next,
                                              //  initalValue: childEntity?.civilID ?? '',
                                            ),
                                            //  20.verticalSpace,
                                            // CustomSingleRangeDatePicker(
                                            //   fromLabelAboveField:
                                            //       context.tr("residencyExpiryDate"),
                                            //   customFormKey: _formKey,
                                            //   keyNameFrom: "residencyExpiry",
                                            // ),

                                            20.verticalSpace,
                                            CustomSingleRangeDatePicker(
                                              validator: (p0) {
                                                if (p0 == null) {
                                                  return context
                                                      .tr("please_select_date");
                                                }
                                                return null;
                                              },
                                              fromLabelAboveField:
                                                  context.tr("birthDate"),
                                              customFormKey: _formKeyChild,
                                              keyNameFrom: "birthDate",
                                              //   initialDate: childEntity?.birthDate != null
                                              //       ? DateFormat('dd/MM/yyyy')
                                              //           .parse(childEntity!.birthDate!)
                                              //       : null,
                                            ),
                                            40.verticalSpace,
                                            //?GENDER
                                            DropdownButtonFormField<String>(
                                                value: _selectedGenderStatus,
                                                decoration: InputDecoration(
                                                  labelText:
                                                      context.tr('gender'),
                                                  labelStyle: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 14),
                                                ),
                                                icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: Colors.grey),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                                dropdownColor: Colors.white,
                                                items: _genderStatuses
                                                    .map((String status) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: status,
                                                    child: AppText(
                                                      text: status[0]
                                                              .toUpperCase() +
                                                          status.substring(1),
                                                      //  style: TextStyle(fontSize: 16),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _selectedGenderStatus =
                                                        newValue;
                                                  });
                                                }),
                                            20.verticalSpace,
                                            //?DISABILITY datepicker
                                            CustomSingleRangeDatePicker(
                                              fromLabelAboveField:
                                                  context.tr("disabilityDate"),
                                              customFormKey: _formKeyChild,
                                              keyNameFrom: "disabilityDate",
                                              // initialDate: childEntity?.childDisabilityDate !=
                                              //         null
                                              //     ? DateFormat('dd/MM/yyyy')
                                              //         .parse(childEntity!.childDisabilityDate!)
                                              //     : null,
                                            ),
                                            40.verticalSpace,
                                            //?Disability type
                                            DropdownButtonFormField<String>(
                                              value: _selectedDisabilityStatus,
                                              decoration: InputDecoration(
                                                labelText: context
                                                    .tr('disabilityType'),
                                                labelStyle: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                        vertical: 14),
                                              ),
                                              icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: Colors.grey),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                              dropdownColor: Colors.white,
                                              items: _genderDisabilityStatuses
                                                  .map((String status) {
                                                return DropdownMenuItem<String>(
                                                  value: status,
                                                  child: AppText(
                                                    text: status[0]
                                                            .toUpperCase() +
                                                        status.substring(1),
                                                    //  style: TextStyle(fontSize: 16),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  _selectedDisabilityStatus =
                                                      newValue;
                                                });
                                              },
                                            ),
                                            20.verticalSpace,
                                            FilePickerSection(
                                                filePickerCubit:
                                                    filePickerFamilyCubit,
                                                onFileSelected: (filePath) =>
                                                    setState(() {
                                                      selectedChildFile =
                                                          filePath;
                                                    })),
                                          ],
                                        ),
                                      ),
                                      //   }
                                      //   return Container();
                                      // }),
                                    ),
                                  ],
                                ),
                              )
                            :
                            //!/* Spouse Screen */////////////////////////////////////////////////////////////////
                            SizedBox(
                                height: 500.h,
                                child: SingleChildScrollView(
                                  child:
                                      // AddSpouseWidget(
                                      //   id: widget.id,
                                      //   name: widget.name,
                                      //   civilID: widget.civilId,
                                      //   birthDate: widget.birthDate,
                                      //   maritalStatus: widget.maritalStatus,
                                      //   maritalDate: widget.maritalDate,
                                      //   selectedStatus: widget.selectedStatus,
                                      //   selectedSpouseFile:
                                      //       widget._selectedSpouseFile,
                                      // ),
                                      Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h, horizontal: 13.w),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25.r),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: FormBuilder(
                                              key: _formKeySpouse,
                                              child:
                                                  //  BlocConsumer<SpouseCubit, SpouseState>(
                                                  //     listener: (context, state) {
                                                  //   if (state is SpouseErrorState) {
                                                  //     ViewsToolbox.dismissLoading();
                                                  //     ViewsToolbox.showErrorAwesomeSnackBar(
                                                  //         context, context.tr(state.message!));
                                                  //   }
                                                  // }, builder: (context, state) {
                                                  //   if (state is SpouseLoadingState) {
                                                  //     ViewsToolbox.showLoading();
                                                  //   } else if (state is SpouseReadyState) {
                                                  //     spouseEntity = state.response.data;
                                                  //     ViewsToolbox.dismissLoading();
                                                  //     return
                                                  Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    30.verticalSpace,
                                                    TextFieldWidget(
                                                      labelAboveField: context
                                                          .tr("nameArabic"),
                                                      keyName: "nameArabic",
                                                      validator:
                                                          FormBuilderValidators
                                                              .required(),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      // initalValue: spouseEntity?.name ?? '', // "name",
                                                    ),
                                                    20.verticalSpace,
                                                    TextFieldWidget(
                                                      labelAboveField: context
                                                          .tr("nameEnglish"),
                                                      keyName: "nameEnglish",
                                                      validator:
                                                          FormBuilderValidators
                                                              .required(),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      // initalValue: spouseEntity?.name ?? '', // "name",
                                                    ),
                                                    TextFieldWidget(
                                                      labelAboveField: context
                                                          .tr("civilIDNumber"),
                                                      keyName: "civilIDNumber",
                                                      validator:
                                                          FormBuilderValidators
                                                              .required(),
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      // initalValue:
                                                      //     spouseEntity?.civilID ?? '', //"civilIDNumber",
                                                    ),
                                                    20.verticalSpace,
                                                    // CustomSingleRangeDatePicker(
                                                    //   fromLabelAboveField:
                                                    //       context.tr("residencyExpiryDate"),
                                                    //   customFormKey: _formKey,
                                                    //   keyNameFrom: "residencyExpiry",
                                                    // ),
                                                    // 20.verticalSpace,
                                                    CustomSingleRangeDatePicker(
                                                      fromLabelAboveField:
                                                          context
                                                              .tr("birthDate"),
                                                      customFormKey:
                                                          _formKeySpouse,
                                                      keyNameFrom: "birthDate",

                                                      // initialDate: spouseEntity?.birthDate != null
                                                      //     ? DateFormat('dd/MM/yyyy')
                                                      //         .parse(spouseEntity!.birthDate!)
                                                      //     : null,
                                                    ),
                                                    40.verticalSpace,
                                                    DropdownButtonFormField<
                                                        String>(
                                                      value: selectedStatus
                                                          ?.toString(),
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: context.tr(
                                                            'maritalStatus'),
                                                        labelStyle: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16,
                                                                    vertical:
                                                                        14),
                                                      ),
                                                      icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: Colors.grey),
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                      dropdownColor:
                                                          Colors.white,
                                                      // items: _statuses
                                                      //     .map((String status) {
                                                      //   return DropdownMenuItem<
                                                      //       String>(
                                                      //     value: status,
                                                      //     child: AppText(
                                                      //       text: status[0]
                                                      //               .toUpperCase() +
                                                      //           status
                                                      //               .substring(
                                                      //                   1),
                                                      //       //  style: TextStyle(fontSize: 16),
                                                      //     ),
                                                      //   );
                                                      // }).toList(),
                                                      items: _statuses
                                                          .map((status) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          value: status['value']
                                                              .toString(),
                                                          child: AppText(
                                                            text:
                                                                status['label'],
                                                          ),
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          selectedStatus =
                                                              int.tryParse(
                                                                  newValue ??
                                                                      '');
                                                        });
                                                      },
                                                    ),

                                                    20.verticalSpace,
                                                    CustomSingleRangeDatePicker(
                                                      fromLabelAboveField:
                                                          context.tr(
                                                              "marriageDate"),
                                                      customFormKey:
                                                          _formKeySpouse,
                                                      keyNameFrom:
                                                          "marriageDate",
                                                      // initialDate: spouseEntity?.statusDate != null
                                                      //     ? DateFormat('dd/MM/yyyy')
                                                      //         .parse(spouseEntity!.statusDate!)
                                                      //     : null,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          widget.maritalDate =
                                                              value;
                                                        });
                                                      },
                                                    ),
                                                    40.verticalSpace,
                                                    // FilePicker(
                                                    //     filePickerFamilyCubit:
                                                    //         filePickerFamilyCubit,
                                                    //     onFileSelected:
                                                    //         (filePath) =>
                                                    //             setState(() {
                                                    //               selectedSpouseFile =
                                                    //                   filePath;
                                                    //             })),

                                                    40.verticalSpace,
                                                  ],
                                                ),
                                              )
                                              //}
                                              //   return Container();
                                              // }),
                                              ),
                                        ),
                                        20.verticalSpace,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        56.verticalSpace,

                        //?spouse
                        // CustomElevatedButton(
                        //     text: context.tr("submit"),
                        //     onPressed: () async {
                        //       if (_formKeySpouse.currentState!
                        //           .saveAndValidate()) {

                        //         _editSpouseCubit
                        //             .editSpouse(EditSpouseRequestModel(
                        //           spouseId:
                        //               0, //int.parse(spouseEntity?.id ?? '0'),
                        //           spouseArabicName: _formKeySpouse
                        //               .currentState
                        //               ?.fields["arabicName"]
                        //               ?.value
                        //               .toString(),
                        //           spouseEnglishName: _formKeySpouse
                        //               .currentState
                        //               ?.fields["englishName"]
                        //               ?.value
                        //               .toString(),
                        //           spouseCivilID: _formKeySpouse.currentState
                        //               ?.fields["civilIDNumber"]?.value
                        //               .toString(),
                        //           spouserBirthDate: _formKeySpouse
                        //                       .currentState
                        //                       ?.fields["birthDate"]
                        //                       ?.value
                        //                       .toString() !=
                        //                   ''
                        //               ? DateFormat('yyyy-MM-dd').format(
                        //                   DateFormat('yyyy-MM-dd').parse(
                        //                       _formKeySpouse
                        //                           .currentState!
                        //                           .fields["birthDate"]!
                        //                           .value
                        //                           .toString()))
                        //               : null,
                        //           spouseStatus: selectedStatus ?? 0,
                        //           spouseStatusDate: _formKeySpouse
                        //                       .currentState
                        //                       ?.fields["marriageDate"]
                        //                       ?.value
                        //                       .toString() !=
                        //                   ''
                        //               ? DateFormat('yyyy-MM-dd').format(
                        //                   DateFormat('yyyy-MM-dd').parse(
                        //                       _formKeySpouse
                        //                           .currentState!
                        //                           .fields["marriageDate"]!
                        //                           .value
                        //                           .toString()))
                        //               : null,
                        //           fileExtention: _getFileExtension(
                        //               selectedSpouseFile ?? ''),
                        //           bytes: await _getFileBytes(
                        //               XFile(selectedSpouseFile ?? '')),
                        //         ));
                        //         CustomMainRouter.push(ThankYouRoute(
                        //           subtitle: context.tr(
                        //               "submitted_successfully_waiting_administrator"),
                        //         ));
                        //       }
                        //     },
                        //   ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ),
                20.verticalSpace,
                BlocConsumer<EditChildCubit, EditChildState>(
                  listener: (context, state) {
                    if (state is EditChildErrorState) {
                      ViewsToolbox.dismissLoading();
                      ViewsToolbox.showErrorAwesomeSnackBar(
                          context, state.message!);
                    } else if (state is EditChildLoadingState) {
                      ViewsToolbox.showLoading();
                    } else if (state is EditChildReadyState) {
                      ViewsToolbox.dismissLoading();
                      CustomMainRouter.push(ThankYouRoute(
                        subtitle: context
                            .tr("submitted_successfully_waiting_administrator"),
                      ));
                    }
                  },
                  builder: (context, state) {
                    //CHILD
                    return CustomElevatedButton(
                      text: context.tr("submit"),
                      onPressed: () async {
                        if (selectedChildFile == null) {
                          ViewsToolbox.showErrorAwesomeSnackBar(
                              context, context.tr("please_upload_file"));
                          return;
                        }

                        if (_formKeyChild.currentState!.saveAndValidate()) {
                          _editChildCubit.editChild(EditChildRequestModel(
                            childId: 0, // 0 means create
                            childArabicName: _formKeyChild
                                .currentState?.fields["nameArabic"]?.value
                                .toString(),
                            childEnglishName: _formKeyChild
                                .currentState?.fields["nameEnglish"]?.value
                                .toString(), //childEntity?.name,
                            childCivilId: _formKeyChild
                                .currentState?.fields["civilIDNumber"]?.value
                                .toString(), //childEntity?.civilID,
                            childBirthDate: _formKeyChild.currentState
                                        ?.fields["birthDate"]?.value
                                        .toString() !=
                                    ''
                                ? DateFormat('yyyy-MM-dd').format(
                                    DateFormat('dd/MM/yyy').parse(_formKeyChild
                                        .currentState!
                                        .fields["birthDate"]!
                                        .value
                                        .toString()))
                                : null,
                            childDisabilityDate: //disabilityDate
                                _formKeyChild.currentState
                                            ?.fields["disabilityDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            _formKeyChild.currentState!
                                                .fields["disabilityDate"]!.value
                                                .toString()))
                                    : null,
                            childGender: _selectedGenderStatus ?? '',
                            childDisabilityType:
                                _selectedDisabilityStatus ?? '',

                            fileExtention:
                                _getFileExtension(selectedChildFile ?? ''),
                            bytes: await _getFileBytes(
                                XFile(selectedChildFile ?? '')),
                          ));
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
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
