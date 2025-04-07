import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';
import 'package:kf_ess_mobile_app/core/helper/language_helper.dart';
import 'package:kf_ess_mobile_app/core/routes/routes.dart';
import 'package:kf_ess_mobile_app/features/di/dependency_init.dart';

extension DateExtensions on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return this.year == now.year && this.month == now.month && this.day == now.day;
  }
}

extension DateStringExtensions on String {
  String showDateWithFormat() {
    try {
      final parsedDate = DateFormat("dd-MMM-yyyy").parse(this);
      if (parsedDate.isToday()) {
        return "today".tr();
      }
      // Explicitly set the locale for the month name
      final isArabic = LanguageHelper.isAr(getIt<AppRouter>().navigatorKey.currentContext!);
      final monthLocale = isArabic ? 'ar' : 'en';
      final monthName = DateFormat("MMMM", monthLocale).format(parsedDate);

      // Format the day and year in English
      final day = DateFormat("dd", "en").format(parsedDate);
      final year = DateFormat("yyyy", "en").format(parsedDate);

      return "$day $monthName $year";
    } catch (e) {
      return this; // Return the original string if parsing fails
    }
  }
}

