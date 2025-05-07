import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/routes/route_sevices.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.gr.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/poll/data/models/request/survey_poll_answer_request_model.dart';
import 'package:kf_ess_mobile_app/features/poll/presentation/cubits/survey_poll_answer_cubit/survey_poll_answer_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/confirmation_popup_content_body.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import 'package:kf_ess_mobile_app/features/survey/data/models/response/poll_questions_model.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_details_entity.dart';
import 'package:kf_ess_mobile_app/features/survey/domain/entities/survey_entity.dart';
import 'package:kf_ess_mobile_app/features/survey/presentation/cubits/survey_details_cubit/survey_details_cubit.dart';
import '../../../di/dependency_init.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class SurveyDetailsScreen extends StatefulWidget {
  const SurveyDetailsScreen({super.key, required this.surveyItem});

  final SurveyEntity surveyItem;

  @override
  State<SurveyDetailsScreen> createState() => _SurveyDetailsScreenState();
}

class _SurveyDetailsScreenState extends State<SurveyDetailsScreen> {
  final SurveyDetailsCubit surveyDetailsCubit = getIt<SurveyDetailsCubit>();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _horizontalScrollController = ScrollController();

  final SurveyPollAnswerCubit surveyPollAnswerCubit =
      getIt<SurveyPollAnswerCubit>();

  SurveyDetailsEntity? surveyDetailsEntity;
  int _currentStep = 0;
  final Map<int, String?> _answers = {};

  @override
  void initState() {
    super.initState();
    surveyDetailsCubit.getSurveyById(surveyId: widget.surveyItem.id!);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => surveyDetailsCubit,
        ),
        BlocProvider(
          create: (context) => surveyPollAnswerCubit,
        ),
      ],
      child: MasterWidget(
        hasScroll: false,
        isBackEnabled: true,
        screenTitle: context.tr("survey"),
        widget: BlocConsumer<SurveyDetailsCubit, SurveyDetailsState>(
          listener: (context, state) {
            if (state is SurveyDetailsLoadingState) {
              ViewsToolbox.showLoading();
            } else if (state is SurveyDetailsErrorState) {
              ViewsToolbox.dismissLoading();

              ViewsToolbox.showErrorAwesomeSnackBar(
                  context, context.tr(state.message!));
            } else if (state is SurveyDetailsReadyState) {
              ViewsToolbox.dismissLoading();
              surveyDetailsEntity = state.response.data;
            }
          },
          buildWhen: (previous, current) => current is SurveyDetailsReadyState,
          builder: (context, state) {
            int questionsLength =
                (surveyDetailsEntity?.pollQuestions ?? []).length;
            List<PollQuestionsModel>? pollQuestions =
                surveyDetailsEntity?.pollQuestions;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    24.verticalSpace,
                    SizedBox(
                      height: 10.h,
                      child: ListView.builder(
                          controller: _horizontalScrollController,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: questionsLength,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 50.w,
                              height: 10.h,
                              margin: EdgeInsets.symmetric(horizontal: 15.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                shape: BoxShape.rectangle,
                                color: _currentStep == index
                                    ? Palette.yellow_FBD823
                                    : Palette.gery_DADADA,
                              ),
                            );
                          }),
                    ),
                    24.verticalSpace,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Palette.yellow_FBD823,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AppText(
                                  text:
                                      " ${_currentStep + 1} / $questionsLength",
                                  style: AppTextStyle.medium_14,
                                  textColor: Palette.white,
                                ),
                              ),
                            ),
                            5.verticalSpace,
                            MainTitleWidget(
                                title: pollQuestions?[_currentStep].question ??
                                    ""),
                            20.verticalSpace,
                            if (pollQuestions == null || pollQuestions.isEmpty)
                              AppText(
                                text: "No questions available",
                                style: AppTextStyle.semiBold_16,
                              )
                            else
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: pollQuestions.map((pollQuestion) {
                                    return RadioListTile<String>(
                                      contentPadding: EdgeInsets.zero,
                                      dense: true,
                                      fillColor: WidgetStateProperty.all(
                                          Palette.primaryColor),
                                      title: AppText(
                                          maxLines: 3,
                                          text: pollQuestion.question,
                                          style: AppTextStyle.semiBold_16),
                                      value: pollQuestion.id.toString(),
                                      groupValue: _answers[_currentStep],
                                      onChanged: (value) {
                                        setState(() {
                                          _answers[_currentStep] = value;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h), // Replaced Spacer with SizedBox
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocConsumer<SurveyPollAnswerCubit,
                            SurveyPollAnswerState>(
                          listener: (context, state) {
                            if (state is SurveyPollAnswerErrorState) {
                              ViewsToolbox.dismissLoading();
                              ViewsToolbox.showErrorAwesomeSnackBar(
                                  context, state.message!);
                            } else if (state is SurveyPollAnswerLoadingState) {
                              ViewsToolbox.showLoading();
                            } else if (state is SurveyPollAnswerReadyState) {
                              ViewsToolbox.dismissLoading();
                            } else if (state is SurveyPollAnswerReadyState) {
                              ViewsToolbox.dismissLoading();
                              ViewsToolbox.showMessageBottomsheet(
                                context: context,
                                title: context.tr("Success"),
                                status: ConfirmationPopupStatus.success,
                                continueButtonCallback: () {
                                  CustomMainRouter.push(HomeRoute());
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              onPressed: () {
                                _nextStep(questionsLength);
                                _currentStep == questionsLength - 1
                                    ? surveyPollAnswerCubit
                                        .submitSurveyPollAnswer(
                                            SurveyPollAnswerRequestModel(
                                                questionId:
                                                    surveyDetailsEntity?.id ??
                                                        0,
                                                answerId: int.tryParse(_answers[
                                                            _currentStep] ??
                                                        '') ??
                                                    0))
                                    : null;
                              },
                              text: context.tr(
                                  _currentStep == questionsLength - 1
                                      ? "submit"
                                      : "next"),
                            );
                          },
                        ),
                        CustomElevatedButton(
                          backgroundColor: Colors.transparent,
                          onPressed: _cancelSurvey,
                          text: context.tr("cancel"),
                          textColor: Palette.blue_5490EB,
                        ),
                      ],
                    ),
                    20.verticalSpace,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _nextStep(int questionsLength) {
    if (_answers[_currentStep] != null) {
      if (_currentStep < questionsLength - 1) {
        setState(() {
          _currentStep++;
        });
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _horizontalScrollController.animateTo(
          _currentStep * 80.0, // Adjust 80.0 based on item width + margin
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        // _submitSurvey();
      }
    } else {
      ViewsToolbox.showMessageBottomsheet(
        context: context,
        message: context.tr("please_select_answer"),
        status: ConfirmationPopupStatus.warning,
        closeOnlyPopup: true,
      );
    }
  }

  void _cancelSurvey() {
    final router = getIt<AppRouter>();
    if (router.canPop()) {
      router.back();
    }
  }
}
