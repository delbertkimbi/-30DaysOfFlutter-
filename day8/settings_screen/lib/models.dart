enum Gender { male, feMale, other }

enum Languages { dart, java, C, kotline, python }

class Settings {
  final String userName;
  final String gender;
  final Set<Languages> languages;
  final bool isEmployed;

  Settings({required this.userName, required this.gender, required this.languages, required this.isEmployed});
}
