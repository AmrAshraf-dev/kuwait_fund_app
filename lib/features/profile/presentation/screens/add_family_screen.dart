// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/spouse_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/edit_child_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/edit_spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_child_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_spouse_widget.dart';
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
  String? bytes;
  String? selectedStatus;
  AddFamilyScreen({
    super.key,
    this.id,
  });

  @override
  State<AddFamilyScreen> createState() => _AddFamilyScreenState();
}

class _AddFamilyScreenState extends State<AddFamilyScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  int selectedIndex = 0;
  void onRadioButtonChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _childCubit.getChild(childModel: ChildRequestModel(id: widget.id));
        _spouseCubit.getSpouse(spouseModel: SpouseRequestModel(id: widget.id));
      }
    });
  }

  final ChildCubit _childCubit = getIt<ChildCubit>();
  final SpouseCubit _spouseCubit = getIt<SpouseCubit>();
  final EditSpouseCubit _editSpouseCubit = getIt<EditSpouseCubit>();
  final EditChildCubit _editChildCubit = getIt<EditChildCubit>();
  ChildModel? childEntity;
  SpouseModel? spouseEntity;
  String? _selectedChildFile;
  String? _selectedSpouseFile;

  final FilePickerFamilyCubit filePickerFamilyCubit =
      getIt<FilePickerFamilyCubit>();

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("addFamilyMember"),
        isBackEnabled: true,
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => _childCubit
                  ..getChild(childModel: ChildRequestModel(id: widget.id))),
            BlocProvider(
                create: (context) => _spouseCubit
                  ..getSpouse(spouseModel: SpouseRequestModel(id: widget.id))),
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
                  child: FormBuilder(
                    key: _formKey,
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
                              ? SizedBox(
                                  height: 500.h,
                                  child: SingleChildScrollView(
                                    child: AddChildWidget(
                                      id: widget.id,
                                      name: widget.name,
                                      civilId: widget.civilId,
                                      birthDate: widget.birthDate,
                                      gender: widget.gender,
                                      disabilityDate: widget.disabilityDate,
                                      disabilityType: widget.disabilityType,
                                      fileExtension: widget.fileExtension,
                                      bytes: widget.bytes,
                                    ),
                                  ),
                                )
                              :
//!/* Spouse Screen */
                              SizedBox(
                                  height: 500.h,
                                  child: SingleChildScrollView(
                                    child: AddSpouseWidget(
                                      id: widget.id,
                                      name: widget.name,
                                      civilID: widget.civilId,
                                      birthDate: widget.birthDate,
                                      maritalStatus: widget.maritalStatus,
                                      maritalDate: widget.maritalDate,
                                      fileExtention: widget.fileExtension,
                                      bytes: widget.bytes,
                                      selectedStatus: widget.selectedStatus,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                56.verticalSpace,
                selectedIndex == 0
                    ?
                    //child
                    CustomElevatedButton(
                        text: context.tr("submit"),
                        onPressed: () async {
                          if (_formKey.currentState!.saveAndValidate()) {
                            print(_formKey.currentState!.value);
                            _editChildCubit.editChild(EditChildRequestModel(
                              childId: int.parse(childEntity?.id ?? '0'),
                              childArabicName: childEntity?.name,
                              childEnglishName: childEntity?.name,
                              childCivilId: childEntity?.civilID,
                              childBirthDate: childEntity?.birthDate != null
                                  ? DateFormat('yyyy-MM-dd').format(
                                      DateFormat('dd/MM/yyyy')
                                          .parse(childEntity!.birthDate!))
                                  : null,
                              fileExtention:
                                  _getFileExtension(_selectedChildFile!),
                              bytes: await _getFileBytes(
                                  XFile(_selectedChildFile!)),
                            ));
                            CustomMainRouter.push(ThankYouRoute(
                              subtitle: context.tr(
                                  "submitted_successfully_waiting_administrator"),
                            ));
                          }
                        },
                      )
                    :
                    //spouse
                    CustomElevatedButton(
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
                                  widget.selectedStatus, //spouseEntity?.status,
                              spouseStatusDate: spouseEntity?.statusDate != null
                                  ? DateFormat('yyyy-MM-dd').format(
                                      DateFormat('dd/MM/yyyy')
                                          .parse(spouseEntity!.statusDate!))
                                  : null,
                              fileExtention:
                                  _getFileExtension(_selectedSpouseFile!),
                              bytes: await _getFileBytes(
                                  XFile(_selectedSpouseFile!)),
                            ));
                            CustomMainRouter.push(ThankYouRoute(
                              subtitle: context.tr(
                                  "submitted_successfully_waiting_administrator"),
                            ));
                          }
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
