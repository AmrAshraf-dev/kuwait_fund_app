// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/profile/data/models/response/family_response_model.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/cubits/family_cubit.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_button_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/data_with_edit_card.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class FamilyScreen extends StatefulWidget {
  String? id;
  FamilyScreen({
    super.key,
    this.id,
  });

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  @override
  void initState() {
    super.initState();
  }

  final FamilyCubit _familyCubit = getIt<FamilyCubit>();
  List<FamilyModel>? familyEntity;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myFamily"),
      isBackEnabled: true,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _familyCubit..getFamily()),
        ],
        child: Padding(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddButtonWidget(
                  onPressed: () {
                    CustomMainRouter.push(AddFamilyRoute());
                  },
                  title: context.tr("addFamilyMember")),
              14.verticalSpace,
              BlocConsumer<FamilyCubit, FamilyState>(
                listener: (context, state) {
                  if (state is FamilyErrorState) {
                    ViewsToolbox.dismissLoading();
                    ViewsToolbox.showErrorAwesomeSnackBar(
                        context, state.message!);
                  }
                },
                builder: (context, state) {
                  if (state is FamilyLoadingState) {
                    ViewsToolbox.showLoading();
                  } else if (state is FamilyReadyState) {
                    familyEntity = state.response.data ?? [];
                    ViewsToolbox.dismissLoading();
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.response.data?.length ?? 0,
                      separatorBuilder: (context, index) => 10.verticalSpace,
                      itemBuilder: (context, index) {
                        return DataWithEditCard(
                          title: familyEntity?[index].name ?? '',
                          subTitle: familyEntity?[index].relation ??
                              '', //context.tr("spouse"),
                          icon: index == 1
                              ? Assets.svg.female.svg()
                              : Assets.svg.male.svg(),
                          onPressed: () {
                            familyEntity?[index].relation == 'S'
                                ? CustomMainRouter.push(EditSpouseDataRoute(
                                    id: familyEntity?[index].id))
                                : CustomMainRouter.push(EditChildDataRoute(
                                    id: familyEntity?[index].id));
                          },
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
