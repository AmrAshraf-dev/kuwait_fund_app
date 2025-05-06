import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_entity.dart';
import 'package:kf_ess_mobile_app/features/survey/presentation/cubits/survey_cubit.dart';
import 'package:kf_ess_mobile_app/features/survey/presentation/widgets/survey_card_item_widget.dart';

import '../../../di/dependency_init.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {


final SurveyCubit surveyCubit = getIt<SurveyCubit>();
  @override
  Widget build(BuildContext context) {
    // final _questions = _getQuestions(context);
    // final questionData = _questions[_currentStep];
    // final question = questionData["question"] as String;
    // final options = questionData["options"] as List<String>;


     return BlocProvider(
          create: (context) => surveyCubit,

      child: MasterWidget(
        isBackEnabled: true,
        screenTitle: context.tr("survey"),
                hasScroll: false,

        widget:
         BlocBuilder<SurveyCubit, PagingState<int, SurveyEntity>>(
    bloc: surveyCubit,
    builder: (context, state) =>




     PagedListView<int, SurveyEntity>(
      state: state,
      fetchNextPage: surveyCubit.fetchNextSurveysPage,

      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => SurveyCardItemWidget(item: item),
      ),
    ),
  )));

  }



}
