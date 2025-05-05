import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../../core/routes/route_sevices.dart';
import '../../../../core/routes/routes.gr.dart';
import '../../../../core/utility/palette.dart';
import '../../../di/dependency_init.dart';
import '../../data/models/request/forget_pass_request_model.dart';
import '../cubits/forget_pass_cubit.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/auth_screens_app_bar_widget.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/drawer_widget.dart';
import '../../../shared/widgets/forms/text_field_widget.dart';

@RoutePage()
class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key});

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final ForgetPassCubit forgetPassCubit = getIt<ForgetPassCubit>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, // Allows body to adjust when the keyboard appears
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
                  topRight: Radius.circular(35),
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  42.verticalSpace,
                  Container(
                    padding: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Palette.darkOrange_E09948,
                          width: 7.0.w,
                        ),
                      ),
                    ),
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
                          keyName: "userName",
                          maxLength: 15,
                          validator:      FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.password(
                                        maxLength: 15,
                                        minLength: 3,
                                       
                                      )
                                    ]),
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                  Spacer(), // Pushes buttons to the bottom
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: BlocListener<ForgetPassCubit, ForgetPassState>(
                            listener: (context, state) {
                              if (state is ForgetPassLoadingState) {
                                ViewsToolbox.showLoading();
                              } else if (state is ForgetPassErrorState) {
                                ViewsToolbox.dismissLoading();
                                ViewsToolbox.showErrorAwesomeSnackBar(
                                    context, context.tr(state.message!));
                              } else if (state is ForgetPassReadyState) {
                                ViewsToolbox.dismissLoading();
                                                                if(state.withNavigation) {
                                                                  CustomMainRouter.push(
                                    ForgetPassVerifyOtpRoute());
                                                                }
                              }
                            },
                            child: CustomElevatedButton(
                              text: context.tr("send_otp"),
                              onPressed: () {
                                if (_formKey.currentState?.saveAndValidate() ??
                                    false) {
                                  forgetPassCubit.getForgetPass(
                                    withNavigation: true,
                                      forgetPassModel: ForgetPassRequestModel(
                                    userName: _formKey.currentState
                                        ?.fields["userName"]?.value,
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
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
