// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/request/child_request_model.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/child_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/child_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/single_date_picker.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/text_field_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class EditChildDataScreen extends StatefulWidget {
  String? id;
  EditChildDataScreen({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<EditChildDataScreen> createState() => _EditChildDataScreenState();
}

class _EditChildDataScreenState extends State<EditChildDataScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  final ChildCubit _childCubit = getIt<ChildCubit>();
  ChildModel? childEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("editChildData"),
        widget: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => _childCubit
                  ..getChild(childModel: ChildRequestModel(id: widget.id))),
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
                    child: BlocConsumer<ChildCubit, ChildState>(
                        listener: (context, state) {
                      if (state is ChildErrorState) {
                        ViewsToolbox.dismissLoading();
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, state.message!);
                      }
                    }, builder: (context, state) {
                      if (state is ChildLoadingState) {
                        ViewsToolbox.showLoading();
                      } else if (state is ChildReadyState) {
                        childEntity = state.response.data;
                        ViewsToolbox.dismissLoading();
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              30.verticalSpace,
                              TextFieldWidget(
                                labelAboveField: context.tr("name"),
                                keyName: "name",
                                validator: FormBuilderValidators.required(),
                                textInputAction: TextInputAction.next,
                                initalValue: childEntity?.name ?? '',
                              ),
                              20.verticalSpace,
                              TextFieldWidget(
                                labelAboveField: context.tr("civilIDNumber"),
                                keyName: "civilIDNumber",
                                validator: FormBuilderValidators.required(),
                                textInputAction: TextInputAction.next,
                                initalValue: childEntity?.civilID ?? '',
                              ),
                              20.verticalSpace,
                              // CustomSingleRangeDatePicker(
                              //   fromLabelAboveField:
                              //       context.tr("residencyExpiryDate"),
                              //   customFormKey: _formKey,
                              //   keyNameFrom: "residencyExpiry",
                              // ),
                              20.verticalSpace,
                              CustomSingleRangeDatePicker(
                                fromLabelAboveField: context.tr("birthDate"),
                                customFormKey: _formKey,
                                keyNameFrom: "birthDate",
                                initialDate: childEntity?.birthDate != null
                                    ? DateFormat('dd/MM/yyyy')
                                        .parse(childEntity!.birthDate!)
                                    : null,
                              ),
                              40.verticalSpace,
                            ],
                          ),
                        );
                      }
                      return Container();
                    }),
                  ),
                ),
                120.verticalSpace,
                CustomElevatedButton(
                  text: context.tr("submit"),
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value);
                      CustomMainRouter.push(ThankYouRoute(
                        subtitle: context
                            .tr("submitted_successfully_waiting_administrator"),
                      ));
                    }
                  },
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ));
  }
}
