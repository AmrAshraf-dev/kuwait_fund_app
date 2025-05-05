import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helper/view_toolbox.dart';
import '../../domain/entities/submission_entity.dart';
import '../cubits/submission_cubit.dart';
import '../widgets/submission_item_widget.dart';
import '../../../../di/dependency_init.dart';
import '../../../../shared/widgets/app_text.dart';
import '../../../../shared/widgets/master_widget.dart';

@RoutePage()
class SubmissionsScreen extends StatefulWidget {
  const SubmissionsScreen({super.key ,  this.isBackButtonEnabled});
  final bool? isBackButtonEnabled;

  @override
  State<SubmissionsScreen> createState() => _SubmissionsScreenState();
}

class _SubmissionsScreenState extends State<SubmissionsScreen>
    with TickerProviderStateMixin {

  final SubmissionCubit submissionCubit = getIt<SubmissionCubit>();

 

  @override
  Widget build(BuildContext context) {
    return 
     
    MasterWidget(
      hasScroll: false,
      isBackEnabled: widget.isBackButtonEnabled,
      screenTitle: context.tr("submissions"),
      appBarHeight: 90.h,
      widget: MultiBlocProvider(
        providers: [
            BlocProvider(create: (context) => submissionCubit ..getSubmissions()),
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // RequestsHeaderWidget(),
            // 20.verticalSpace,
            // _buildTabBar(context),
            //10.verticalSpace,
            _buildTabViews(),
          ],
        ),
      ));
       
          
      
    
  }

  
  Widget _buildTabViews() {
    return BlocConsumer<SubmissionCubit, SubmissionState>(

      listener: (context, state) {
            if (state is SubmissionLoadingState) {
          ViewsToolbox.showLoading();
        } else if (state is SubmissionErrorState) {
          ViewsToolbox.dismissLoading();
         } 
      },
      builder: (context, state) {
     if (state is SubmissionEmptyState) {
          ViewsToolbox.dismissLoading();
          return Expanded(
            child: Center(
              child: AppText(
                text: context.tr("no_submissions"),
                style: AppTextStyle.medium_18,
              ),
            ),
          );
        } else if ( state is SubmissionErrorState){
          return Expanded(
            child: Center(
              child: AppText(
                text:   context.tr(state.message!)    ,
              ),
            ),
          );  
        }
        
        
        else if (state is SubmissionReadyState) {
          ViewsToolbox.dismissLoading();
      List<SubmissionEntity>? submissionList=   state.response.data;
          return Expanded(
            child: ListView.builder(
      itemCount: submissionList?.length??0,
      itemBuilder: (context, index) {
        return SubmissionItemWidget(submissionsEntity: submissionList![index]);
      },
    )
          );
        }
        return Container();
      },
    );
  }
}
 