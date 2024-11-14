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
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

@RoutePage()
class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

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
                            text: context.tr("forget_password"),
                            style: AppTextStyle.bold_24,
                          ),
                        ),
                        8.verticalSpace,
                        AppText(
                          text: context.tr("forget_password_description"),
                          style: AppTextStyle.regular_16,
                          textColor: Palette.gery_6C6D6F,
                        ),
                        19.verticalSpace,
                        FormBuilder(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFieldWidget(
                                  labelAboveField: context.tr("username"),
                                  keyName: "username",
                                  validator: FormBuilderValidators.required(),
                                  textInputAction: TextInputAction.done,
                                ),
                                150.verticalSpace,
                              ],
                            )),
                        // login button
                        Center(
                          child: CustomElevatedButton(
                            text: context.tr("send_otp"),
                            onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                CustomMainRouter.push(
                                    ForgetPassVerifyOtpRoute());
                              }
                            },
                          ),
                        ),

                        10.verticalSpace,

                        CustomElevatedButton(
                            backgroundColor: Colors.transparent,
                            textStyle: AppTextStyle.medium_20,
                            text: context.tr("back"),
                            textColor: Palette.blue_5490EB,
                            onPressed: () {
                              CustomMainRouter.pop();
                            }),
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
          ),
        ));
  }
}
