import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/utility/palette.dart';
import '../../../di/dependency_init.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/custom_elevated_button_widget.dart';
import '../../../shared/widgets/main_title_widget.dart';

import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int _currentStep = 0;
  final Map<int, String?> _answers = {};

  List<Map<String, dynamic>> _getQuestions(BuildContext context) {
    return [
      {
        "question": context.tr("favorite_color"),
        "options": [
          context.tr("red"),
          context.tr("blue"),
          context.tr("green"),
          context.tr("yellow")
        ],
      },
      {
        "question": context.tr("preferred_transport"),
        "options": [
          context.tr("car"),
          context.tr("bike"),
          context.tr("bus"),
          context.tr("train")
        ],
      },
      {
        "question": context.tr("favorite_season"),
        "options": [
          context.tr("summer"),
          context.tr("winter"),
          context.tr("spring"),
          context.tr("autumn")
        ],
      },
      {
        "question": context.tr("preferred_meal"),
        "options": [
          context.tr("breakfast"),
          context.tr("lunch"),
          context.tr("dinner"),
          context.tr("snack")
        ],
      },
    ];
  }

  void _nextStep() {
    if (_answers[_currentStep] != null) {
      if (_currentStep < _getQuestions(context).length - 1) {
        setState(() {
          _currentStep++;
        });
      } else {
        _submitSurvey();
      }
    } else {
      _showAlert("Please select an answer before proceeding.");
    }
  }

  void _cancelSurvey() {
    final router = getIt<AppRouter>();
    if (router.canPop()) {
      router.back();
    }
  }

  void _submitSurvey() {
    _showAlert(context.tr("thank_you_for_participating"));
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr("alert")),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _questions = _getQuestions(context);
    final questionData = _questions[_currentStep];
    final question = questionData["question"] as String;
    final options = questionData["options"] as List<String>;

    return MasterWidget(
      screenTitle: context.tr("survey"),
      hasScroll: false,
      isBackEnabled: true,
      widget: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            24.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _questions.length,
                (index) => Container(
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
                ),
              ),
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
                          text: " ${_currentStep + 1} / ${_questions.length}",
                          style: AppTextStyle.medium_14,
                          textColor: Palette.white,
                        ),
                      ),
                    ),
                    5.verticalSpace,
                    MainTitleWidget(title: question),
                    20.verticalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: options.map((option) {
                        return RadioListTile<String>(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          fillColor:
                              WidgetStateProperty.all(Palette.primaryColor),
                          title: AppText(
                              text: option, style: AppTextStyle.semiBold_16),
                          value: option,
                          groupValue: _answers[_currentStep],
                          onChanged: (value) {
                            setState(() {
                              _answers[_currentStep] = value;
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  onPressed: _nextStep,
                  text: context.tr(_currentStep == _questions.length - 1
                      ? "submit"
                      : "next"),
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
  }
}
