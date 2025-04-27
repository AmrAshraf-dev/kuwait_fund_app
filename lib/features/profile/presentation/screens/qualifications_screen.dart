import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/qualifications_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/qualifications_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_button_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/data_with_edit_card.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class QualificationsScreen extends StatefulWidget {
  const QualificationsScreen({super.key});

  @override
  State<QualificationsScreen> createState() => _QualificationsScreenState();
}

class _QualificationsScreenState extends State<QualificationsScreen> {
  @override
  void initState() {
    super.initState();
  }

  final QualificationsCubit _qualificationsCubit = getIt<QualificationsCubit>();
  List<QualificationsModel>? qualificationsEntity;

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myQualification"),
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => _qualificationsCubit..getQualifications()),
        ],
        child: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AddButtonWidget(
              //     onPressed: () {
              //       CustomMainRouter.push(AddQualificationRoute());
              //     },
              //     title: context.tr("addQualification")),
              14.verticalSpace,
              BlocConsumer<QualificationsCubit, QualificationsState>(
                  listener: (context, state) {
                if (state is QualificationsErrorState) {
                  ViewsToolbox.dismissLoading();
                  ViewsToolbox.showErrorAwesomeSnackBar(
                      context, state.message!);
                }
              }, builder: (context, state) {
                if (state is QualificationsLoadingState) {
                  ViewsToolbox.showLoading();
                } else   if (state is QualificationsErrorState) {
                 return Center(
                    child: AppText(
                      text: state.message ?? "",
                      style: AppTextStyle.medium_14,
                    ),
                  );
                }

                
                
                  else if (state is QualificationsEmptyState) {
                  ViewsToolbox.dismissLoading();
                  return Center(
                    child: AppText(
                      text: context.tr("noDataFound"),
                      style: AppTextStyle.medium_14,
                    ),
                  );
                }
                
                
                
                else if (state is QualificationsReadyState) {
                  qualificationsEntity = state.response.data ?? [];
                  ViewsToolbox.dismissLoading();
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: qualificationsEntity?.length ?? 0,
                    separatorBuilder: (context, index) => 10.verticalSpace,
                    itemBuilder: (context, index) {
                      return DataWithEditCard(
                        title: qualificationsEntity?[index].educationName ??
                            '', //"Bachelor of Computer Science",
                        subTitle: qualificationsEntity?[index].graduationDate ??
                            '', //"March, 2015",
                        withArrow: true,
                        withEdit: false,
                        icon: Assets.svg.qualification.svg(),
                        onPressed: () {
                          CustomMainRouter.push(AddQualificationRoute());
                        },
                      );
                    },
                  );
                }
                return Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
