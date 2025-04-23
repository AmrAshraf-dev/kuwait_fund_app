// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'package:kf_ess_mobile_app/features/create_request/presentation/widgets/sick_leave_file_picker_section_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

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
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  final SpouseCubit _spouseCubit = getIt<SpouseCubit>();
  final FilePickerCubit filePickerCubit = getIt<FilePickerCubit>();
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
            BlocProvider(create: (context) => filePickerCubit),
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
                              CustomDropDownField(
                                keyName: spouseEntity?.statusLabel ?? '',
                                labelText: spouseEntity?.statusLabel ?? '',
                                items: [],
                                validator: FormBuilderValidators.required(),
                                initialValue: spouseEntity?.status ??
                                    '', //context.tr('married'),
                              ),
                              20.verticalSpace,
                              CustomSingleRangeDatePicker(
                                fromLabelAboveField: context.tr("marriageDate"),
                                customFormKey: _formKey,
                                keyNameFrom: spouseEntity?.statusDate ??
                                    '', //"birthDate",

                                initialDate: spouseEntity?.statusDate != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .parse(spouseEntity!.statusDate!)
                                    : null,
                              ),
                              40.verticalSpace,
                              // FilePickerSection(
                              //     filePickerCubit: filePickerCubit,
                              //     onFileSelected: (filePath) => setState(() {
                              //           _selectedFile = filePath;
                              //         })),
                              // 40.verticalSpace,
                            ],
                          ),
                        );
                      }
                      return Container();
                    }),
                  ),
                ),
                120.verticalSpace,
                CustomElevatedButton(
                  text: context.tr("submit"),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value);
                      CustomMainRouter.push(ThankYouRoute(
                        subtitle: context
                            .tr("submitted_successfully_waiting_administrator"),
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
}
