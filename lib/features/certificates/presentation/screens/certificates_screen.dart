import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/certificates/domain/entities/certificates_entity.dart';
import 'package:kf_ess_mobile_app/features/certificates/presentation/cubits/certificates_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("certificates"),
        widget: BlocProvider(
          create: (context) => certificatesCubit,
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
                                  BlocBuilder<CertificatesCubit,
                                          CertificatesState>(
                                      builder: (context, state) {
                                    if (state is CertificatesLoadingState) {
                                      ViewsToolbox.showLoading();
                                    } else if (state
                                        is CertificatesErrorState) {
                                      ViewsToolbox.dismissLoading();
                                      ViewsToolbox.showErrorAwesomeSnackBar(
                                          context, state.message!);
                                    } else if (state
                                        is CertificatesReadyState) {
                                      ViewsToolbox.dismissLoading();

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
                                        items: state.response.data == null
                                            ? []
                                            : state.response.data!
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
                                        itemsSearchable: state.response.data ==
                                                null
                                            ? []
                                            : state.response.data!
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
                                    }
                                    return Container();
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
                  CustomElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.saveAndValidate()) {
                          print(_formKey.currentState!.value);
                          CustomMainRouter.push(CertificateDetailsRoute());
                        }
                      },
                      text: context.tr("submit")),
                ],
              )),
        ));
  }
}
