import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/institutions_grants_cubit/institutions_grants_cubit.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/widgets/institutions_grants_datatable_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class OperationsInstitutionsGrantsTabPage extends StatelessWidget {
  OperationsInstitutionsGrantsTabPage({super.key});

  final InstitutionsGrantsCubit _institutionsGrantsCubit =
      getIt<InstitutionsGrantsCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _institutionsGrantsCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: BlocBuilder<InstitutionsGrantsCubit, InstitutionsGrantsState>(
          builder: (context, state) {
            if (state is InstitutionsGrantsLoadingState) {
              ViewsToolbox.showLoading();
            }
            if (state is InstitutionsGrantsErrorState) {
              ViewsToolbox.dismissLoading();
              return AppText(
                text: state.message,
              );
            } else if (state is InstitutionsGrantsReadyState) {
              ViewsToolbox.dismissLoading();

              return InstitutionsGrantsDataTable(
                  grantDataList: state.response.data ?? []);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
