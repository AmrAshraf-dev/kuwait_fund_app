import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/constants/images.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';
 import 'package:kf_ess_mobile_app/features/requests/data/models/request/extend_leave_request_model.dart';
import 'package:kf_ess_mobile_app/features/requests/domain/entities/requests_entity.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/cubits/extend_leave_cubit/extend_leave_cubit.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/custom_request_details_row_widget.dart';
import 'package:kf_ess_mobile_app/features/requests/presentation/widgets/request_details_row_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/data/local_data.dart';
 import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class ExtendLeaveDetailsScreen extends StatefulWidget {
  RequestsEntity? requestsEntity;
  ExtendLeaveDetailsScreen({super.key, this.requestsEntity});

  @override
  State<ExtendLeaveDetailsScreen> createState() =>
      _ExtendLeaveDetailsScreenState();
}

class _ExtendLeaveDetailsScreenState extends State<ExtendLeaveDetailsScreen> {

  final ExtendLeaveCubit extendLeaveCubit = getIt<ExtendLeaveCubit>();

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();
  }

  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context, {required DateTime firstDate}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate:firstDate, // Disable past dates
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primaryColor, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Palette.primaryColor, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
       waterMarkImage: waterMarkImage5,
        appBarHeight: 100.h,
        isBackEnabled: true,
      screenTitle: context.tr("annual_leave_request"),
     
      widget: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => extendLeaveCubit),
            //
          ],
          child:
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    20.verticalSpace,
                            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Palette.white,
                  boxShadow: [
                    BoxShadow(
                      color: Palette.grey_9C9C9C,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                   20.verticalSpace,
                           RequestDetailsRowWidget(
                          title:  context.tr("requestType") ,
                          subtitle:widget.requestsEntity?.leaveType
                        ),
                         RequestDetailsRowWidget(
                          title: context.tr("submission_date") ,
                          subtitle: widget.requestsEntity?.requestDate,
                        ),
                         RequestDetailsRowWidget(
                           title:  context.tr("from_date") ,
                          subtitle: widget.requestsEntity?.leaveStartDate,
                        ),
                         RequestDetailsRowWidget(
                           title:  context.tr("to_date") ,
                            subtitle: widget.requestsEntity?.leaveEndDate,
                        ),
                         RequestDetailsRowWidget(
                           title: context.tr("approval_status") ,
                          subtitle:context.tr( widget.requestsEntity?.leaveStatus??""),
                        ),
                         CustomRequestDetailsRowWidget(
                          isLast: true,
                           title: context.tr("extended_date") ,
                          subtitle:_selectedDate ==null? null:
                             DateFormat('dd/MM/yyyy')
                                .format(_selectedDate!),
                                chooseDateCallback: () {
                                _selectDate(context,
                                firstDate: DateFormat('dd-MMMM-yyyy').parse( widget.requestsEntity?.leaveEndDate ?? '').add(
                                  Duration(days: 1),
                                ));
                                },
                               
                        ),
                
                20.verticalSpace,
                         
                        ],
                      )
                            ),
                    
                            20.verticalSpace,
                            BlocConsumer<ExtendLeaveCubit, ExtendLeaveState>(
                listener: (context, state) {
                  if (state is ExtendLeaveLoadingState) {
                    ViewsToolbox.showLoading();
                  } else if (state is ExtendLeaveReadyState) {
                    ViewsToolbox.dismissLoading();
                    ViewsToolbox.showMessageBottomsheet(
                      context: context,
                      status: ConfirmationPopupStatus.success,
                      continueButtonCallback: () {
                        if(LocalData.getUser()?.userInfo.isSupervisor == true){
                          CustomMainRouter.push(SupervisorNavigationMainRoute());
                        }
                        else{
                          CustomMainRouter.push(NavigationMainRoute());
                        }
                       },
                      message: context.tr("request_extended_successfully"),
                    );
                  } else if (state is ExtendLeaveErrorState) {
                    ViewsToolbox.dismissLoading();
                
                    ViewsToolbox.showErrorAwesomeSnackBar(
                        context, state.message!);
                  }
                },
                builder: (context, state) {
                  if(_selectedDate != null){

                 
              return      Center(
                    child: CustomElevatedButton(
                      onPressed: () async {
 
                        extendLeaveCubit.getExtendLeave(
                            extendLeaveRequestModel: ExtendLeaveRequestModel(
                          leaveRequestId: widget.requestsEntity?.leaveID ?? '',
                          extendDate: DateFormat("yyyy-MM-dd").format(_selectedDate!),
                          
                         
                        ));
                      },
                      text: context.tr("submit"),
                      width: 300.w,
                      height: 50.h,
                      backgroundColor: Palette.primaryColor,
                    ),
                  );
                }
                else{
                return Container();

                }
                })
  
  
                          ]),
              )),
      // }
      //return Container();
      //  }
      //),
    );
  }
}

_getRequestStatusColor(String requestStatus) {
  switch (requestStatus) {
    case "Pending" || "قيد الانتظار":
      return Palette.orangeBackgroundTheme;
    case "Approved" || "مقبولة":
      return Palette.green;
    case "Rejected" || "مرفوض":
      return Palette.redBackgroundTheme;
    default:
      return Palette.grey_7B7B7B;
  }
}
