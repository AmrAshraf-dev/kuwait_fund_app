import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/experiences_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/experiences_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_button_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/data_with_edit_card.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class WorkScreen extends StatefulWidget {
  const WorkScreen({super.key});

  @override
  State<WorkScreen> createState() => _WorkScreenState();
}

class _WorkScreenState extends State<WorkScreen> {
  @override
  void initState() {
    super.initState();
  }

  final ExperiencesCubit _experiencesCubit = getIt<ExperiencesCubit>();
  List<ExperiencesModel>? experiencesEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myWorkExperience"),
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => _experiencesCubit..getExperiences()),
        ],
        child: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AddButtonWidget(
              //     onPressed: () {
              //       CustomMainRouter.push(AddWorkRoute());
              //     },
              //     title: context.tr("addWorkExperience")),
              14.verticalSpace,
              BlocConsumer<ExperiencesCubit, ExperiencesState>(
                  listener: (context, state) {
                if (state is ExperiencesErrorState) {
                  ViewsToolbox.dismissLoading();
                  
                }
              }, builder: (context, state) {
                if (state is ExperiencesLoadingState) {
                  ViewsToolbox.showLoading();
                }
                  else if ( state is ExperiencesErrorState){

                  ViewsToolbox.dismissLoading();
                  return Center(
                    child: AppText(
                      text: context.tr(state.message!),
                      style: AppTextStyle.medium_14,
                     ),
                  );
                }
                
                
                 else if ( state is ExperiencesEmptyState){

                  ViewsToolbox.dismissLoading();
                  return Center(
                    child: AppText(
                      text: context.tr("noDataFound"),
                      style: AppTextStyle.medium_14,
                     ),
                  );
                }
                
                
                 else if (state is ExperiencesReadyState) {
                  experiencesEntity = state.response.data ?? [];
                  ViewsToolbox.dismissLoading();
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: experiencesEntity?.length ?? 0,
                    separatorBuilder: (context, index) => 10.verticalSpace,
                    itemBuilder: (context, index) {
                      return DataWithEditCard(
                        title: experiencesEntity?[index].employerName ??
                            '', //"ABC - Company Kuwait",
                        subTitle: experiencesEntity?[index].jobTitle ??
                            '', //context.tr("Project Manager"),
                        subTitle2: experiencesEntity?[index].joinDate ?? '',
                        //context.tr("February 2010 - March, 2015,"),
                        withEdit: false,
                        withArrow: true,
                        icon: Assets.svg.work.svg(),
                        onPressed: () {
                          CustomMainRouter.push(AddWorkRoute());
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
