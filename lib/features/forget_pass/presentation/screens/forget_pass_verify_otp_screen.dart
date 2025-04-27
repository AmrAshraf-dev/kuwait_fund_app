import 'dart:async';

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
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

@RoutePage()
class ForgetPassVerifyOtpScreen extends StatefulWidget {
  const ForgetPassVerifyOtpScreen({super.key});

  @override
  State<ForgetPassVerifyOtpScreen> createState() =>
      _ForgetPassVerifyOtpScreenState();
}

class _ForgetPassVerifyOtpScreenState extends State<ForgetPassVerifyOtpScreen> {
  final ForgetPassCubit forgetPassCubit = getIt<ForgetPassCubit>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late int _timerSeconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timerSeconds = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
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
                                      maxLength: 5,
                                      labelAboveField: context.tr("enter_otp"),
                                      keyName: "otp",
                                      textInputAction: TextInputAction.done,
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.numeric(),
                                      ]),
                                    ),
                                    20.verticalSpace,
                                    Wrap(
                                      runSpacing: 10,
                                      children: [
                                        AppText(
                                          text:
                                              context.tr("did_not_receive_otp"),
                                          style: AppTextStyle.medium_16,
                                          textColor: Palette.gery_6C6D6F,
                                        ),
                                        5.horizontalSpace,
                                        if (_timerSeconds == 0)
                                          BlocListener<ForgetPassCubit,
                                              ForgetPassState>(
                                            listener: (context, state) {
                                              if (state
                                                  is ForgetPassLoadingState) {
                                                ViewsToolbox.showLoading();
                                              } else if (state
                                                  is ForgetPassErrorState) {
                                                ViewsToolbox.dismissLoading();
                                                ViewsToolbox
                                                    .showErrorAwesomeSnackBar(
                                                        context,
                                                        context.tr(state.message!));
                                              } else if (state
                                                  is ForgetPassReadyState) {
                                                ViewsToolbox.dismissLoading();
                                                ViewsToolbox
                                                    .showSuccessAwesomeSnackBar(
                                                        context,
                                                        context.tr(
                                                            "otp_sent_successfully"));
                                              }
                                            },
                                            child: InkWell(
                                              onTap: () {
                                                forgetPassCubit.getForgetPass(
                                                  withNavigation: false,
                                                  forgetPassModel:
                                                      ForgetPassRequestModel(
                                                    userName: forgetPassCubit
                                                        .userName,
                                                  ),
                                                );
                                                _startTimer();
                                              },
                                              child: AppText(
                                                text: context.tr("resend_otp"),
                                                style: AppTextStyle.medium_16,
                                                textColor: Palette.blue_5490EB,
                                              ),
                                            ),
                                          )
                                        else
                                          AppText(
                                            text: "${_timerSeconds}s",
                                            style: AppTextStyle.medium_16,
                                            textColor: Palette.gery_6C6D6F,
                                          ),
                                      ],
                                    ),
                                    130.verticalSpace,
                                    // MediaQuery.of(context).viewInsets.bottom == 0
                                    //     ? 150.verticalSpace
                                    //     : 10.verticalSpace,
                                    Center(
                                      child: BlocListener<ForgetPassCubit,
                                          ForgetPassState>(
                                        listener: (context, state) {
                                          if (state is ForgetPassLoadingState) {
                                            ViewsToolbox.showLoading();
                                          } else if (state
                                              is ForgetPassVerifyOTPErrorState) {
                                            ViewsToolbox.dismissLoading();
                                            ViewsToolbox
                                                .showErrorAwesomeSnackBar(
                                                    context, context.tr(state.message!));
                                          } else if (state
                                              is ForgetPassVerifyOTPReadyState) {
                                            ViewsToolbox.dismissLoading();
                                            CustomMainRouter.push(
                                                ResetPassRoute());
                                          }
                                        },
                                        child: CustomElevatedButton(
                                          text:
                                              context.tr("verify_and_proceed"),
                                          onPressed: () {
                                            if (_formKey.currentState
                                                    ?.saveAndValidate() ??
                                                false) {
                                              forgetPassCubit.getVerifyOtp(
                                                  forgetPassModel:
                                                      ForgetPassRequestModel(
                                                userName:
                                                    forgetPassCubit.userName,
                                                otp: _formKey.currentState
                                                    ?.fields["otp"]?.value,
                                              ));
                                            }
                                          },
                                        ),
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
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom /
                                        2)),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
