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
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/forget_pass/data/models/request/forget_pass_request_model.dart';
import 'package:kf_ess_mobile_app/features/forget_pass/presentation/cubits/forget_pass_cubit.dart';
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
  final ForgetPassCubit forgetPassCubit = getIt<ForgetPassCubit>();
bool _isPasswordObscured = true;
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
        body: BlocProvider(
          create: (context) => forgetPassCubit,
          child: Container(
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
                                      suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordObscured = !_isPasswordObscured;
                                        });
                                      },
                                    ),
                                    obscureText:  _isPasswordObscured,
                                                                        maxLength: 15,

                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.password(
                                        maxLength: 15,
                                        minLength: 3,
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
                                      suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordObscured
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordObscured = !_isPasswordObscured;
                                        });
                                      },
                                    ),
                                    obscureText:  _isPasswordObscured,
                                    maxLength: 15,
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.password(
                                        maxLength: 15,
                                        minLength: 3,
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
                            child:
                                BlocListener<ForgetPassCubit, ForgetPassState>(
                              listener: (context, state) {
                                if (state is ForgetPassLoadingState) {
                                  ViewsToolbox.showLoading();
                                } else if (state is ChangePassErrorState) {
                                  ViewsToolbox.dismissLoading();
                                  ViewsToolbox.showErrorAwesomeSnackBar(
                                      context, context.tr(state.message!));
                                } else if (state is ChangePasswordReadyState) {
                                  ViewsToolbox.dismissLoading();
                                  CustomMainRouter.push(PasswordChangedRoute());
                                }
                              },
                              child: CustomElevatedButton(
                                text: context.tr("change_password"),
                                onPressed: () {
                                  if (_formKey.currentState
                                          ?.saveAndValidate() ??
                                      false) {
                                    forgetPassCubit.changePassword(
                                      forgetPassModel: ForgetPassRequestModel(
                                        userName: forgetPassCubit.userName,
                                        password: _formKey.currentState
                                            ?.fields["new_password"]?.value,
                                      ),
                                    );
                                  }
                                },
                              ),
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
          ),
        ));
  }
}
