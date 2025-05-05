import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/palette.dart';
import '../../domain/entities/visitor_logs_entity.dart';

class SelectedDayWidget extends StatelessWidget {
  final List<VisitorsLogsEntity>? calendarResponse;
  final DateTime day;

  const SelectedDayWidget({
    Key? key,
    required this.calendarResponse,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String formattedDay = DateFormat("dd/MM/yyyy").format(day);
    final matchingEntries =
        calendarResponse?.where((entry) => entry.date == formattedDay).toList();

    if (matchingEntries != null && matchingEntries.isNotEmpty) {
      final hasRed = matchingEntries.any((entry) => entry.visitType == "Red");
      final hasBlue = matchingEntries.any((entry) => entry.visitType == "Blue");

      return Center(
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: hasBlue ? Palette.blue_3542B9 : Colors.red,
            border: hasRed ? Border.all(color: Colors.red, width: 2) : null,
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
    return Center(
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.transparent,
        ),
        alignment: Alignment.center,
        child: Text(
          '${day.day}',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}