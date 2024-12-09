import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/country_grants_entity.dart';

class GrantsDataTable extends StatelessWidget {
  final List<CountryGrantsEntity> grantDataList;

  const GrantsDataTable({super.key, required this.grantDataList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columnSpacing: 10.0,
        headingRowHeight: 30,
        headingRowColor: WidgetStateProperty.resolveWith<Color>(
            (states) => Palette.primaryColor),
        columns: [
          DataColumn(
              headingRowAlignment: MainAxisAlignment.center,
              label: Text(
                context.tr("countries"),
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
                    Text(data.countryName ?? "", textAlign: TextAlign.start),
                  ),
                  DataCell(Center(child: Text(data.numberOfGrants.toString()))),
                  DataCell(Text(data.valueOfGrants.toString())),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
