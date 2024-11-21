import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/add_button_widget.dart';
import 'package:kf_ess_mobile_app/features/profile/presentation/widgets/data_with_edit_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myWorkExperience"),
      isBackEnabled: true,
      widget: Padding(
        padding:
        EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddButtonWidget(onPressed: (){
              CustomMainRouter.push(AddWorkRoute());
            }, title: context.tr("addWorkExperience")),
            14.verticalSpace,
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context,index) => 10.verticalSpace,
                itemBuilder: (context,index) {
                  return DataWithEditCard(
                    title: "ABC - Company Kuwait",
                    subTitle: context.tr("Project Manager"),
                    subTitle2: context.tr("February 2010 - March, 2015,"),
                    withEdit: false,
                    withArrow: true,
                    icon: Assets.svg.work.svg(),
                    onPressed: () {
                      CustomMainRouter.push(AddWorkRoute());
                    },
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}


