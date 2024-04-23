import 'package:mvvm_flutter_app/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  SharedPreferences sharedPreferences;

  AppPreferences({required this.sharedPreferences});

  String getAppLanguage() {
    String? language = sharedPreferences.getString(PREFS_KEY_LANG);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  void setLanguageChanged() {
    String currentLanguage = getAppLanguage();

    if (currentLanguage == LanguageType.ENGLISH.getValue()) {
      sharedPreferences.setString(PREFS_KEY_LANG, LanguageType.URDU.getValue());
    } else {
      sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    }
  }
}
