import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_bottomsheet.dart';
import 'package:table_calendar/table_calendar.dart';

class VisitorsLogsCalenderWidget extends StatelessWidget {
  final VisitorsLogsCubit visitorsLogsCubit;
  final DateTime focusedDay;
   final ValueChanged<DateTime> onFocusedDayChanged;

  const VisitorsLogsCalenderWidget({
    required this.visitorsLogsCubit,
    required this.focusedDay,
     required this.onFocusedDayChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
      listener: (context, state) {
        if (state is VisitorsLogsErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
        }
      },
      buildWhen: (previous, current) => current is VisitorsLogsReadyState,
      builder: (context, state) {
        if (state is VisitorsLogsLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is VisitorsLogsReadyState) {
          ViewsToolbox.dismissLoading();
          return CalendarContent(
            calendarResponse: state.response.data,
            focusedDay: focusedDay,
             onFocusedDayChanged: onFocusedDayChanged,
            visitorsLogsCubit: visitorsLogsCubit,
          );
        }
        return Container();
      },
    );
  }
}

class CalendarContent extends StatelessWidget {
  final   List<VisitorsLogsEntity>? calendarResponse;
  final DateTime focusedDay;
   final ValueChanged<DateTime> onFocusedDayChanged;
  final VisitorsLogsCubit visitorsLogsCubit;

  const CalendarContent({
    required this.calendarResponse,
    required this.focusedDay,
     required this.onFocusedDayChanged,
    required this.visitorsLogsCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TableCalendar(
          availableGestures: AvailableGestures.horizontalSwipe,
          firstDay: DateTime.utc(2025, 3, 1),
          lastDay: DateTime.utc(2025, 12, 31),
          focusedDay: focusedDay,
          onPageChanged: onFocusedDayChanged,
          onDaySelected: (selectedDay, focusedDay) {
       
            ViewsToolbox.showBottomSheet(
              height: 400.h,
              context: context,
              customWidget: VisitsBottomSheet(
                selectedDate:
                selectedDay.toString() ,
                selectedMonthDays: _getSelectedMonthDays(calendarResponse!),
                
              
              ),
            );
          },
          selectedDayPredicate: (day) {
            return calendarResponse!
                .map((item) => item.date)
                .whereType<String>()
                .toList()
                .contains(DateFormat("dd/MM/yyyy").format(day));
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarFormat: CalendarFormat.month,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.indigo.shade300),
            weekendStyle: TextStyle(color: Colors.indigo.shade300),
          ),
          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            leftChevronIcon: _buildChevron(Icons.chevron_left),
            rightChevronIcon: _buildChevron(Icons.chevron_right),
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(color: Colors.transparent),
            outsideDaysVisible: true,
          ),
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, day, focusedDay) =>
                _buildSelectedDay(calendarResponse, day),
          ),
        ),
      ),
    );
  }

  Widget _buildChevron(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.indigo.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildSelectedDay( List<VisitorsLogsEntity>? calendarResponse, DateTime day) {
    final formattedDay = DateFormat("dd/MM/yyyy").format(day);
    final matchingEntries = calendarResponse
        ?.where((entry) => entry.date == formattedDay)
        .toList();

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
  
  _getSelectedMonthDays(List<VisitorsLogsEntity> list) {
    // This method filters the list of VisitorsLogsEntity objects to get unique dates
    return list
        .map((e) => e.date)
        .toSet()
        .toList()
        .map((e) => list.firstWhere((element) => element.date == e))
        .toList();
  }
}