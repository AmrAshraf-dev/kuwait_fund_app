import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/auth_screens_app_bar_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/drawer_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/password_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final FocusNode passwordFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AuthAppBarWidget(),
        drawer: DrawerSideMenu(),
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          42.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 7),
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xfffbd823),
                                      width: 7.0.w,
                                    ),
                                  ),
                                ),
                                child: AppText(
                                  text: context.tr("login"),
                                  style: AppTextStyle.bold_24,
                                ),
                              ),
                              SvgPicture.asset(
                                questionMark,
                                width: 33.w,
                                height: 33.h,
                              ),
                            ],
                          ),
                          8.verticalSpace,
                          AppText(
                            text: context.tr("login_description"),
                            style: AppTextStyle.regular_16,
                            textColor: Palette.gery_6C6D6F,
                          ),
                          50.verticalSpace,
                          FormBuilder(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                TextFieldWidget(
                                  labelAboveField: context.tr("username"),
                                  keyName: "username",
                                  validator: FormBuilderValidators.required(),
                                  textInputAction: TextInputAction.next,
                                ),
                                18.verticalSpace,
                                PasswordFieldWidget(
                                    labelAboveField: context.tr("password"),
                                    keyName: "password",
                                    validator: FormBuilderValidators.required(),
                                    focusNode: passwordFocusNode),
                                46.verticalSpace,
                                // Login button
                                Center(
                                  child: CustomElevatedButton(
                                    text: context.tr("login"),
                                    onPressed: () {
                                      if (_formKey.currentState
                                              ?.saveAndValidate() ??
                                          false) {
                                        CustomMainRouter.push(
                                            NavigationMainRoute());
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            removeWidth: true,
                            onPressed: () =>
                                CustomMainRouter.push(ForgetPassRoute()),
                            backgroundColor: Colors.transparent,
                            customChild: AppText(
                              text: context.tr("forgot_password_ask"),
                              style: AppTextStyle.regular_16,
                              textColor: Palette.gery_6C6D6F,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom /
                                          2)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
