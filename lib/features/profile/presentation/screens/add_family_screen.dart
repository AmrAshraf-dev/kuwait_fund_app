// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/edit_spouse_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/spouse_entity.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/child_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/spouse_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_child_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_spouse_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/radio_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_file_picker/custom_file_picker_cubit.dart';
import 'package:path/path.dart' as path;
import 'package:share_plus/share_plus.dart';

import '../../../shared/widgets/master_widget.dart';
 
@RoutePage()
class AddFamilyScreen extends StatefulWidget {
  

  const AddFamilyScreen({
    super.key,
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
      filePickerFamilyCubit.clear();
    });
  }


  final GlobalKey<FormBuilderState> _formKeySpouse =
      GlobalKey<FormBuilderState>();

  final GlobalKey<FormBuilderState> _formKeyChild =
      GlobalKey<FormBuilderState>();

 
  final FilePickerCubit filePickerFamilyCubit = getIt<FilePickerCubit>();
  ChildModel? childEntity;
  SpouseEntity? spouseEntity;
  final SpouseCubit spouseCubit = getIt<SpouseCubit>();
  final ChildCubit childCubit = getIt<ChildCubit>();



  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: context.tr("addFamilyMember"),
        isBackEnabled: true,
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => filePickerFamilyCubit),
            BlocProvider(create: (context) => childCubit..getChildDisabilityTypes()),
            BlocProvider(create: (context) => spouseCubit..getSpouseStatus()),
          ],
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
            child: Column(children: [
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
                      //?CHILD SCREEN
                      selectedIndex == 0
                          ? FormBuilder(
                                    key: _formKeyChild,
                                    child:AddChildWidget(
                                      formKeyChild: _formKeyChild
                                    ))
                          :FormBuilder(child: AddSpouseWidget(
                                formKeySpouse: _formKeySpouse
                          ))
                           

                     ],
                  ),
                ),
              ),
              20.verticalSpace,
              selectedIndex == 0 // means child
                  ? BlocConsumer<ChildCubit, ChildState>(
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
                            subtitle: context.tr(
                                "submitted_successfully_waiting_administrator"),
                          ));
                        }
                      },
                      builder: (context, state) {
                        //CHILD
                        return CustomElevatedButton(
                          text: context.tr("submit"),
                          onPressed: () async {
                  

                            if (_formKeyChild.currentState!.saveAndValidate()) {
                              childCubit.editChild(
                                EditChildRequestModel(
                                childId: 0, // 0 means create
                                childArabicName: _formKeyChild
                                    .currentState?.fields["nameArabic"]?.value
                                    .toString(),
                                childEnglishName: _formKeyChild
                                    .currentState?.fields["nameEnglish"]?.value
                                    .toString(), //childEntity?.name,
                                childCivilId: _formKeyChild.currentState
                                    ?.fields["civilIDNumber"]?.value
                                    .toString(), //childEntity?.civilID,
                                childBirthDate: _formKeyChild.currentState
                                            ?.fields["birthDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            _formKeyChild.currentState!
                                                .fields["birthDate"]!.value
                                                .toString()))
                                    : null,
                                childDisabilityDate: //disabilityDate
                                    _formKeyChild
                                                .currentState
                                                ?.fields["disabilityDate"]
                                                ?.value
                                                .toString() !=
                                            ''
                                        ? DateFormat('yyyy-MM-dd').format(
                                            DateFormat('dd/MM/yyy').parse(
                                                _formKeyChild
                                                    .currentState!
                                                    .fields["disabilityDate"]!
                                                    .value
                                                    .toString()))
                                        : null,
                                childGender:    _formKeyChild.currentState?.fields["gender"]?.value.id,
                                childDisabilityType: _formKeyChild.currentState?.fields["disabilityType"]?.value.name, 
                                    

                                FileExtension:
                                    _getFileExtension(_formKeyChild
                                        .currentState
                                        ?.fields["childBirthCertificate"]
                                        ?.value
                                        .toString() ??
                                        ''),
                                bytes: await _getFileBytes(
                                    XFile( _formKeyChild
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
                    )
                  :

                  //?spouse BUTTON
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
                          
                            if (_formKeySpouse.currentState!
                                .saveAndValidate()) {
                              spouseCubit
                                  .editSpouse(EditSpouseRequestModel(
                                spouseId:
                                    0, //int.parse(spouseEntity?.id ?? '0'),
                                spouseArabicName: _formKeySpouse
                                    .currentState?.fields["nameArabic"]?.value
                                    .toString(),
                                spouseEnglishName: _formKeySpouse
                                    .currentState?.fields["nameEnglish"]?.value
                                    .toString(),
                                spouseCivilID: _formKeySpouse.currentState
                                    ?.fields["civilIDNumber"]?.value
                                    .toString(),
                                spouserBirthDate: _formKeySpouse.currentState
                                            ?.fields["birthDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            _formKeySpouse.currentState!
                                                .fields["birthDate"]!.value
                                                .toString()))
                                    : null,
                                spouseStatus:  
                                    _formKeySpouse.currentState
                                            ?.fields["maritalStatus"]?.value.name
                                           ,
                                spouseStatusDate: _formKeySpouse.currentState
                                            ?.fields["marriageDate"]?.value
                                            .toString() !=
                                        ''
                                    ? DateFormat('yyyy-MM-dd').format(
                                        DateFormat('dd/MM/yyy').parse(
                                            _formKeySpouse.currentState!
                                                .fields["marriageDate"]!.value
                                                .toString()))
                                    : null,
                                FileExtension:
                                    _getFileExtension( _formKeySpouse
                                        .currentState
                                        ?.fields["spouseFile"]
                                        ?.value
                                        .toString() ??
                                        ''),
                                bytes: await _getFileBytes(
                                    XFile( _formKeySpouse
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
            ]),
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
