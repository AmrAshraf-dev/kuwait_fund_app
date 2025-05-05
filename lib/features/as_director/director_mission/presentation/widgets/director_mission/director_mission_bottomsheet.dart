import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helper/view_toolbox.dart';
import '../../../../../../core/routes/route_sevices.dart';
import '../../../../../../core/utility/palette.dart';
import '../../../../../shared/widgets/app_text.dart';
import '../../../../../shared/widgets/confirmation_popup_content_body.dart';
import '../../../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../data/models/request/director_mission_details_request_model.dart';
import '../../../domain/entities/director_entity.dart';
import '../../../domain/entities/director_mission_details_entity.dart';
import '../../cubits/director_mission_cubit.dart';
import 'director_mission_selectable_days_chips_widget.dart';
 

class DirectorMissionsBottomSheet extends StatefulWidget {
  final DateTime selectedDate;
  final List<String> calendarDirectorMissionDates;
  final DirectorMissionCubit directorMissionCubit;
  final List<DirectorMissionDetailsEntity> directorMissionDetails;
final  DirectorEntity? selectedDirector  ;
  const DirectorMissionsBottomSheet({
    super.key,
    required this.selectedDate,
    required this.calendarDirectorMissionDates,
    required this.directorMissionCubit,
    required this.directorMissionDetails,
    required this.selectedDirector
  });

  @override
  DirectorMissionsBottomSheetState createState() => DirectorMissionsBottomSheetState();
}

class DirectorMissionsBottomSheetState extends State<DirectorMissionsBottomSheet> {
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
        child: BlocProvider.value(
          value: widget.directorMissionCubit,
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
                    child: DirectorMissionsDetailsListView(
                      directorMissionCubit: widget.directorMissionCubit,
                      selectedHostName: selectedHostName,
                      directorMissionDetails: widget.directorMissionDetails,
                    ),
                  ),
                ),
                16.verticalSpace,
                _buildCloseButton(context),
              ],
            ),
          ),
        ),
        )
      ),
    );
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
      child: DirectorMissionSelectableDaysChips(
        selectedDate: selectedDate,
        calendarDirectorMissionDates: widget.calendarDirectorMissionDates,
        onDaySelected: (day) {
          setState(() {
            selectedDate = DateFormat("dd/MM/yyyy").parse(day);
            selectedHostName = null;
          });
            
          widget.directorMissionCubit.getDirecatorsMissionsDetailsList(
            DirectorMissionDetailsRequestModel(
        asDate: DateFormat("yyyy-MM-dd").format(
                                            DateFormat("dd/MM/yyyy").parse(day)),
        empID:  int.parse(widget.selectedDirector?.employeeId ?? "0"),
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

   CustomMainRouter.pop( );
       },

      textColor: Palette.primaryColor,
      text: context.tr("close"),
    );
  }
}

class DirectorMissionsDetailsListView extends StatelessWidget {
  final DirectorMissionCubit directorMissionCubit;
  final DirectorMissionDetailsEntity? selectedHostName;
    List<DirectorMissionDetailsEntity> directorMissionDetails;
    DirectorMissionsDetailsListView({
    super.key,
    required this.directorMissionCubit,
    required this.selectedHostName,
    required this.directorMissionDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DirectorMissionCubit, DirectorMissionState>(
      listener: (context, state) {
        if (state is DirectorMissionLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is DirectorMissionErrorState) {
          ViewsToolbox.showMessageBottomsheet(
            context: context,
            status: ConfirmationPopupStatus.failure,
            message: state.message,
                             actionsData: CustomElevatedButton(
                    width: 300.w,
                       text: context.tr("continue"),
                       
                      onPressed: () {
                                          Navigator.pop(context);
  
                   }), 
          );
        } else if (state is DirectorMissionDetailsReadyState) {
          ViewsToolbox.dismissLoading();
                    directorMissionDetails = state.response.data ?? [];

        }
      },

        buildWhen: (previous, current) => 
          current is DirectorMissionDetailsReadyState  ,

      builder: (context, state) {
   return state is DirectorMissionDetailsReadyState?
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
            itemCount: directorMissionDetails.length ,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final visit = directorMissionDetails[index];
              return _buildMissionDetailsTile(visit, context);
            }) : SizedBox();
           
       
      },
    );
  }

  Widget _buildMissionDetailsTile(DirectorMissionDetailsEntity visit, BuildContext context) {
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
                        ? Colors.red 
                        : Palette.blue_3542B9 ,
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
                  style: AppTextStyle.regular_14,
                  textColor: Colors.black,
                  text: "${visit.leave_type_name} ",
                ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
