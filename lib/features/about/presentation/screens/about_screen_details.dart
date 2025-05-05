import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/app_text.dart';
import '../../../shared/widgets/master_widget.dart';

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
      isBackEnabled: true,

        widget: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            
            child: SingleChildScrollView(
              child: AppText(
             
                maxLines: 100,
                text: details,
                textAlign: TextAlign. justify,
              ),
            ),
          ),
        ));
  }
}
