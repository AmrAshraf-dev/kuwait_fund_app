import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../di/dependency_init.dart';
import '../cubits/contributions_cubit/contributions_cubit.dart';
import '../widgets/contributions_datatable_widget.dart';
import '../../../shared/widgets/app_text.dart';

class OperationsContributionsTabPage extends StatelessWidget {
  OperationsContributionsTabPage({super.key});

  final ContributionsCubit _contributionsCubit = getIt<ContributionsCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _contributionsCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: BlocBuilder<ContributionsCubit, ContributionsState>(
          builder: (context, state) {
            if (state is ContributionsLoadingState) {
              ViewsToolbox.showLoading();
            }
            if (state is ContributionsErrorState) {
              ViewsToolbox.dismissLoading();
              return Center(
                child: AppText(
                  text: context.tr(state.message??"someThingWentWrong"),
                ),
              );
            } else if (state is ContributionsReadyState) {
              ViewsToolbox.dismissLoading();

              return ContributionsDataTable(
                  grantDataList: state.response.data ?? []);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
