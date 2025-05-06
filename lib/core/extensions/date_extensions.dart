import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';


extension DateExtensions on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return this.year == now.year && this.month == now.month && this.day == now.day;
  }
}

extension DateStringExtensions on String {
  String showDateWithFormat() {
    try {
      final parsedDate = DateTime.parse(this);
      if (parsedDate.isToday()) {
        return "today".tr();
      }

      return DateFormat("dd/MM/yyyy", "en").format(parsedDate);
    } catch (e) {
      return this; // Return the original string if parsing fails
    }
  }
}

// extension DateStringExtensions on String {
//   String showDateWithFormat() {
//     try {
//       final parsedDate = DateTime.parse(this);
//       if (parsedDate.isToday()) {
//         return "today".tr();
//       }
//       // Explicitly set the locale for the month name
//       final isArabic = LanguageHelper.isAr(getIt<AppRouter>().navigatorKey.currentContext!);
//       final monthLocale = isArabic ? 'ar' : 'en';
//       final monthName = DateFormat("MMMM", monthLocale).format(parsedDate);

//       // Format the day and year in English
//       final day = DateFormat("dd", "en").format(parsedDate);
//       final year = DateFormat("yyyy", "en").format(parsedDate);

//       return "$day $monthName $year";
//     } catch (e) {
//       return this; // Return the original string if parsing fails
//     }
//   }
// }