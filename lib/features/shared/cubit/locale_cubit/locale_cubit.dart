import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

 import '../../data/local_data.dart';

part 'locale_state.dart';

@singleton
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit()
      : super(Locale(LocalData.getLangCode() ?? "ar")); // Default locale

  // Method to access the current locale without context
  Locale getCurrentLocale() {
    return _getLocal();
  }

  // Method to update the locale
  // void setLocale(BuildContext context, Locale locale) {
  //   LocalData.setLangCode(locale.languageCode);
  //   context.setLocale(locale); // Update EasyLocalization context
  //   emit(locale); // Emit the new locale
  //   debugPrint("Locale set to: ${locale.languageCode}");
  //   MyApp.of(context).updateState(); // Force app rebuild
  // }

  void toggleLocale(BuildContext context, bool isEnglish) {
    Locale newLocale;
    if (isEnglish) {
      newLocale = const Locale("en", "US"); // English locale
      LocalData.setLangCode("en");
      LocalData.setBool("languageToggle", true);
    } else {
      newLocale = const Locale("ar", "KW"); // Arabic locale
      LocalData.setLangCode("ar");
       LocalData.setBool("languageToggle", false);

    }
    context.setLocale(newLocale); // Update EasyLocalization context
    emit(newLocale); // Emit the new locale
    debugPrint("Locale toggled to: ${newLocale.languageCode}");
   // MyApp.of(context).updateState(); // Force app rebuild
  }

  Locale _getLocal() {
    Locale locale;
    String? LangCode = LocalData.getLangCode() ?? "ar";
    print("getCurrentLocale LangCode $LangCode");

    if (LangCode == "en") {
      locale = const Locale('en', 'US');
    } else {
      locale = const Locale('ar', 'KW');
    }

    return locale;
  }


}
