import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/operations/domain/entities/institution_grants_entity.dart';

class InstitutionsGrantsDataTable extends StatelessWidget {
  final List<InstitutionGrantsEntity> grantDataList;

  const InstitutionsGrantsDataTable({super.key, required this.grantDataList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
          columnSpacing: 5.0,
        headingRowHeight: 30.h,
        dataRowMinHeight: 50.h,
        dataRowMaxHeight: 120.h,
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
                    context.tr("count"),
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
                    
                    Text(data.instituteName ?? "", textAlign: TextAlign.start,
                    style:   TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),),
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
