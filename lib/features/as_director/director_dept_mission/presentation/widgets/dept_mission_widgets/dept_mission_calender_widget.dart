import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_calendar_data_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/cubits/director_dept_mission_cubit.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/widgets/dept_mission_widgets/director_mission_selected_day_widget.dart';
 import 'package:table_calendar/table_calendar.dart';

 
class DeptMissionsCalenderWidget extends StatefulWidget {
  final DateTime focusedDay;
  final ValueChanged<DateTime> onFocusedDayChanged;
  final DirectorDeptMissionCubit directorDeptMissionCubit;
 final DeptEntity? selectedDept;
    DeptMissionsCalenderWidget({
    required this.focusedDay,
    required this.onFocusedDayChanged,
    required this.directorDeptMissionCubit,
      super.key,
      required this.selectedDept,
  }) ;

  @override
  State<DeptMissionsCalenderWidget> createState() => _DeptMissionsCalenderWidgetState();
}

class _DeptMissionsCalenderWidgetState extends State<DeptMissionsCalenderWidget> {
   List<DirectorDeptCalendarDataEntity> calendarResponse = [];

 DateTime selectedCalendarDay  = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectorDeptMissionCubit, DirectorDeptMissionState>(
      listener: (context, state) {
        if (state is DirectorDeptMissionErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
        }
else if  (state is DirectorDeptMissionReadyState){
            ViewsToolbox.dismissLoading();
setState(() {
    calendarResponse = state.response.data??[];
});
}

//TODO:
//           else if (state is DirectorDeptMissionDetailsReadyState){
//                         ViewsToolbox.dismissLoading();
// if(state.showNewBottomSheet){
//           ViewsToolbox.showBottomSheet(
//                     height: 400.h,
//                     context: context,
//                     customWidget: DeptMissionsBottomSheet(
//                       selectedDate: selectedCalendarDay,
//                       calendarDirectorMissionDates: 
//                           _getCalendarDeptMissionDates(calendarResponse),
//                       directorDeptMissionCubit: widget.directorDeptMissionCubit,
//                       directorMissionDetails: state.response.data!,
//                       selectedDept:  widget.selectedDept
//                     ),
//                   );
// }
//         }
      }, //TODO
      buildWhen: (previous, current) => current is DirectorDeptMissionDetailsReadyState ,
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
              locale:  context.locale.languageCode,
              daysOfWeekHeight: 40.h,
              availableGestures: AvailableGestures.horizontalSwipe,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2045, 12, 31),
              focusedDay: widget.focusedDay,
              onPageChanged: widget.onFocusedDayChanged,
              onDaySelected: (selectedDay, focusedDay) {
                // check if the selected day is is not in the calendarResponse list
                if ( 
                    calendarResponse.isEmpty ||
                    !calendarResponse
                        .map((item) => item.asDate)
                        .whereType<String>()
                        .toList()
                        .contains(DateFormat("dd/MM/yyyy").format(selectedDay))) {
                  ViewsToolbox.showErrorAwesomeSnackBar(
                      context, "no_missions/leaves_logs".tr());
                  return;
                }
                selectedCalendarDay = selectedDay;
                // widget.directorDeptMissionCubit.getDirecatorsMissionsDetailsList(
                //   DirectorMissionDetailsRequestModel(
                //     asDate:  DateFormat("yyyy-MM-dd").format(selectedDay),
                //      empID:  int.parse(widget.selectedDirector?.employeeId ?? "0"),
                //   ),
                //   showNewBottomSheet: false
                // );
             
              },
              selectedDayPredicate: (day) {
                return calendarResponse
                    .map((item) => item.asDate)
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
                     DirectorDeptMissionSelectedDayWidget(calendarResponse: calendarResponse, day: day),
              ),
            ),
          );
      
    
       
      }
      );}

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

 List<String>  _getCalendarDeptMissionDates(List<DirectorDeptCalendarDataEntity> list) {
    // This method filters the list of DirectorsMissionEntity objects to get unique dates as string 
    return list
        .map((e) => e.asDate)
        .toSet()
        .toList()
        .map((e) => list.firstWhere((element) => element.asDate  == e).asDate!)
        .toList(); 
  }
}


