import 'package:settings_screen/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('username', settings.userName);
    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setString('gender', settings.gender);
    await preferences.setStringList(
        'languages',
        settings.languages
            .map(
              (lang) => lang.index.toString(),
            )
            .toString() as List<String>);
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getString('username');
    final isEmployed = preferences.getBool('isEmployed');
    final gender = preferences.getString('gender');
    final programminglanguageIndicies = preferences.getStringList('languages');
    final programmingLanguages = programminglanguageIndicies
        ?.map((stringIdex) => Languages.values[int.parse(stringIdex)])
        .toSet();

    return Settings(
      userName: username!,
      gender: gender!,
      languages: programmingLanguages!,
      isEmployed: isEmployed!,
    );
  }
}
