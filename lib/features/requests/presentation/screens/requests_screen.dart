import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../di/dependency_init.dart';
import '../../domain/entities/requests_entity.dart';
import '../cubits/requests_cubit/requests_cubit.dart';
import '../widgets/request_item_widget.dart';
import '../widgets/requests_header_widget.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key, required this.isBackButtonEnabled});

  final bool isBackButtonEnabled;

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
    final RequestsCubit  requestCubit = getIt<RequestsCubit>();

 @override
  void initState() {
    super.initState();
    requestCubit.getRequests();
  }

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create:  (context) => requestCubit,
        

            child: MasterWidget(
              hasScroll: false,
              isBackEnabled: widget.isBackButtonEnabled,
              screenTitle: context.tr("my_requests"),
              appBarHeight: 90.h,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RequestsHeaderWidget(),
                  20.verticalSpace,
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: BlocConsumer<RequestsCubit, RequestsState>(
                        listener: (context, state) {
                          if (state is RequestsLoadingState) {
                            ViewsToolbox.showLoading();
                          } else if (state is RequestsErrorState) {
                            ViewsToolbox.dismissLoading();
                          }
                        },
                        builder: (context, state) {
                          if (state is RequestsErrorState) {
                            return Center(
                              child: AppText(
                                text: context.tr(state.message!),
                                style: AppTextStyle.medium_18,
                              ),
                            );
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
                                  requestsCubit: context.read<RequestsCubit>(),
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ))
                ],
              ),
            ));
        
  }
}
