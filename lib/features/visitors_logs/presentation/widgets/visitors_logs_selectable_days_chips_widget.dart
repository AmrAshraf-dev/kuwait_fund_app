import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utility/palette.dart';
import '../../../shared/widgets/app_text.dart';
 
class SelectableDaysChips  extends StatefulWidget {
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
  State<SelectableDaysChips> createState() => _SelectableDaysChipsState();
}

class _SelectableDaysChipsState extends State<SelectableDaysChips> {
  late ScrollController  scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
 
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedIndex = widget.calendarVisitorsLogsDates.indexWhere(
        (date) => DateFormat("dd/MM/yyyy").format(widget.selectedDate) == date,
      );
      if (selectedIndex != -1) {
        scrollController.animateTo(
          selectedIndex * 60.w, // Adjust item width as needed
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
   

    return SizedBox(
      height: 40.h,
      child: ListView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        children: widget.calendarVisitorsLogsDates.map(( calendarDateItem) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: GestureDetector(
              onTap: () {
                widget.onDaySelected(calendarDateItem);
                
              },
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  color: 
                  
                  DateFormat("dd/MM/yyyy").format(widget.selectedDate) == calendarDateItem
                      ? Colors.yellow
                      : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                      color: DateFormat("dd/MM/yyyy").format(widget.selectedDate) == calendarDateItem
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
