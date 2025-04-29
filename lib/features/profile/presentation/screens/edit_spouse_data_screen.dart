// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:path/path.dart' as path;

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
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/edit_spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/file_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:share_plus/share_plus.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class EditSpouseDataScreen extends StatefulWidget {
  String? id;
  String? name;
  String? civilID;
  String? birthDate;
  String? maritalStatus;
  String? maritalDate;
  String? fileExtention;
  String? bytes;
  int? selectedStatus;
  EditSpouseDataScreen({
    super.key,
    this.id,
    this.name,
    this.civilID,
    this.birthDate,
    this.maritalStatus,
    this.maritalDate,
    this.fileExtention,
    this.bytes,
    this.selectedStatus,
  });

  @override
  State<EditSpouseDataScreen> createState() => _EditSpouseDataScreenState();
}

class _EditSpouseDataScreenState extends State<EditSpouseDataScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final SpouseCubit _spouseCubit = getIt<SpouseCubit>();
  final EditSpouseCubit _editSpouseCubit = getIt<EditSpouseCubit>();
  final FilePickerFamilyCubit filePickerFamilyCubit =
      getIt<FilePickerFamilyCubit>();
  //selectedStatus;
  // late List<String> _statuses = _statuses = [
  //   context.tr('married'),
  //   context.tr('divorced'),
  //   context.tr('single'),
  // ];
  late List<Map<String, dynamic>> _statuses = _statuses = [
    {'label': context.tr('married'), 'value': 0},
    {'label': context.tr('divorced'), 'value': 1},
    {'label': context.tr('single'), 'value': 2},
  ];

  @override
  void initState() {
    super.initState();
  }

  String? _selectedFile;
  SpouseEntity? spouseEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("editSpouseData"),
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => _spouseCubit
                  ..getSpouse(spouseModel: SpouseRequestModel(id: widget.id))),
            BlocProvider(create: (context) => filePickerFamilyCubit),
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
                  child: FormBuilder(
                    key: _formKey,
                    child: BlocConsumer<SpouseCubit, SpouseState>(
                        listener: (context, state) {
                      if (state is SpouseErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      }
                    }, builder: (context, state) {
                      if (state is SpouseLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is SpouseReadyState) {
                        spouseEntity = state.response.data;
                        ViewsToolbox.dismissLoading();
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              30.verticalSpace,
                              TextFieldWidget(
                                labelAboveField: context.tr("name"),
                                keyName: "name",
                                validator: FormBuilderValidators.required(),
                                textInputAction: TextInputAction.next,
                                initalValue:
                                    spouseEntity?.name ?? '', // "name",
                              ),
                              20.verticalSpace,
                              TextFieldWidget(
                                labelAboveField: context.tr("civilIDNumber"),
                                keyName: "civilIDNumber",
                                validator: FormBuilderValidators.required(),
                                textInputAction: TextInputAction.next,
                                initalValue: spouseEntity?.civilID ??
                                    '', //"civilIDNumber",
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
                                fromLabelAboveField: context.tr("birthDate"),
                                customFormKey: _formKey,
                                keyNameFrom: spouseEntity?.birthDate ??
                                    '', //"birthDate",

                                initialDate: spouseEntity?.birthDate != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .parse(spouseEntity!.birthDate!)
                                    : null,
                              ),
                              40.verticalSpace,
                              DropdownButtonFormField<String>(
                                value: widget.selectedStatus?.toString(),
                                decoration: InputDecoration(
                                  labelText: context.tr('maritalStatus'),
                                  labelStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
                                ),
                                icon: Icon(Icons.keyboard_arrow_down_rounded,
                                    color: Colors.grey),
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                dropdownColor: Colors.white,
                                items: _statuses.map((status) {
                                  return DropdownMenuItem<String>(
                                    value: status['value'].toString(),
                                    child: AppText(
                                      text: status['label'],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    widget.selectedStatus = int.tryParse(newValue ?? '');
                                  });
                                },
                              ),

                              20.verticalSpace,
                              CustomSingleRangeDatePicker(
                                fromLabelAboveField: context.tr("marriageDate"),
                                customFormKey: _formKey,
                                keyNameFrom: "marriageDate",
                                initialDate: spouseEntity?.statusDate != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .parse(spouseEntity!.statusDate!)
                                    : null,
                              ),
                              40.verticalSpace,
                              FilePicker(
                                  filePickerFamilyCubit: filePickerFamilyCubit,
                                  onFileSelected: (filePath) => setState(() {
                                        _selectedFile = filePath;
                                      })),

                              40.verticalSpace,
                            ],
                          ),
                        );
                      }
                      return Container();
                    }),
                  ),
                ),
                120.verticalSpace,
                BlocConsumer<EditSpouseCubit, EditSpouseState>(
                  listener: (context, state) {
                    if (state is EditSpouseErrorState) {
                      ViewsToolbox.dismissLoading();
                      ViewsToolbox.showErrorAwesomeSnackBar(
                          context, state.message!);
                    } else if (state is EditSpouseLoadingState) {
                      ViewsToolbox.showLoading();
                    } else if (state is EditSpouseReadyState) {
                      ViewsToolbox.dismissLoading();
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      text: context.tr("submit"),
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          print(_formKey.currentState!.value);
                          _editSpouseCubit.editSpouse(EditSpouseRequestModel(
                            spouseId: int.parse(spouseEntity?.id ?? '0'),
                            spouseArabicName: spouseEntity?.name,
                            spouseEnglishName: spouseEntity?.name,
                            spouseCivilID: spouseEntity?.civilID,
                            spouserBirthDate: spouseEntity?.birthDate != null
                                ? DateFormat('yyyy-MM-dd').format(
                                    DateFormat('dd/MM/yyyy')
                                        .parse(spouseEntity!.birthDate!))
                                : null,
                            spouseStatus:
                                widget.selectedStatus ?? null, //spouseEntity?.status,
                            spouseStatusDate: spouseEntity?.statusDate != null
                                ? DateFormat('yyyy-MM-dd').format(
                                    DateFormat('dd/MM/yyyy')
                                        .parse(spouseEntity!.statusDate!))
                                : null,
                            fileExtention: _getFileExtension(_selectedFile!),
                            bytes: await _getFileBytes(XFile(_selectedFile!)),
                          ));
                          CustomMainRouter.push(ThankYouRoute(
                            subtitle: context.tr(
                                "submitted_successfully_waiting_administrator"),
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
