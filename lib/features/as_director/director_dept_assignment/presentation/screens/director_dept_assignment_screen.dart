import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/request/director_dept_assignment_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/data/models/response/director_dept_assignment_employee_response_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/domain/entities/director_dept_assignment_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/presentation/cubits/director_dept_assignment_cubit.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_assignment/presentation/widgets/dept_assignment_name_dropmenu_widget.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/cubits/director_dept_mission_cubit.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/gen/assets.gen.dart';

import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class DirectorDeptAssignmentScreen extends StatefulWidget {
  const DirectorDeptAssignmentScreen({super.key});

  @override
  State<DirectorDeptAssignmentScreen> createState() =>
      _DirectorDeptAssignmentScreenState();
}

class _DirectorDeptAssignmentScreenState
    extends State<DirectorDeptAssignmentScreen> {
  DeptEntity? selectedDept;
  final DirectorDeptMissionCubit directorDeptMissionCubit =
      getIt<DirectorDeptMissionCubit>();

  final DirectorDeptAssignmentCubit directorDeptAssignmentCubit =
      getIt<DirectorDeptAssignmentCubit>();
 DirectorDeptAssignmentEntity?
                            directorDeptAssignmentEntity;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => directorDeptMissionCubit..getAllDepts(),
        ),
        BlocProvider(
          create: (context) => directorDeptAssignmentCubit,
        ),
      ],
      child: MasterWidget(
          screenTitle: context.tr("dept_assignment"),
          hasScroll: false,
          isBackEnabled: false,
          widget: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DeptAssignmentNameDropmenuWidget(
                      directorDeptAssignmentCubit: directorDeptAssignmentCubit,
                      onDeptSelected: (selectedDeptValue) {
                        setState(() {
                          selectedDept = selectedDeptValue;
                        });
                        directorDeptAssignmentCubit.getDirectorDeptAssignment(
                          DirectorDeptAssignmentRequestModel(
                            deptCode: selectedDept?.departmentCode ?? "0",
                          ),
                        );
                      },
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       _isCalandarView = !_isCalandarView;
                  //     });
                  //     // ViewsToolbox.showBottomSheet(
                  //     //     // height: 1.sh - 200,
                  //     //     context: context,
                  //     //     customWidget: SubmissionFilterBottomSheet());
                  //   },
                  //   child: Container(
                  //     height: 42.h,
                  //     width: 42.h,
                  //     decoration: BoxDecoration(
                  //       color: Palette.blue_5490EB,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: _isCalandarView
                  //           ? Assets.svg.calendarEye.svg()
                  //           : Assets.svg.calander.svg(),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     // ViewsToolbox.showBottomSheet(
                  //     //     // height: 1.sh - 200,
                  //     //     context: context,
                  //     //     customWidget: SubmissionFilterBottomSheet());
                  //   },
                  //   child: Container(
                  //     height: 42.h,
                  //     width: 42.h,
                  //     decoration: BoxDecoration(
                  //       color: Palette.yellow_FBD823,
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Assets.svg.filterIcon.svg(),
                  //     ),
                  //   ),
                  // )

                  20.verticalSpace,
                  BlocConsumer<DirectorDeptAssignmentCubit,
                      DirectorDeptAssignmentState>(
                    listener: (context, state) {
                      if (state is DirectorDeptAssignmentErrorState) {
                        ViewsToolbox.showErrorAwesomeSnackBar(
                            context, context.tr(state.message!));
                      } else if (state is DirectorDeptAssignmentReadyState) {
                        ViewsToolbox.dismissLoading();
                           
                            directorDeptAssignmentEntity = state.response.data!;
                      } else if (state is DirectorDeptAssignmentLoadingState) {
                        ViewsToolbox.showLoading();
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is DirectorDeptAssignmentReadyState,
                    builder: (context, state) {
                    
                      

                        return Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Palette.gery_DADADA,
                                    width: 1,
                                  ),
                                  color: Palette.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    20.verticalSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 41.h,
                                              width: 41.w,
                                              child: Assets.svg.arrowTarget.svg(
                                                height: 41.h,
                                                width: 41.w,
                                              ),
                                            ),
                                            AppText(
                                              text: (directorDeptAssignmentEntity?.missionCount??"-")
                                                  .toString(),
                                              style: AppTextStyle.bold_18,
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: AppText(
                                                textAlign: TextAlign.center,
                                                text: context.tr(
                                                    "total_mission_this_year"),
                                                style: AppTextStyle.regular_14,
                                                maxLines: 4,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 41.h,
                                              width: 41.w,
                                              child: Assets.svg.pepole.svg(),
                                            ),
                                            AppText(
                                              text: (directorDeptAssignmentEntity?.employeesCount??"-")
                                                  .toString(),
                                              style: AppTextStyle.bold_18,
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: AppText(
                                                textAlign: TextAlign.center,
                                                maxLines: 4,
                                                text: context.tr(
                                                    "number_of_employees_on_mission"),
                                                style: AppTextStyle.regular_14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 41.h,
                                              width: 41.w,
                                              child: Assets.svg.world.svg(
                                                height: 41.h,
                                                width: 41.w,
                                              ),
                                            ),
                                            AppText(
                                              text: (directorDeptAssignmentEntity?.countriesCount??"-")
                                                  .toString(),
                                              style: AppTextStyle.bold_18,
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: AppText(
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                text: context
                                                    .tr("number_of_countries"),
                                                style: AppTextStyle.regular_14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    20.verticalSpace,
                                  ],
                                ),
                              ),
                              20.verticalSpace,
                              MainTitleWidget(
                                  title: context
                                      .tr("emoloyees_on_mission_this_year")),
                              20.verticalSpace,
                              Expanded(
                                  child: EmployeesOnMissionWidget(
                                employeesOnMission:
                                    directorDeptAssignmentEntity?.employeesArray,
                              )),
                            ],
                          ),
                        );
                        
                    },
                  ),
                ]),
          )),
    );
  }
}

class EmployeesOnMissionWidget extends StatelessWidget {
  EmployeesOnMissionWidget({super.key, this.employeesOnMission});
  List<DirectorDeptAssignmentEmployeeModel>? employeesOnMission;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 1.sw, // Make DataTable take full width
          child: DataTable(
            columnSpacing: 10.0,
            headingRowHeight: 30,
            headingRowColor: WidgetStateProperty.resolveWith<Color>(
                (states) => Palette.primaryColor),
            columns: [
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.center,
                  label: Center(
                    child: Text(
                      context.tr("employees_name"),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              DataColumn(
                  headingRowAlignment: MainAxisAlignment.center,
                  label: Text(
                    context.tr("days_count"),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  )),
            ],
            rows:  (employeesOnMission?.isEmpty??true) 
                ? []
                :
            
            employeesOnMission!
                .map(
                  (data) => DataRow(
                    cells: [
                      DataCell(
                        Text(data.employeeName, textAlign: TextAlign.start),
                      ),
                      DataCell(Center(child: Text(data.count.toString()))),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
