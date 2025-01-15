import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/cubits/countries_grants_cubit/countries_grants_cubit.dart';
import 'package:kf_ess_mobile_app/features/operations/presentation/widgets/grants_datatable_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';

class OperationsCountriesGrantsTabPage extends StatelessWidget {
  OperationsCountriesGrantsTabPage({super.key});

  final CountriesGrantsCubit _countriesGrantsCubit =
      getIt<CountriesGrantsCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _countriesGrantsCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: BlocBuilder<CountriesGrantsCubit, CountriesGrantsState>(
          builder: (context, state) {
            if (state is CountriesGrantsLoadingState) {
              ViewsToolbox.showLoading();
            }
            if (state is CountriesGrantsErrorState) {
              ViewsToolbox.dismissLoading();
              return AppText(
                text: state.message,
              );
            } else if (state is CountriesGrantsReadyState) {
              ViewsToolbox.dismissLoading();

              return GrantsDataTable(grantDataList: state.response.data ?? []);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
