// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/file_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

class AddSpouseWidget extends StatefulWidget {
  String? id;
  String? name;
  String? civilID;
  String? birthDate;
  String? maritalStatus;
  String? maritalDate;
  String? fileExtention;
  String? bytes;
  String? selectedStatus;
  String? selectedSpouseFile;
  AddSpouseWidget({
    Key? key,
    this.id,
    this.name,
    this.civilID,
    this.birthDate,
    this.maritalStatus,
    this.maritalDate,
    this.fileExtention,
    this.bytes,
    this.selectedStatus,
    this.selectedSpouseFile,
  }) : super(key: key);

  @override
  State<AddSpouseWidget> createState() => _AddSpouseWidgetState();
}

class _AddSpouseWidgetState extends State<AddSpouseWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final SpouseCubit _spouseCubit = getIt<SpouseCubit>();
  final FilePickerCubit filePickerFamilyCubit =
      getIt<FilePickerCubit>();
  late List<String> _statuses = _statuses = [
    context.tr('married'),
    context.tr('divorced'),
    context.tr('single'),
  ];

  SpouseEntity? spouseEntity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //     create: (context) => _spouseCubit
        //       ..getSpouse(spouseModel: SpouseRequestModel(id: widget.id))),
        BlocProvider(create: (context) => filePickerFamilyCubit),
        // BlocProvider(create: (context) => _editSpouseCubit),
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
                          // initalValue: spouseEntity?.name ?? '', // "name",
                          onChanged: (value) {
                            setState(() {
                              widget.name = value;
                            });
                          },
                        ),
                        20.verticalSpace,
                        TextFieldWidget(
                          labelAboveField: context.tr("civilIDNumber"),
                          keyName: "civilIDNumber",
                          validator: FormBuilderValidators.required(),
                          textInputAction: TextInputAction.next,
                          // initalValue:
                          //     spouseEntity?.civilID ?? '', //"civilIDNumber",
                          onChanged: (value) {
                            setState(() {
                              widget.civilID = value;
                            });
                          },
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
                          keyNameFrom: "birthDate",
                          onChanged: (value) {
                            setState(() {
                              widget.birthDate = value;
                            });
                          },

                          // initialDate: spouseEntity?.birthDate != null
                          //     ? DateFormat('dd/MM/yyyy')
                          //         .parse(spouseEntity!.birthDate!)
                          //     : null,
                        ),
                        40.verticalSpace,
                        DropdownButtonFormField<String>(
                          value: widget.selectedStatus,
                          decoration: InputDecoration(
                            labelText: context.tr('maritalStatus'),
                            labelStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down_rounded,
                              color: Colors.grey),
                          style: TextStyle(fontSize: 16, color: Colors.black),
                          dropdownColor: Colors.white,
                          items: _statuses.map((String status) {
                            return DropdownMenuItem<String>(
                              value: status,
                              child: AppText(
                                text: status[0].toUpperCase() +
                                    status.substring(1),
                                //  style: TextStyle(fontSize: 16),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              widget.selectedStatus = newValue;
                            });
                          },
                        ),

                        20.verticalSpace,
                        CustomSingleRangeDatePicker(
                          fromLabelAboveField: context.tr("marriageDate"),
                          customFormKey: _formKey,
                          keyNameFrom: "marriageDate",
                          // initialDate: spouseEntity?.statusDate != null
                          //     ? DateFormat('dd/MM/yyyy')
                          //         .parse(spouseEntity!.statusDate!)
                          //     : null,
                          onChanged: (value) {
                            setState(() {
                              widget.maritalDate = value;
                            });
                          },
                        ),
                        40.verticalSpace,
                        // FilePicker(
                        //     filePickerFamilyCubit: filePickerFamilyCubit,
                        //     onFileSelected: (filePath) => setState(() {
                        //           widget.selectedSpouseFile = filePath;
                        //         })),

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
    );
  }
}
