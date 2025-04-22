import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/requests_cubit/requests_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/request_item_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/requests_header_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final RequestsCubit _requestCubit = getIt<RequestsCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      hasScroll: false,
      isBackEnabled: false,
      screenTitle: context.tr("my_requests"),
      appBarHeight: 90.h,
      widget: BlocProvider(
        create: (context) => _requestCubit..getRequests(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RequestsHeaderWidget(),
            20.verticalSpace,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: BlocBuilder<RequestsCubit, RequestsState>(
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
                      List<RequestsEntity> requestsList =
                          state.response.data ?? [];
                      ViewsToolbox.dismissLoading();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: requestsList.length,
                        itemBuilder: (context, index) {
                          return RequestItemWidget(
                            request: requestsList[index],
                            requestsCubit: _requestCubit,
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ))
          ],
        ),
      ),
    );
  }
}
