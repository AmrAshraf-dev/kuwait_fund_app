import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
 
class SelectableDaysChips  extends StatelessWidget {
  final DateTime selectedDate;
  final List<String> calendarVisitorsLogsDates;
  final Function(String) onDaySelected;

  const SelectableDaysChips({
    super.key,
    required this.selectedDate,
    required this.calendarVisitorsLogsDates,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: calendarVisitorsLogsDates.map(( calendarDateItem) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () {
                onDaySelected(calendarDateItem);
                
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: 
                  
                  DateFormat("dd/MM/yyyy").format(selectedDate) == calendarDateItem
                      ? Colors.yellow
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: DateFormat("dd/MM/yyyy").format(selectedDate) == calendarDateItem
                          ? Colors.transparent
                          : Palette.gery_DADADA),
                ),
                child: AppText(
                  text:
                      DateFormat("dd/MM/yyyy").parse(calendarDateItem).day.toString(), // Format as "dd/MM/yyyy"
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
