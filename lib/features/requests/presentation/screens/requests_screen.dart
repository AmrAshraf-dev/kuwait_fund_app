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
import 'package:kf_ess_mobile_app/features/requests/domain/entities/request_type_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/request_types_cubit/requests_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_type_cubit/request_types_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/request_item_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/requests_header_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/cubit/tab_cubit/tab_cubit.dart';
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
  final RequestTypesCubit _requestTypesCubit = getIt<RequestTypesCubit>();

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
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => _requestCubit),
          BlocProvider(create: (context) => _requestTypesCubit),
          BlocProvider(create: (context) => _tabCubit),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RequestsHeaderWidget(),
            20.verticalSpace,
            _buildTabBar(context),
            10.verticalSpace,
            _buildTabViews(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: BlocBuilder<RequestTypesCubit, RequestTypesState>(
        builder: (context, state) {
          if (state is RequestTypesLoading) {
            ViewsToolbox.showLoading();
          } else if (state is RequestTypesLoaded) {
            ViewsToolbox.dismissLoading();

            return BlocBuilder<TabCubit, int>(
              builder: (context, selectedTabIndex) {
                return TabBar(
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsetsDirectional.only(end: 10.w),
                  indicatorColor: Colors.transparent,
                  onTap: (int value) {
                    _tabCubit.changeTab(value);
                    if (value == 0) {
                      _requestCubit.getRequests(
                        requestsModel: RequestsRequestModel(),
                      );
                      return;
                    }
                    _requestCubit.getRequests(
                      requestsModel: RequestsRequestModel(
                          requestTypeID: state.requestTypes[value - 1].id),
                    );
                  },
                  controller: _tabController,
                  isScrollable: true,
                  tabs:
                      _buildTabs(context, selectedTabIndex, state.requestTypes),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

  List<Widget> _buildTabs(BuildContext context, int selectedIndex,
      List<RequestTypeEntity> requestTypes) {
    final tabTitles =
        ["all"] + List.from(requestTypes.map((e) => e.name).toList());

    return List.generate(tabTitles.length, (index) {
      return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 70.w, minHeight: 37.h),
        child: Container(
          decoration: BoxDecoration(
            color:
                selectedIndex == index ? Palette.yellow_FBD823 : Palette.white,
            border: Border.all(
              color: selectedIndex == index
                  ? Palette.yellow_FBD823
                  : Palette.gery_DADADA,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppText(text: context.tr(tabTitles[index])),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTabViews() {
    return BlocBuilder<RequestsCubit, RequestsState>(
      builder: (context, state) {
        if (state is RequestsLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is RequestsErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
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
              children: List.generate(_tabController.length, (index) {
                return RequestsListViewWidget(
                  requestsList: state.response.data ?? [],
                );
              }),
            ),
          );
        }
        return Container();
      },
    );
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
