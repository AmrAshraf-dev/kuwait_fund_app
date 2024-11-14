import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/auth_screens_app_bar_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/drawer_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/password_field_widget.dart';

@RoutePage()
class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: DrawerSideMenu(),
        appBar: AuthAppBarWidget(),
        body: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Palette.primaryColor),
          child: Container(
            height: 1.sh,
            decoration: ShapeDecoration(
              color: Palette.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35)),
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  reverse: true,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        42.verticalSpace,
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 7,
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Color(0xfffbd823),
                            width: 7.0.w,
                          ))),
                          child: AppText(
                            text: context.tr("reset_password"),
                            style: AppTextStyle.bold_24,
                          ),
                        ),
                        8.verticalSpace,
                        AppText(
                          text: context.tr("reset_password_description"),
                          style: AppTextStyle.regular_16,
                          textColor: Palette.gery_6C6D6F,
                        ),
                        19.verticalSpace,
                        FormBuilder(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PasswordFieldWidget(
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.password(
                                      maxLength: 12,
                                      minLength: 8,
                                      minNumberCount: 1,
                                      minSpecialCharCount: 1,
                                      minUppercaseCount: 1,
                                    )
                                  ]),
                                  labelAboveField: context.tr("new_password"),
                                  keyName: "new_password",
                                  textInputAction: TextInputAction.next,
                                ),
                                20.verticalSpace,
                                PasswordFieldWidget(
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.password(
                                      maxLength: 12,
                                      minLength: 8,
                                      minNumberCount: 1,
                                      minSpecialCharCount: 1,
                                      minUppercaseCount: 1,
                                    ),
                                    FormBuilderValidators.equal(
                                        errorText:
                                            context.tr("passwords_not_match"),
                                        _formKey
                                                .currentState
                                                ?.fields["new_password"]
                                                ?.value ??
                                            ""),
                                  ]),
                                  labelAboveField:
                                      context.tr("confirm_new_password"),
                                  keyName: "confirm_new_password",
                                  textInputAction: TextInputAction.done,
                                  focusNode: confirmPasswordFocusNode,
                                ),
                                150.verticalSpace,
                              ],
                            )),
                        Center(
                          child: CustomElevatedButton(
                            text: context.tr("change_password"),
                            onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                CustomMainRouter.push(PasswordChangedRoute());
                              }
                            },
                          ),
                        ),
                        10.verticalSpace,
                        CustomElevatedButton(
                            backgroundColor: Colors.transparent,
                            textStyle: AppTextStyle.medium_20,
                            text: context.tr("cancel"),
                            textColor: Palette.blue_5490EB,
                            onPressed: () {
                              CustomMainRouter.push(AuthRoute());
                            }),
                        Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom /
                                        2.5)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
