import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';

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

  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is your favorite color?",
      "options": ["Red", "Blue", "Green", "Yellow"],
    },
    {
      "question": "What is your preferred mode of transport?",
      "options": ["Car", "Bike", "Bus", "Train"],
    },
    {
      "question": "What is your favorite season?",
      "options": ["Summer", "Winter", "Spring", "Autumn"],
    },
    {
      "question": "What is your preferred meal?",
      "options": ["Breakfast", "Lunch", "Dinner", "Snack"],
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  void _nextStep() {
    if (_answers[_currentStep] != null) {
      if (_currentStep < _questions.length - 1) {
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
    Navigator.pop(context);
  }

  void _submitSurvey() {
    // Handle survey submission logic here
    _showAlert("Survey submitted successfully!");
  }

  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Alert"),
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
    final questionData = _questions[_currentStep];
    final question = questionData["question"] as String;
    final options = questionData["options"] as List<String>;
//     "Survey - Step ${_currentStep + 1} of ${_questions.length}"),
    return MasterWidget(
        screenTitle: context.tr("survey"),
        hasScroll: false,
        isBackEnabled: true,
        widget: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              24.verticalSpace,
              //build steps indicator
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
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                  " ${_currentStep + 1} / ${_questions.length}",
                              style: AppTextStyle.medium_14,
                            ),
                          )),
                      5.verticalSpace,
                      Align(
                          alignment: Alignment.centerLeft,
                          child: MainTitleWidget(title: question)),
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
                      textColor: Palette.blue_5490EB),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ));
  }
}
