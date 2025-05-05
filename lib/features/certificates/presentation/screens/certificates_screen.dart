import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/app_validator.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../../core/routes/route_sevices.dart';
import '../../../../core/routes/routes.gr.dart';
import '../../domain/entities/certificates_entity.dart';
import '../cubits/certificates_cubit.dart';
import '../cubits/generate_certificate_cubit/generate_certificates_cubit.dart';
import '../../../di/dependency_init.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/forms/drop_down_field.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class CertificatesScreen extends StatefulWidget {
  const CertificatesScreen({super.key});

  @override
  State<CertificatesScreen> createState() => _CertificatesScreenState();
}

class _CertificatesScreenState extends State<CertificatesScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final CertificatesCubit certificatesCubit = getIt<CertificatesCubit>();
  final GenerateCertificatesCubit generateCertificatesCubit =
      getIt<GenerateCertificatesCubit>();

      List<CertificatesEntity> certificatesList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("certificates"),
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => certificatesCubit,
            ),
            BlocProvider(
              create: (context) => generateCertificatesCubit,
            ),
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
                          child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  20.verticalSpace,
                                  BlocConsumer<CertificatesCubit,
                                          CertificatesState>(
                                            listener: (context, state) {
                                              if (state
                                                  is CertificatesErrorState) {
                                                ViewsToolbox.dismissLoading();
                                                ViewsToolbox.showErrorAwesomeSnackBar(
                                                    context,
                                                    context.tr(
                                                        state.message!));
                                              }
                                              else if (state is CertificatesLoadingState) {
                                      ViewsToolbox.showLoading();
                                    } 

                                    else if (state
                                                  is CertificatesReadyState) {
                                                ViewsToolbox.dismissLoading();
                                                if (state.response.data == null) {
                                                  ViewsToolbox.showErrorAwesomeSnackBar(
                                                      context,
                                                      context.tr(
                                                          "noDataFound"));
                                                } else {
                                                  certificatesList =
                                                      state.response.data!;
                                                }
                                              }
                                            },
                                      builder: (context, state) {

                                 

                                      return CustomDropDownField<
                                          CertificatesEntity>(
                                        keyName: "certificateType",
                                        labelText:
                                            context.tr("select_certificate"),
                                        disableSearch: true,
                                        disableFiled: false,
                                        labelAboveField:
                                            context.tr("select_certificate"),
                                        onChanged: (
                                          CertificatesEntity?
                                              newSelectedService,
                                        ) {},
                                        items:   certificatesList
                                                .map((CertificatesEntity item) {
                                                return DropdownMenuItem<
                                                    CertificatesEntity>(
                                                  value: item,
                                                  child: AppText(
                                                    text: item.name,
                                                    style:
                                                        AppTextStyle.medium_18,
                                                  ),
                                                );
                                              }).toList(),
                                        itemsSearchable:certificatesList
                                                .map(
                                                  (CertificatesEntity item) =>
                                                      <String,
                                                          CertificatesEntity>{
                                                    item.name!: item,
                                                  },
                                                )
                                                .toList(),
                                        validator:
                                            (CertificatesEntity? value) =>
                                                AppValidator.validatorRequired(
                                          value,
                                          context,
                                        ),
                                      );
                                    
                                  }),
                                  20.verticalSpace,
                                  AppText(
                                    text: context.tr(
                                        "system_will_generate_certificate_of_the_current_month"),
                                    style: AppTextStyle.regular_14,
                                  ),
                                  20.verticalSpace,
                                ],
                              )))),
                  350.verticalSpace,
                  BlocConsumer<GenerateCertificatesCubit,
                      GenerateCertificatesState>(

                        listener:   (context, state) {
                      if (state is GenerateCertificatesLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is GenerateCertificatesErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, context.tr(state.message!));
                      } else if (state is GenerateCertificatesReadyState) {
                        ViewsToolbox.dismissLoading();
                        if (state.response.data == null) {
                           ViewsToolbox.showErrorAwesomeSnackBar(
                            context, context.tr("noDataFound"));
                        }}

                        },
                    builder: (context, state) {
                      if (state is GenerateCertificatesReadyState) {
                        ViewsToolbox.dismissLoading();
                        
                        CustomMainRouter.push(CertificateDetailsRoute(
                            certificatePdf: state.response.data!));
                      }
                      return CustomElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              generateCertificatesCubit.generateCertificate(
                                  _formKey.currentState!
                                      .fields["certificateType"]!.value.id);
                            }
                          },
                          text: context.tr("submit"));
                    },
                  ),
                ],
              )),
        ));
  }
}
