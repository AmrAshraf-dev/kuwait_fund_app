import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/view_toolbox.dart';
import '../../../../core/utility/palette.dart';
import '../../../di/dependency_init.dart';
import '../../../more/presentation/widgets/operations_loan_item_widget.dart';
import '../../domain/entities/loan/loan_entity.dart';
import '../cubits/loan_cubit/loan_cubit.dart';
import '../../../shared/widgets/advanced_expandable_section_widget.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/main_title_widget.dart';

class OperationsLoanTabPage extends StatelessWidget {
  OperationsLoanTabPage({super.key});

  final LoanCubit _loanCubit = getIt<LoanCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loanCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: BlocConsumer<LoanCubit, LoanState>(

          listener:  (context, state) {
              if (state is LoanLoadingState) {
                ViewsToolbox.showLoading();
              }
              if (state is LoanErrorState) {
                ViewsToolbox.dismissLoading();
                ViewsToolbox.showErrorAwesomeSnackBar(
                context,
                state.message!,
                );
              }
              else if (state is LoanReadyState) {
                ViewsToolbox.dismissLoading();
              }
            },
            builder: (context, state) {
               if (state is LoanReadyState) {
 
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: state.response.data!
                      .map((e) => DivisionItem(loanEntity: e))
                      .toList(),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

class DivisionItem extends StatelessWidget {
  final LoanEntity loanEntity;
  const DivisionItem({
    super.key,
    required this.loanEntity,
  });

  @override
  Widget build(BuildContext context) {
    return AdvancedExpandableSection(
        headerPadding:
            const EdgeInsetsDirectional.only(start: 20, top: 20, bottom: 20),
        customText: SizedBox(
            width: 230.w,
            child: MainTitleWidget(title: loanEntity.divisionName,
            fontStyle: AppTextStyle.bold_16,)),
        children: [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.white,
            //   borderRadius: BorderRadius.circular(10.r),
            //   boxShadow: [
            //     BoxShadow(
            //       color: Palette.grey_7B7B7B.withOpacity(0.3),
            //       spreadRadius: 0,
            //       blurRadius: 10,
            //       offset: Offset(0, 2), // changes position of shadow
            //     ),
            //   ],
            //   border: Border.all(color: Palette.gery_DADADA),
            // ),
            child: Column(
                children: loanEntity.loanCountries
                    .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Palette.grey_7B7B7B.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          border: Border.all(color: Palette.gery_DADADA),
                        ),
                        child: OperationsLoanItem(
                          numbers: e.loanSectors
                              .map((e) => e?.number ?? "").toList(),
                              countryName: e.countryName,
                              sectorNames: e.loanSectors
                                  .map((e) => e?.sectorName ?? "")
                                  .toList(),
                              amounts: e.loanSectors
                                  .map((e) => e?.amount ?? "")
                                  .toList(),
                            ),
                      ),
                    ))
                    .toList()),
          ),
        ]);
  }
}
