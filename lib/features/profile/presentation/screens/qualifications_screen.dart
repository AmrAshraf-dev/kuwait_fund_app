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

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myQualification"),
      isBackEnabled: true,
      widget: Padding(
        padding:
        EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddButtonWidget(onPressed: (){
              CustomMainRouter.push(AddQualificationRoute());
            }, title: context.tr("addQualification")),
            14.verticalSpace,
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                separatorBuilder: (context,index) => 10.verticalSpace,
                itemBuilder: (context,index) {
                  return DataWithEditCard(
                    title: "Bachelor of Computer Science",
                    subTitle: "March, 2015",
                    withArrow: true,
                    icon: Assets.svg.qualification.svg(),
                    onPressed: () {
                      CustomMainRouter.push(AddQualificationRoute());
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


