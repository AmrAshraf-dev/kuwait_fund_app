import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../di/dependency_init.dart';
import '../cubits/countries_grants_cubit/countries_grants_cubit.dart';
import '../widgets/grants_datatable_widget.dart';
import '../../../shared/widgets/app_text.dart';

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
