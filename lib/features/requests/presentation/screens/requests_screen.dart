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
import 'package:kf_ess_mobile_app/features/requests/data/models/request/requests_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/tab_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/request_item_widget.dart';
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
  final RequestsCubit _requestCubit = getIt<RequestsCubit>();
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
        widget: BlocProvider(
          create: (context) => _requestCubit,
          child: RefreshIndicator(
            onRefresh: () async {
              //TODO: change to the current tap typeId
              _requestCubit.getRequests(
                  requestsModel: RequestsRequestModel(
                typeId: 1,
              ));
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
                          _requestCubit.getRequests(
                              requestsModel: RequestsRequestModel(
                            typeId: value,
                          ));
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
                                          : Palette.gery_DADADA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      AppText(text: context.tr("annual_leave")),
                                ))),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 100.w, minHeight: 37.h),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: selectedIndex == 2
                                      ? Palette.yellow_FBD823
                                      : Palette.white,
                                  border: Border.all(
                                      color: selectedIndex == 2
                                          ? Palette.yellow_FBD823
                                          : Palette.gery_DADADA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      AppText(text: context.tr("sick_leave")),
                                ))),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 100.w, minHeight: 37.h),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: selectedIndex == 3
                                      ? Palette.yellow_FBD823
                                      : Palette.white,
                                  border: Border.all(
                                      color: selectedIndex == 3
                                          ? Palette.yellow_FBD823
                                          : Palette.gery_DADADA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AppText(
                                      text: context.tr("emergency_leave")),
                                ))),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                minWidth: 100.w, minHeight: 37.h),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: selectedIndex == 4
                                      ? Palette.yellow_FBD823
                                      : Palette.white,
                                  border: Border.all(
                                      color: selectedIndex == 4
                                          ? Palette.yellow_FBD823
                                          : Palette.gery_DADADA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                    child: AppText(text: context.tr("loan")))),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                10.verticalSpace,

                // Tab Views
                BlocBuilder<RequestsCubit, RequestsState>(
                  builder: (context, state) {
                    if (state is RequestsLoadingState) {
                      ViewsToolbox.showLoading();
                    } else if (state is RequestsErrorState) {
                      ViewsToolbox.dismissLoading();
                      ViewsToolbox.showErrorAwesomeSnackBar(
                          context, state.message!);
                    } else if (state is RequestsEmptyState) {
                      ViewsToolbox.dismissLoading();
                      return Expanded(
                        child: Center(
                          child: AppText(
                            text: context.tr("no_requests"),
                            style: AppTextStyle.medium_18,
                          ),
                        ),
                      );
                    } else if (state is RequestsReadyState) {
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
