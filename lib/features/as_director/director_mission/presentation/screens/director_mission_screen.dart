import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/images.dart';
import '../../../../../core/utility/palette.dart';
import '../../data/models/request/management_calender_data_request_model.dart';
import '../../domain/entities/director_entity.dart';
import '../cubits/director_mission_cubit.dart';
import '../widgets/director_mission/director_app_bar_widget.dart';
import '../widgets/director_mission/director_mission_calender_widget.dart';
import '../widgets/director_mission/director_name_dropmenu_widget.dart';
import '../../../../di/dependency_init.dart';
import '../../../../home/presentation/screens/widgets/recent_update_section_widget.dart';
import '../../../../shared/widgets/app_text.dart';
import '../../../../shared/widgets/legend_item_widget.dart';
 
import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class DirectorMissionScreen extends StatefulWidget {
  const DirectorMissionScreen({super.key});

  @override
  State<DirectorMissionScreen> createState() => _DirectorMissionScreenState();
}

class _DirectorMissionScreenState extends State<DirectorMissionScreen> {

  final DirectorMissionCubit directorMissionCubit = getIt<DirectorMissionCubit>();
  DirectorEntity? selectedDirector;
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => directorMissionCubit..getDirectorsList()
          // ..getManagementCalenderData(
          //    ManagementCalenderDataRequestModel(
          //     empID: 0, // default value 
          //    month:int.parse(_focusedDay.month.toString().padLeft(2, '0')) ,year: int.parse(_focusedDay.year.toString())    
          //    )
          // ),
        ),
      ],
      child: MasterWidget(
            waterMarkImage: waterMarkImage,
            appBarHeight: 140.0.h,
              isBackEnabled: false,

            appBarBody: Column(
              children: [
                DirectorAppBarWidget(),
                20.verticalSpace,
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     HalfCircleChartWidget(
                //       leaveUsed: 26,
                //       totalLeave: 30,
                //       color: Colors.blueAccent,
                //       title: context.tr('managers_on_mission'),
                //     ),
                //     SizedBox(
                //       height: 100.h,
                //       child: VerticalDivider(
                //         color: Palette.blue_3B72C5,
                //         thickness: 0.2,
                //       ),
                //     ),
                //     HalfCircleChartWidget(
                //       leaveUsed: 12,
                //       totalLeave: 15,
                //       color: Color(0xFFEDA18C),
                //       title: context.tr('managers_on_leave'),
                //     ),
                //     SizedBox(
                //       height: 100.h,
                //       child: VerticalDivider(
                //         color: Palette.blue_3B72C5,
                //         thickness: 0.2,
                //       ),
                //     ),
                //     HalfCircleChartWidget(
                //         leaveUsed: 2,
                //         totalLeave: 4,
                //         title: context.tr('department_on_mission'),
                //         color: Color(0xFFFBD823)),
                //   ],
                // ),
              ],
            ),
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  20.verticalSpace,
                  AppText(
                    text: context.tr("mission/leave_calendar_for_directors"),
                    style: AppTextStyle.bold_21,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DirectorNameDropdown(
                      initialValue: selectedDirector,
                      onDirectorSelected: (selectedDirectorValue) {
                  
                      selectedDirector = selectedDirectorValue;
               

              
                        directorMissionCubit.getManagementCalenderData(
                          ManagementCalenderDataRequestModel(
                            empID:int.parse(selectedDirectorValue?.employeeId ?? "0") ,
                            month: int.parse(_focusedDay.month.toString().padLeft(2, '0')),
                            year: int.parse(_focusedDay.year.toString()),
                          ),
                        );
                      },
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    
                        DirectorMissionsCalenderWidget(
              directorMissionCubit: directorMissionCubit,
              focusedDay: _focusedDay,    
              selectedDirector: selectedDirector,
               onFocusedDayChanged: (day) => 
               setState((){            
                  _focusedDay = day;
                  directorMissionCubit.getManagementCalenderData(
                        ManagementCalenderDataRequestModel(
                          empID:int.parse(selectedDirector?.employeeId ?? "0") ,
                          month: int.parse(_focusedDay.month.toString().padLeft(2, '0')),
                          year: int.parse(_focusedDay.year.toString()),
                        ),
                      );
 
               } ),
            ),
                    
                 
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                                    LegendItem(color: Palette.redBackgroundTheme, labelKey: "mission"),
                                    10.horizontalSpace,
                                    LegendItem(color: Palette.blue_3542B9 , labelKey: "leave"),

                      
                        // Row(
                        //   children: [
                        //   Container(
                        //     height: 14.h,
                        //     width: 14.h,
                        //     decoration: BoxDecoration(
                        //         color: Palette.orange_FFB162,
                        //         shape: BoxShape.rectangle,
                        //         border: Border.all(
                        //           color: Palette.green_457403,
                        //           width: 2,
                        //         )),
                        //   ),
                        //   10.horizontalSpace,
                        //   AppText(
                        //     text: context.tr("mission_and_leave"),
                        //     style: AppTextStyle.medium_18,
                        //   ),
                        // ]),
                      ],
                    ),
                  ),
                  17.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RecentUpdatesSection(),
                  ),
                  60.verticalSpace,
                ],
              ),
            ),
    ));
  }
}
