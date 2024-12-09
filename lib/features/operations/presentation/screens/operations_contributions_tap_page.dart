import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/contributions_cubit/contributions_cubit.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/widgets/institutions_grants_datatable_widget%20copy.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class OperationsContributionsTapPage extends StatelessWidget {
  OperationsContributionsTapPage({super.key});

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
              return AppText(
                text: state.message,
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
