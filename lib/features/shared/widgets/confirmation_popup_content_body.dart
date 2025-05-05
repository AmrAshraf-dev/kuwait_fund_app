import 'package:flutter/material.dart';
import 'popup_content_body.dart';

 
enum ConfirmationPopupStatus {
  success,
  failure,
  warning,
  information,
}

class ConfirmationPopupContentBody extends StatelessWidget {
  const ConfirmationPopupContentBody({
    super.key,
    required this.status,
    this.actionsData,
    this.showActionsButtons = true,
    this.continueButtonCallback,
    this.message,
    this.firstPopData,
    this.secondPopData,
    this.description,
    this.showDescription = true,
    this.closeOnlyPopup = false,
  });
  final ConfirmationPopupStatus status;
  final bool closeOnlyPopup;
  final String? message;
  final Object? firstPopData;
  final Object? secondPopData;
  final Widget? actionsData;
  final bool showActionsButtons;
  final void Function()? continueButtonCallback;

  final String? description;
  final bool showDescription;

  @override
  Widget build(BuildContext context) {
    return PopupContentBody(
        message: message ?? "",
        firstPopData: firstPopData,
        secondPopData: secondPopData,
        closeOnlyPopup: closeOnlyPopup,
        description: description ?? "",
        assetPath: status == ConfirmationPopupStatus.success
            ? "assets/png/success.png"
            : status == ConfirmationPopupStatus.failure
                ? "assets/png/failure.png"
                : status == ConfirmationPopupStatus.warning
                    ? "assets/png/warning.png"
                    : "assets/png/information.png",
        showActionsButtons: showActionsButtons,
        showDescription: showDescription,
        continueButtonCallback: continueButtonCallback,
        actionsData: actionsData);
  }
}
