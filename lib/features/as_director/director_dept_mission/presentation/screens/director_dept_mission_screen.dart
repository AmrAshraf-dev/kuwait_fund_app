import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/request/dept_calendar_data_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/cubits/director_dept_mission_cubit.dart';
 import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/widgets/dept_mission_widgets/dept_mission_calender_widget.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/widgets/dept_mission_widgets/dept_name_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/legend_item_widget.dart';

import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class DirectorDeptMissionScreen extends StatefulWidget {
  const DirectorDeptMissionScreen({super.key});

  @override
  State<DirectorDeptMissionScreen> createState() =>
      _DirectorDeptMissionScreenState();
}

class _DirectorDeptMissionScreenState extends State<DirectorDeptMissionScreen> {

    final DirectorDeptMissionCubit  directorDeptMissionCubit = getIt<DirectorDeptMissionCubit>();
  DeptEntity? selectedDept;
  DateTime _focusedDay = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (context) => directorDeptMissionCubit..getAllDepts(),
          // ..getDeptCalenderData(
          //    DeptCalenderDataRequestModel(
          //     deptCode: "0", // default value 
          //    month:int.parse(_focusedDay.month.toString().padLeft(2, '0')) ,year: int.parse(_focusedDay.year.toString())    
          //     )
          // ),
      child: MasterWidget(
          screenTitle: context.tr("dept_mission"),
          isBackEnabled: false,
          widget: Column(
            children: [
            Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DeptNameDropdown(
                                            initialValue: selectedDept,

                       onDeptSelected: (selectedDeptValue) {
                
                      selectedDept = selectedDeptValue;
                   
                        directorDeptMissionCubit.getDeptCalenderData(
                          DeptCalenderDataRequestModel(
                            deptCode: selectedDept?.departmentCode?? "0",
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
                    
                        DeptMissionsCalenderWidget(
              directorDeptMissionCubit: directorDeptMissionCubit,
              focusedDay: _focusedDay,    
              selectedDept: selectedDept,
               onFocusedDayChanged: (day) => setState((){            
                  _focusedDay = day;
           directorDeptMissionCubit.getDeptCalenderData(

              DeptCalenderDataRequestModel(
                            deptCode: selectedDept?.departmentCode?? "0",
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

                                    LegendItem(color: Palette.red_FF0606, labelKey: "mission"),
                                    10.horizontalSpace,
                                    LegendItem(color: Palette.blue_3542B9, labelKey: "leave"),

                      
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
            ],
          )),
    );
  }
}
