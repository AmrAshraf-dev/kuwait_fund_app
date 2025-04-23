import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitors_logs_details_request_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/cubits/visitors_logs_cubit.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_selected_day_widget.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/presentation/widgets/visitors_logs_bottomsheet.dart';
import 'package:table_calendar/table_calendar.dart';

 
class VisitorsLogsCalenderWidget extends StatefulWidget {
  final DateTime focusedDay;
  final ValueChanged<DateTime> onFocusedDayChanged;
  final VisitorsLogsCubit visitorsLogsCubit;

    VisitorsLogsCalenderWidget({
    required this.focusedDay,
    required this.onFocusedDayChanged,
    required this.visitorsLogsCubit,
      super.key,
  }) ;

  @override
  State<VisitorsLogsCalenderWidget> createState() => _VisitorsLogsCalenderWidgetState();
}

class _VisitorsLogsCalenderWidgetState extends State<VisitorsLogsCalenderWidget> {
   List<VisitorsLogsEntity> calendarResponse = [];

 DateTime selectedCalendarDay  = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VisitorsLogsCubit, VisitorsLogsState>(
      listener: (context, state) {
        if (state is VisitorsLogsErrorState) {
          ViewsToolbox.dismissLoading();
          ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
        }
else if  (state is VisitorsLogsReadyState){
            ViewsToolbox.dismissLoading();
setState(() {
    calendarResponse = state.response.data??[];
});
}


          else if (state is VisitorsLogsDetailsReadyState){
                        ViewsToolbox.dismissLoading();
if(state.showNewBottomSheet){
          ViewsToolbox.showBottomSheet(
                    height: 400.h,
                    context: context,
                    customWidget: VisitsBottomSheet(
                      selectedDate: selectedCalendarDay,
                      calendarVisitorsLogsDates: 
                          _getCalendarVisitorsLogsDates(calendarResponse),
                      visitorsLogsCubit: widget.visitorsLogsCubit,
                      visitorsLogsDetails: state.response.data!,
                    ),
                  );
}
        }
      },
      buildWhen: (previous, current) => current is VisitorsLogsReadyState ,
      builder: (context, state) {
      

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
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2045, 12, 31),
          focusedDay: widget.focusedDay,
          onPageChanged: widget.onFocusedDayChanged,
          onDaySelected: (selectedDay, focusedDay) {
            // check if the selected day is is not in the calendarResponse list
            if ( 
                calendarResponse.isEmpty ||
                !calendarResponse
                    .map((item) => item.date)
                    .whereType<String>()
                    .toList()
                    .contains(DateFormat("dd/MM/yyyy").format(selectedDay))) {
              ViewsToolbox.showErrorAwesomeSnackBar(
                  context, "no_visitors_logs".tr());
              return;
            }
            selectedCalendarDay = selectedDay;

       


            widget.visitorsLogsCubit.getVisitorLogsDetails(
              VisitorsLogsDetailsRequestModel(
                date:  DateFormat("yyyy-MM-dd").format(selectedDay)
                 
              ),
              showNewBottomSheet: true
            ); 
      
         
          },
          selectedDayPredicate: (day) {
            return calendarResponse
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
                SelectedDayWidget(calendarResponse: calendarResponse, day: day),
          ),
        ),
      ));
      
    
       
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

 List<String>  _getCalendarVisitorsLogsDates(List<VisitorsLogsEntity> list) {
    // This method filters the list of VisitorsLogsEntity objects to get unique dates as string 
    return list
        .map((e) => e.date)
        .toSet()
        .toList()
        .map((e) => list.firstWhere((element) => element.date == e).date)
        .toList(); 
  }
}


