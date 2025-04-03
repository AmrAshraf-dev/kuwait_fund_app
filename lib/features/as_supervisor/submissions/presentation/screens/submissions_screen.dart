import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/app_validator.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/domain/entities/submissions_entity.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/cubits/submissions_cubit.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/submission_filter_bottomsheet.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/submission_item_widget.dart';
import 'package:kf_ess_mobile_app/features/as_supervisor/submissions/presentation/widgets/submission_tabbar_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_type_cubit/request_types_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/tab_cubit/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/forms/drop_down_field.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class SubmissionsScreen extends StatefulWidget {
  const SubmissionsScreen({super.key});

  @override
  State<SubmissionsScreen> createState() => _SubmissionsScreenState();
}

class _SubmissionsScreenState extends State<SubmissionsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final TabCubit _tabCubit = getIt<TabCubit>();
  final SubmissionsCubit _submissionsCubit = getIt<SubmissionsCubit>();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        hasScroll: false,
        screenTitle: context.tr("submissions"),
        widget: BlocProvider(
          create: (context) => _submissionsCubit,
          child: RefreshIndicator(
            onRefresh: () async {
              // BlocProvider.of<RequestsCubit>(context).getRequests(
              //     requestsModel: RequestsRequestModel(
              //         userId: "1", companyId: "1", status: "1"));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      start: 27.w, end: 18.w, top: 21.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomDropDownField<String>(
                        keyName: "a-z",
                        height: 42.h,
                        width: 90.w,
                        labelText: context.tr("a-z"),
                        disableSearch: true,
                        disableFiled: false,
                        onChanged: (
                          String? newSelectedService,
                        ) {},
                        items: <String>[
                          'A',
                          'B',
                          'C',
                          'D',
                          'E',
                          'F',
                          'G',
                          'H',
                          'I',
                          'J',
                          'K',
                          'L',
                          'M',
                          'N',
                          'O',
                          'P',
                          'Q',
                          'R',
                          'S',
                          'T',
                          'U',
                          'V',
                          'W',
                          'X',
                          'Y',
                          'Z'
                        ].map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: AppText(
                              text: item,
                              style: AppTextStyle.medium_18,
                            ),
                          );
                        }).toList(),
                        itemsSearchable: <String>[
                          'A',
                          'B',
                          'C',
                          'D',
                          'E',
                          'F',
                          'G',
                          'H',
                          'I',
                          'J',
                          'K',
                          'L',
                          'M',
                          'N',
                          'O',
                          'P',
                          'Q',
                          'R',
                          'S',
                          'T',
                          'U',
                          'V',
                          'W',
                          'X',
                          'Y',
                          'Z'
                        ]
                            .map(
                              (String item) => <String, String>{
                                item: item,
                              },
                            )
                            .toList(),
                        validator: (String? value) =>
                            AppValidator.validatorRequired(
                          value,
                          context,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ViewsToolbox.showBottomSheet(
                              // height: 1.sh - 200,
                              context: context,
                              customWidget: SubmissionFilterBottomSheet());
                        },
                        child: Container(
                          height: 42.h,
                          width: 42.h,
                          decoration: BoxDecoration(
                            color: Palette.yellow_FBD823,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Assets.svg.filterIcon.svg(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                20.verticalSpace,
                SubmissionTabbarWidget(
                  tabCubit: _tabCubit,
                  tabController: _tabController,
                  submissionsCubit: _submissionsCubit,
                ),
                // Tab Views
                BlocBuilder<SubmissionsCubit, SubmissionsState>(
                  builder: (context, state) {
                    if (state is SubmissionsLoadingState) {
                      ViewsToolbox.showLoading();
                    } else if (state is SubmissionsErrorState) {
                      ViewsToolbox.dismissLoading();
                      ViewsToolbox.showErrorAwesomeSnackBar(
                          context, state.message!);
                    } else if (state is SubmissionsEmptyState) {
                      ViewsToolbox.dismissLoading();
                      return Expanded(
                        child: Center(
                          child: AppText(
                            text: context.tr("no_requests"),
                            style: AppTextStyle.medium_18,
                          ),
                        ),
                      );
                    } else if (state is SubmissionsReadyState) {
                      ViewsToolbox.dismissLoading();

                      return Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: <Widget>[
                            RequestsListViewWidget(
                              requestsList: state.response.data ?? [],
                            ),
                            RequestsListViewWidget(
                              requestsList: state.response.data ?? [],
                            ),
                            RequestsListViewWidget(
                              requestsList: state.response.data ?? [],
                            ),
                            RequestsListViewWidget(
                              requestsList: state.response.data ?? [],
                            ),
                          ],
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class RequestsListViewWidget extends StatelessWidget {
  final List<SubmissionsEntity> requestsList;

  const RequestsListViewWidget({super.key, required this.requestsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requestsList.length,
      itemBuilder: (context, index) {
        return SubmissionItemWidget(submissionsEntity: requestsList[index]);
      },
    );
  }
}
