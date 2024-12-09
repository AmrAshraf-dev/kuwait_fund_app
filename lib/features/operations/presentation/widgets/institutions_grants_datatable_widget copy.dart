import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/contribution_entity.dart';

class ContributionsDataTable extends StatelessWidget {
  final List<ContributionEntity> grantDataList;

  const ContributionsDataTable({super.key, required this.grantDataList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 10.0,
        headingRowHeight: 30,
        dataRowMinHeight: 50,
        dataRowMaxHeight: 100.h,
        headingRowColor: WidgetStateProperty.resolveWith<Color>(
            (states) => Palette.primaryColor),
        columns: [
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                context.tr("institution"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: SizedBox(
                width: 90,
                child: Center(
                  child: Text(
                    context.tr("number_of_grants"),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )),
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                context.tr("value"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              )),
        ],
        rows: grantDataList
            .map(
              (data) => DataRow(
                cells: [
                  DataCell(
                    Text(data.committedAmount ?? "",
                        textAlign: TextAlign.start),
                  ),
                  DataCell(Center(child: Text(data.foundationName.toString()))),
                  DataCell(Text(data.paidUpAmount.toString())),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
