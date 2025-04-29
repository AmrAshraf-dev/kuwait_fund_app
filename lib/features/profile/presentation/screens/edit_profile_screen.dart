import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/profile_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/domain/entities/main_profile_entity.dart';
 import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/edit_profile_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/profile_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final ProfileCubit _profileCubit = getIt<ProfileCubit>();
  final EditProfileCubit _editProfileCubit = getIt<EditProfileCubit>();
  MainProfileEntity? profileEntity;

  bool _showWidget = false;

  void _toggleWidget() {
    setState(() {
      _showWidget = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("editProfile"),
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => _profileCubit..getProfile()),
            BlocProvider(create: (context) => _editProfileCubit),
          ],
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
            child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
              if (state is ProfileErrorState) {
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
              }
            }, builder: (context, state) {
              if (state is ProfileLoadingState) {
                ViewsToolbox.showLoading();
              } else if (state is ProfileReadyState) {
                profileEntity = state.response.data;
                ViewsToolbox.dismissLoading();
                return Column(
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
                              IgnorePointer(
                                child: TextFieldWidget(
                                  labelAboveField: context.tr("nameArabic"),
                                  keyName: "nameAr",
                                  validator: FormBuilderValidators.required(),
                                  textInputAction: TextInputAction.next,
                                  initalValue:
                                      profileEntity?.profile?.nameArabic ?? '', //"Ali",
                                ),
                              ),
                                 30.verticalSpace,
                              IgnorePointer(
                                child: TextFieldWidget(
                                  labelAboveField: context.tr("nameEnglish"),
                                  keyName: "nameEn",
                                  validator: FormBuilderValidators.required(),
                                  textInputAction: TextInputAction.next,
                                  initalValue:
                                      profileEntity?.profile?.nameEnglish ?? '', //"Ali",
                                ),
                              ),
                              // 20.verticalSpace,
                              // TextFieldWidget(
                              //   labelAboveField: context.tr("jobTitle"),
                              //   keyName: "jobTitle",
                              //   validator: FormBuilderValidators.required(),
                              //   textInputAction: TextInputAction.next,
                              // ),
                              // 20.verticalSpace,
                              // TextFieldWidget(
                              //   labelAboveField: context.tr("email"),
                              //   keyName: "email",
                              //   validator: FormBuilderValidators.required(),
                              //   textInputAction: TextInputAction.next,
                              // ),
                              20.verticalSpace,
                              TextFieldWidget(
                                labelAboveField: context.tr("phoneNumber"),
                                keyName: "phoneNumber",
                                validator: FormBuilderValidators.required(),
                                textInputAction: TextInputAction.next,
                                initalValue:   profileEntity?.profile?.phone1 ??
                                    '', //'+966 123456789',
                              ),
                              20.verticalSpace,

                              if (_showWidget)
                                TextFieldWidget(
                                  labelAboveField: context.tr("phoneNumber"),
                                  keyName: "phoneNumber",
                                  validator: FormBuilderValidators.required(),
                                  textInputAction: TextInputAction.next,
                                  initalValue: profileEntity?.profile?.phone2 ??
                                      '', //'+966 1236655442',
                                ),
                              20.verticalSpace,
                              _showWidget
                                  ? Container()
                                  : GestureDetector(
                                      onTap: _toggleWidget,
                                      child: AppText(
                                        text: context.tr("addNumber"),
                                        style: AppTextStyle.medium_14,
                                        textColor: Palette.blue_5490EB,
                                      ),
                                    ),
                              30.verticalSpace,
                              IgnorePointer(
                                child: TextFieldWidget(
                                  labelAboveField: context.tr("passportNumber"),
                                  keyName: "passportNumber",
                                  validator: FormBuilderValidators.required(),
                                  textInputAction: TextInputAction.next,
                                  initalValue: profileEntity?.profile?.civilID ??
                                      '', //"123456789",
                                ),
                              ),
                              20.verticalSpace,
                              IgnorePointer(
                                child: CustomSingleRangeDatePicker(
                                  fromLabelAboveField:
                                      context.tr("residencyExpiryDate"),
                                  customFormKey: _formKey,
                                  keyNameFrom: "residencyExpiryDate",
                                  initialDate: profileEntity?.profile
                                              ?.recidancyExpiryDate !=
                                          null
                                      ? DateFormat('dd/MM/yyyy').parse(
                                          profileEntity!.profile!.recidancyExpiryDate!)
                                      : DateTime.now(),
                                ),
                              ),
                              60.verticalSpace,
                            ],
                          ),
                        ),
                      ),
                    ),
                    80.verticalSpace,
                    BlocConsumer<EditProfileCubit, EditProfileState>(
                        listener: (context, state) {
                      if (state is EditProfileErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      } else if (state is EditProfileLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is EditProfileReadyState) {
                        ViewsToolbox.dismissLoading();
                      }
                    }, builder: (context, state) {
                      return CustomElevatedButton(
                        text: context.tr("submit"),
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            print(_formKey.currentState!.value);
                            _editProfileCubit
                                .createEditProfile(
                                  ProfileRequestModel(
                              mobile: profileEntity?.profile?.mobile,
                               
                            ));
                            CustomMainRouter.push(ThankYouRoute(
                              subtitle: context.tr(
                                  "submitted_successfully_waiting_administrator"),
                            ));
                          }
                        },
                      );

                      //return Container();
                    }),
                    20.verticalSpace,
                  ],
                );
              }
              return Container();
            }),
          ),
        ));
  }
}
