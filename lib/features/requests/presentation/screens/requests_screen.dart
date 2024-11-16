import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/enums/request_type_enum.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

@RoutePage()
class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  final TabCubit _tabCubit = getIt<TabCubit>();
  final List<RequestsEntity> allRequests = List.generate(
    58,
    (int index) => RequestsEntity(
      status: "pending",
      date: "12/12/2021",
      type: RequestTypeEnum.annualLeaveRequest.name,
      from: "12/12/2021",
      to: "12/12/2021",
    ),
  );

  final List<RequestsEntity> trainingRequests = List.generate(
    58,
    (int index) => RequestsEntity(
      status: "Pending",
      date: "12/12/2021",
      type: RequestTypeEnum.trainingRequest.name,
      from: "12/12/2021",
      to: "12/12/2021",
    ),
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        hasScroll: false,
        screenTitle: context.tr("my_requests"),
        appBarHeight: 90.h,
        widget: RefreshIndicator(
          onRefresh: () async {
            // BlocProvider.of<RequestsCubit>(context).getRequests(
            //     requestsModel: RequestsRequestModel(
            //         userId: "1", companyId: "1", status: "1"));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: 27.w, end: 18.w, top: 21.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            CustomMainRouter.push(CreateRequestRoute());
                          },
                          child: Container(
                              padding: EdgeInsets.zero,
                              height: 47.h,
                              width: 51.h,
                              decoration: BoxDecoration(
                                color: Palette.primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 45.sp,
                              )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppText(
                          text: context.tr("create_request"),
                          style: AppTextStyle.medium_18,
                          textColor: Palette.primaryColor,
                        )
                      ],
                    ),
                    Container(
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
                    )
                  ],
                ),
              ),
              20.verticalSpace,
              BlocProvider(
                create: (context) => _tabCubit,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.w),
                  child: BlocBuilder<TabCubit, int>(
                      builder: (context, int selectedIndex) {
                    return TabBar(
                      padding: EdgeInsets.zero,
                      //  indicatorPadding: EdgeInsets.zero,
                      labelPadding: EdgeInsetsDirectional.only(end: 10.w),
                      indicatorColor: Colors.transparent,
                      onTap: (value) {
                        _tabCubit.changeTab(value);
                      },
                      //      padding: EdgeInsets.zero,
                      //      indicatorWeight: double.minPositive,
                      //     indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      isScrollable: true,
                      // indicator: BoxDecoration(
                      //   color: Palette.yellow_FBD823,
                      //   border: Border.all(color: Palette.gery_6C6D6F),
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                      tabs: <Widget>[
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? Palette.yellow_FBD823
                                    : Palette.white,
                                border: Border.all(
                                    color: selectedIndex == 0
                                        ? Palette.yellow_FBD823
                                        : Palette.gery_6C6D6F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: AppText(text: context.tr("all")))),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 70.w, minHeight: 37.h),
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? Palette.yellow_FBD823
                                    : Palette.white,
                                border: Border.all(
                                    color: selectedIndex == 1
                                        ? Palette.yellow_FBD823
                                        : Palette.gery_6C6D6F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: AppText(text: context.tr("leave")))),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 100.w, minHeight: 37.h),
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? Palette.yellow_FBD823
                                    : Palette.white,
                                border: Border.all(
                                    color: selectedIndex == 2
                                        ? Palette.yellow_FBD823
                                        : Palette.gery_6C6D6F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: AppText(
                                      text: context.tr("certificate")))),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 100.w, minHeight: 37.h),
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 3
                                    ? Palette.yellow_FBD823
                                    : Palette.white,
                                border: Border.all(
                                    color: selectedIndex == 3
                                        ? Palette.yellow_FBD823
                                        : Palette.gery_6C6D6F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child:
                                      AppText(text: context.tr("training")))),
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 100.w, minHeight: 37.h),
                          child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 4
                                    ? Palette.yellow_FBD823
                                    : Palette.white,
                                border: Border.all(
                                    color: selectedIndex == 4
                                        ? Palette.yellow_FBD823
                                        : Palette.gery_6C6D6F),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child:
                                      AppText(text: context.tr("insurance")))),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              10.verticalSpace,
              // Tab Views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    RequestsListViewWidget(
                      requestsList: allRequests,
                    ),
                    RequestsListViewWidget(requestsList: allRequests),
                    RequestsListViewWidget(requestsList: allRequests),
                    RequestsListViewWidget(requestsList: trainingRequests),
                    RequestsListViewWidget(requestsList: allRequests),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class RequestsListViewWidget extends StatelessWidget {
  final List<RequestsEntity> requestsList;

  const RequestsListViewWidget({super.key, required this.requestsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: requestsList.length,
      itemBuilder: (context, index) {
        return RequestItemWidget(request: requestsList[index]);
      },
    );
  }
}

class RequestItemWidget extends StatelessWidget {
  final RequestsEntity request;

  const RequestItemWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (request.type == RequestTypeEnum.trainingRequest.name) {
          CustomMainRouter.push(TrainingRequestDetailsRoute());
          return;
        } else if (request.type == RequestTypeEnum.annualLeaveRequest.name) {
          CustomMainRouter.push(AnnualLeaveRequestDetailsRoute());
        }
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 27.w, end: 18.w, top: 21.h),
        child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Palette.grey_7B7B7B.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
              color: Palette.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 18.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: request.date,
                        style: AppTextStyle.semiBold_12,
                        textColor: Palette.semiTextGrey,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Palette.orangeDark,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: context.tr(request.status!),
                            textColor: Colors.white,
                            style: AppTextStyle.semiBold_12,
                          ),
                        ),
                      )
                    ],
                  ),
                  11.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: context.tr(request.type!),
                            style: AppTextStyle.bold_16,
                            textColor: Palette.black,
                          ),
                          5.verticalSpace,
                          AppText(
                            text: "${request.from} - ${request.to}",
                            style: AppTextStyle.medium_14,
                            textColor: Palette.black,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.gery_DADADA,
                        size: 20.sp,
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
