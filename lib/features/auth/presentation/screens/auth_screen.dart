import 'dart:developer';
import 'dart:io';
 
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:kf_ess_mobile_app/core/constants/icons.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/services/encryption_service.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/auth/data/models/request/auth_request_model.dart';
import 'package:kf_ess_mobile_app/features/auth/data/models/response/user_info_model.dart';
import 'package:kf_ess_mobile_app/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/data/secured_storage_data.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/auth_screens_app_bar_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/drawer_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/password_field_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';
import 'package:local_auth/local_auth.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final FocusNode passwordFocusNode = FocusNode();
  final LocalAuthentication localAuth = LocalAuthentication();
    final SecuredStorageData securedStorageData = getIt<SecuredStorageData>();

  bool isBiometricAvailable = true;
  final AuthCubit authCubit = getIt<AuthCubit>();
  @override
  void initState() {
    super.initState();
    _checkBiometricAvailability();
  }

 

  Future<void> _checkBiometricAvailability() async {
    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      bool isDeviceSupported = await localAuth.isDeviceSupported();
      if (!canCheckBiometrics || !isDeviceSupported) {
        setState(() {
                 isBiometricAvailable = false;
        });
      }
    } catch (e) {
      log("Error checking biometric availability: $e");
        setState(() {
                 isBiometricAvailable = false;

        });
    }
  }

  Future<void> _authenticateAndLogin() async {
    try {
      bool authenticated = await localAuth.authenticate(
        localizedReason: context.tr("authenticate_to_login"),
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        // Retrieve saved credentials from local storage
        String? savedUserName = await securedStorageData.getUsername();
        String? savedPassword = await securedStorageData.getPassword();

        if (savedUserName != null && savedPassword != null) {
          authCubit.getAuth(
            authModel: AuthRequestModel(
              userId: savedUserName,
              password: savedPassword,
            ),
          );
        } else {
          if(mounted){
          ViewsToolbox.showErrorAwesomeSnackBar(context,
            "no_saved_credentials_please_login_first".tr());
          }
        }
      }
    } catch (e) {
      if(mounted){
   ViewsToolbox.showErrorAwesomeSnackBar(
          context, "authentication_failed_please_login_again".tr());
      }
   
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          true, // Allow the body to adjust when the keyboard appears
      appBar: AuthAppBarWidget(),
      drawer: DrawerSideMenu(),
      body: PopScope(
        canPop: false,
        child: BlocProvider(
          create: (context) => authCubit,
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
                          BlocListener<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthLoadingState) {
                                ViewsToolbox.showLoading();
                              } else if (state is AuthErrorState) {
                                ViewsToolbox.dismissLoading();
                                ViewsToolbox.showErrorAwesomeSnackBar(
                                    context, state.message!);
                              } else if (state is AuthReadyState) {
                                UserInfoModel userInfo =
                                    state.response.data!.userInfo;
                                ViewsToolbox.dismissLoading();
                                if (userInfo.isError ?? false) {
                                  ViewsToolbox.showErrorAwesomeSnackBar(
                                      context, userInfo.errorMsg ?? "error");
                                } else if (userInfo.isDirector ?? false) {
                                  CustomMainRouter.push(
                                      AdminNavigationMainRoute());
                                }
                                
                                else if (userInfo.isSupervisor ?? false) {
                                  CustomMainRouter.push(
                                      SupervisorNavigationMainRoute());
                                }  else {
                                  CustomMainRouter.push(NavigationMainRoute());
                                }
                              }
                            },
                            child: FormBuilder(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFieldWidget(
                                    labelAboveField: context.tr("username"),
                                    keyName: "userName",
                                    validator: FormBuilderValidators.required(),
                                    textInputAction: TextInputAction.next,
                                  ),
                                  18.verticalSpace,
                                  PasswordFieldWidget(
                                    labelAboveField: context.tr("password"),
                                    keyName: "password",
                                    validator: FormBuilderValidators.required(),
                                    focusNode: passwordFocusNode,
                                  ),
                                  46.verticalSpace,
                                  Center(
                                    child: 
                                    Row(
                                      children: [
                                        if(isBiometricAvailable)
 Flexible(
  flex: 1,
   child: CustomElevatedButton(
     backgroundColor:    Palette.blue_5490EB,
    customChild: Icon(
      Icons.fingerprint,
      color: Palette.white,
      size: 40.sp,
    ),
    onPressed: _authenticateAndLogin,
   ),
 ),
10.horizontalSpace,

                                        Flexible(
                                          flex: 4,
                                          child: CustomElevatedButton(
                                          
                                            text: context.tr("login"),
                                            onPressed: () {
                                              if (_formKey.currentState
                                                      ?.saveAndValidate() ??
                                                  false) {
                                                authCubit.getAuth(
                                                  authModel: AuthRequestModel(
                                                    userId: _formKey.currentState
                                                        ?.fields["userName"]?.value,
                                                    password:  
                                              
                                                    EncryptionService().encryptString(
                                                      _formKey.currentState
                                                          ?.fields["password"]?.value,
                                                          Platform.isAndroid ? KeyType.CustomerAuthAndroid : KeyType.CustomerAuthIOS,
                                                    ),
                                                  
                                                    
                                                    
                                                 
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
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
                        ],
                      ),
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
