import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/data/models/request/director_dept_mission_details_request_model.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_details_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/domain/entities/director_dept_mission_entity.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/cubits/director_dept_mission_cubit.dart';
import 'package:kf_ess_mobile_app/features/as_director/director_dept_mission/presentation/widgets/dept_mission_widgets/dept_mission_selectable_days_chips_widget.dart';
 import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/domain/entities/director_mission_details_entity.dart';
 import 'package:kf_ess_mobile_app/features/as_director/director_home_mission/presentation/widgets/director_mission/director_mission_selectable_days_chips_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
 

class DeptMissionsBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final List<String> calendarDirectorMissionDates;
  final DirectorDeptMissionCubit directorDeptMissionCubit;
  final List<DirectorDeptMissionDetailsEntity> directorDeptMissionDetails;
final DeptEntity? selectedDept  ;
  const DeptMissionsBottomSheet({
    super.key,
    required this.selectedDate,
    required this.calendarDirectorMissionDates,
    required this.directorDeptMissionCubit,
    required this.directorDeptMissionDetails,
    required this.selectedDept
  });

  @override
  DeptMissionsBottomSheetState createState() => DeptMissionsBottomSheetState();
}

class DeptMissionsBottomSheetState extends State<DeptMissionsBottomSheet> {
  DirectorMissionDetailsEntity? selectedHostName;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return 
    ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r),
        ),
        child:
    Container(
      color:  Colors.white,
      child: SafeArea(
        bottom: true,
        child:
        BlocProvider.value(
      value: widget.directorDeptMissionCubit,
      child: 
      
      Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
            ),
        padding: EdgeInsets.all(16),
       
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildSelectableDaysChips(),
             10.verticalSpace,
               Flexible(
              child: SingleChildScrollView(
                child:DeptMissionsDetailsListView(
               selectedHostName: selectedHostName,
               directorDeptMissionDetails: widget.directorDeptMissionDetails,
            ),
              ),
               ),
            16.verticalSpace,
            _buildCloseButton(context),
          ],
        ),
      ),
        )
      )
    ));
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        AppText(
          text: DateFormat("MMMM yyyy", context.locale.languageCode).format(selectedDate),
          style: AppTextStyle.bold_21,
        ),
        16.verticalSpace,
      ],
    );
  }

  Widget _buildSelectableDaysChips() {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: DirectorDeptMissionSelectableDaysChips(
        selectedDate: selectedDate,
        calendarDirectorMissionDates: widget.calendarDirectorMissionDates,
        onDaySelected: (day) {
          setState(() {
            selectedDate = DateFormat("dd/MM/yyyy").parse(day);
            selectedHostName = null;
          });
       
          widget.directorDeptMissionCubit.getDirecatorsDeptMissionsDetailsList(
            DirectorDeptMissionDetailsRequestModel(
        asDate: DateFormat("yyyy-MM-dd").format(
                                            DateFormat("dd/MM/yyyy").parse(day)),
        deptCode: widget.selectedDept?.departmentCode ?? "0",
       ),
            showNewBottomSheet: false,
          );
        },
      ),
    );
  }



  Widget _buildCloseButton(BuildContext context) {
    return CustomElevatedButton(
      backgroundColor: Colors.transparent,
      onPressed: () {

   Navigator.of(context).pop();
       },

      textColor: Palette.primaryColor,
      text: context.tr("close"),
    );
  }
}

class DeptMissionsDetailsListView extends StatelessWidget {
   final DirectorMissionDetailsEntity? selectedHostName;
    List<DirectorDeptMissionDetailsEntity> directorDeptMissionDetails;
    DeptMissionsDetailsListView({
    super.key,
     required this.selectedHostName,
    required this.directorDeptMissionDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectorDeptMissionCubit, DirectorDeptMissionState>(
      listener: (context, state) {
        if (state is DirectorDeptMissionLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is DirectorDeptMissionErrorState) {
          ViewsToolbox.showMessageBottomsheet(
            context: context,
            status: ConfirmationPopupStatus.failure,
            message: context.tr(state.message!) ,
                            actionsData: CustomElevatedButton(
                    width: 300.w,
                       text: context.tr("continue"),
                       
                      onPressed: () {
                                          Navigator.pop(context);
  
                   }), 
          );
        } else if (state is DirectorDeptMissionDetailsReadyState) {
          ViewsToolbox.dismissLoading();
          directorDeptMissionDetails = state.response.data ?? [];
        }
      },

           buildWhen: (previous, current) => 
          current is DirectorDeptMissionDetailsReadyState  ,

      builder: (context, state) {

 return state is DirectorDeptMissionDetailsReadyState?
   ( state.response.data?.length ?? 0)==0?
                Center(
                  child: AppText(
                    text: context.tr("noDataFound"),
                    style: AppTextStyle.regular_14,
                  ),
                )
                :




       ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),

            itemCount: directorDeptMissionDetails.length  ,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final visit =directorDeptMissionDetails [index];
              return _buildMissionDeptDetailsTile(visit, context);
            } ) :   SizedBox();
          
        
       
      },
    );
  }

  Widget _buildMissionDeptDetailsTile(DirectorDeptMissionDetailsEntity visit, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Palette.grey_7B7B7B.withOpacity(0.3),
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
          color: Palette.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: visit.employee_name,
                  style: AppTextStyle.bold_14,
                ),
               
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: visit.leave_type == "Red"
                        ?  Colors.red
                        :  Palette.blue_3542B9,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    text: visit.leave_type == "Red"
                        ? context.tr("mission")
                        : context.tr("leave"),
                    style: AppTextStyle.semiBold_12,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    AppText(
                      maxLines: 3,
                                      text: visit.leave_type_name,
                                      style: AppTextStyle.bold_14,
                                                        textColor: Colors.black,

                                    ),
                5.verticalSpace,
                AppText(
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text: "${visit.from_date} - ${visit.to_date}",
                ),
                if(visit.leave_type == "Red")
                AppText(
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text:
                      "${context.tr("number_of_missions")}: ${(visit.missionCount?.isEmpty??true)?"-":visit.missionCount}",  
                ),
                if(visit.leave_type == "Red")
                AppText(
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text: "${context.tr("location")}: ${(visit.location?.isEmpty??true)?"-":visit.location}",  
                ),
//  if(visit.leave_type != "Red")
//  AppText(
//   maxLines: 3,
//                   style: AppTextStyle.regular_14,
//                   textColor: Colors.black,
//                   text:  visit.evant_name,
//                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
