import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../core/helper/view_toolbox.dart';
import '../../../data/models/request/director_mission_details_request_model.dart';
import '../../../domain/entities/director_entity.dart';
import '../../../domain/entities/management_calender_data_entity.dart';
import '../../cubits/director_mission_cubit.dart';
import 'director_mission_bottomsheet.dart';
import 'director_mission_selected_day_widget.dart';

class DirectorMissionsCalenderWidget extends StatefulWidget {
  final DateTime focusedDay;
  final ValueChanged<DateTime> onFocusedDayChanged;
  final DirectorMissionCubit directorMissionCubit;
  final DirectorEntity? selectedDirector;
  const DirectorMissionsCalenderWidget({
    required this.focusedDay,
    required this.onFocusedDayChanged,
    required this.directorMissionCubit,
    super.key,
    this.selectedDirector,
  });

  @override
  State<DirectorMissionsCalenderWidget> createState() =>
      _DirectorMissionsCalenderWidgetState();
}

class _DirectorMissionsCalenderWidgetState
    extends State<DirectorMissionsCalenderWidget> {
  List<ManagementCalenderDataEntity> calendarResponse = [];

  DateTime selectedCalendarDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectorMissionCubit, DirectorMissionState>(
        listener: (context, state) {
          if (state is DirectorMissionErrorState) {
            ViewsToolbox.dismissLoading();
            ViewsToolbox.showErrorAwesomeSnackBar(
                context, context.tr(state.message!));
          } else if (state is DirectorMissionReadyState) {
            ViewsToolbox.dismissLoading();
            setState(() {
              calendarResponse = state.response.data ?? [];
            });
          } else if (state is DirectorMissionDetailsReadyState) {
            ViewsToolbox.dismissLoading();
            if (state.showNewBottomSheet) {
              ViewsToolbox.showBottomSheet(
                height: 400.h,
                context: context,
                customWidget: DirectorMissionsBottomSheet(
                    selectedDate: selectedCalendarDay,
                    calendarDirectorMissionDates:
                        _getCalendarDirectorMissionDates(calendarResponse
                       
                          ),
                    directorMissionCubit: widget.directorMissionCubit,
                    directorMissionDetails: state.response.data!,
                    selectedDirector: widget.selectedDirector),
              );
            }
          }
        },
        buildWhen: (previous, current) =>
            current is DirectorMissionDetailsReadyState,
        builder: (context, state) {
          return Container(
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
              locale: context.locale.languageCode,
              daysOfWeekHeight: 40.h,
              
              availableGestures: AvailableGestures.horizontalSwipe,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2045, 12, 31),
              focusedDay: widget.focusedDay,
              onPageChanged: widget.onFocusedDayChanged,
              onHeaderTapped: (focusedDay) async {
                final DateTime? pickedDate = await showDatePicker(
                  initialDatePickerMode: DatePickerMode.year,
                  context: context,
                  initialDate: widget.focusedDay,
                  firstDate: DateTime.utc(2020, 1, 1),
                  lastDate: DateTime.utc(2045, 12, 31),
                );
                if (pickedDate != null) {
                  setState(() {
                    widget.onFocusedDayChanged(pickedDate);
                  });
                }
              },
              onDaySelected: (selectedDay, focusedDay) {
                // check if the selected day is is not in the calendarResponse list
                if (calendarResponse.isEmpty ||
                    !calendarResponse
                        .map((item) => item.asDate)
                        .whereType<String>()
                        .toList()
                        .contains(
                            DateFormat("dd/MM/yyyy").format(selectedDay))) {
                  ViewsToolbox.showErrorAwesomeSnackBar(
                      context, "no_missions/leaves_logs".tr());
                  return;
                }
                selectedCalendarDay = selectedDay;
                widget.directorMissionCubit.getDirecatorsMissionsDetailsList(
                    DirectorMissionDetailsRequestModel(
                      asDate: DateFormat("yyyy-MM-dd").format(selectedDay),
                      empID:
                          int.parse(widget.selectedDirector?.employeeId ?? "0"),
                    ),
                    showNewBottomSheet: true);
              },
              selectedDayPredicate: (day) {
                return calendarResponse
                    .map((item) => item.asDate)
                    .whereType<String>()
                    .toList()
                    .contains(DateFormat("dd/MM/yyyy").format(day));
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarFormat: CalendarFormat.month,
              daysOfWeekStyle: DaysOfWeekStyle(

                weekdayStyle: TextStyle(color: Colors.indigo.shade300,
                fontSize: 12.sp,
                fontStyle:  FontStyle.normal,),
                weekendStyle: TextStyle(color: Colors.indigo.shade300,
              
                  fontSize: 12.sp,
                fontStyle:  FontStyle.normal,),
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
                outsideDaysVisible: false,
              ),
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, day, focusedDay) =>
                    DirectorMissionSelectedDayWidget(
                        calendarResponse: calendarResponse, day: day),
              ),
            ),
          );
        });
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

  List<String> _getCalendarDirectorMissionDates(
      List<ManagementCalenderDataEntity> list) {
    // This method filters the list of DirectorsMissionEntity objects to get unique dates as strings, removes duplicates, and sorts them.
    return list
        .map((item) => item.asDate)
        .whereType<String>()
        .toSet() // Remove duplicates
        .toList()
      ..sort((a, b) {
        final dateA = DateFormat("dd/MM/yyyy").parse(a);
        final dateB = DateFormat("dd/MM/yyyy").parse(b);
        return dateA.compareTo(dateB);
      });
  }

 
}
