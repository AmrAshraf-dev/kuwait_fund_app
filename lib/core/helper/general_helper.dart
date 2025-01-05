import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class GeneralHelper {
  static getWelcomeMessage(BuildContext context) {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return context.tr('good_morning');
    } else if (hour < 17) {
      return context.tr('good_afternoon');
    } else {
      return context.tr('good_evening');
    }
  }
}
