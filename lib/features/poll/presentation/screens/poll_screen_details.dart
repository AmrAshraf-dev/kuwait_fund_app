import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kf_ess_mobile_app/core/helper/view_toolbox.dart';
import 'package:kf_ess_mobile_app/core/utility/palette.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_details_entity.dart';
import 'package:kf_ess_mobile_app/features/poll/domain/entities/poll_entity.dart';
import 'package:kf_ess_mobile_app/features/poll/presentation/cubits/poll_details_cubit/poll_details_cubit.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/custom_elevated_button_widget.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/main_title_widget.dart';
import '../../../di/dependency_init.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../shared/widgets/master_widget.dart';

@RoutePage()
class PollDetailsScreen extends StatefulWidget {
  const PollDetailsScreen({
    super.key,
    required this.pollItem,
  });

  final PollEntity pollItem;

  @override
  State<PollDetailsScreen> createState() => _PollDetailsScreenState();
}

class _PollDetailsScreenState extends State<PollDetailsScreen> {
  final PollDetailsCubit pollDetailsCubit = getIt<PollDetailsCubit>();
  PollDetailsEntity pollDetailsEntity = PollDetailsEntity(
    id: 0,
    question: '',
    pollAnswers: [],
  );
  String? selectedAnswerId; // Track the selected answer ID

  @override
  void initState() {
    super.initState();

    pollDetailsCubit.getPollById(
      pollId: widget.pollItem.id!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MasterWidget(
      isBackEnabled: true,
      screenTitle: context.tr("poll"),
      hasScroll: false,
      widget: BlocProvider(
        create: (context) => pollDetailsCubit,
        child: BlocConsumer<PollDetailsCubit, PollDetailsState>(
          listener: (context, state) {
            if (state is PollDetailsLoadingState) {
              ViewsToolbox.showLoading();
            } else if (state is PollDetailsReadyState) {
              ViewsToolbox.dismissLoading();
              pollDetailsEntity = state.response.data!;
            } else if (state is PollDetailsErrorState) {
              ViewsToolbox.dismissLoading();
              ViewsToolbox.showErrorAwesomeSnackBar(context, state.message!);
            }
          },
          buildWhen: (previous, current) => current is PollDetailsReadyState,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainTitleWidget(title: pollDetailsEntity.question ?? ""),
                  20.verticalSpace,
                  if (pollDetailsEntity.pollAnswers?.isNotEmpty ?? false)
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:
                                  pollDetailsEntity.pollAnswers!.map((answer) {
                                return RadioListTile<String>(
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  fillColor: WidgetStateProperty.all(
                                      Palette.primaryColor),
                                  title: AppText(
                                      text: answer.answer,
                                      style: AppTextStyle.semiBold_16),
                                  value: answer.id.toString(),
                                  groupValue:
                                      selectedAnswerId, // Use the tracked value
                                  onChanged: (value) {
                                    setState(() {
                                      selectedAnswerId =
                                          value; // Update the selected answer
                                    });
                                  },
                                );
                              }).toList()),
                          Spacer(),
                          CustomElevatedButton(
                            onPressed: () {
                              if (selectedAnswerId != null) {
                                // Handle the submission of the selected answer
                                // You can call a method or perform an action here
                                print("Selected Answer ID: $selectedAnswerId");
                              } else {
                                // Show a message to select an answer
                                ViewsToolbox.showErrorAwesomeSnackBar(context,
                                    context.tr("please_select_an_answer"));
                              }
                            },
                            text: context.tr("submit"),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
