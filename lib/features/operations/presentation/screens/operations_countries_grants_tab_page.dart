import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../di/dependency_init.dart';
import '../cubits/institutions_grants_cubit/institutions_grants_cubit.dart';
import '../widgets/institutions_grants_datatable_widget.dart';
import '../../../shared/widgets/app_text.dart';

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
