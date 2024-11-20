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
class FamilyScreen extends StatefulWidget {
  const FamilyScreen({super.key});

  @override
  State<FamilyScreen> createState() => _FamilyScreenState();
}

class _FamilyScreenState extends State<FamilyScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      screenTitle: context.tr("myFamily"),
      isBackEnabled: true,
      widget: Padding(
        padding:
        EdgeInsets.only(left: 15.w, right: 15.w, top: 14.h, bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddButtonWidget(onPressed: (){
              CustomMainRouter.push(AddFamilyRoute());
            }, title: context.tr("addFamilyMember")),
            14.verticalSpace,
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context,index) => 10.verticalSpace,
                itemBuilder: (context,index) {
                  return DataWithEditCard(
                    title: index == 1 ? "Sara Ali Eid": "Ahmed Mohamed",
                    subTitle: context.tr("spouse"),
                    icon: index == 1 ? Assets.svg.female.svg(): Assets.svg.male.svg(),
                    onPressed: () {
                      CustomMainRouter.push(EditFamilyRoute());
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


