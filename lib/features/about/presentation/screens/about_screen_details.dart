import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/app_text.dart';
import 'package:kf_ess_mobile_app/features/shared/widgets/master_widget.dart';

@RoutePage()
class AboutItemDetailsScreen extends StatelessWidget {
  const AboutItemDetailsScreen(
      {super.key, required this.details, required this.title});

  final String details;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MasterWidget(
        screenTitle: title,
        widget: Center(
          child: AppText(
            text: details,
            textAlign: TextAlign.justify,
          ),
        ));
  }
}
