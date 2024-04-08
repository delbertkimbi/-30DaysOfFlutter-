import 'package:flutter/material.dart';
import 'package:settings_screen/models.dart';
import 'package:settings_screen/preferences_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _userNameController = TextEditingController();
  var _selctedGender = Gender.feMale;
  var _selectedlanguages = <Languages>{};
  var _isEmployed = false;
  final PreferencesServices _preferencesServices = PreferencesServices();
  @override
  void initState() {
    _populateFields();
    super.initState();
  }

  void _populateFields() async {
    final settings = await _preferencesServices.getSettings();

    setState(() {
      _userNameController.text = settings.userName;
      _selctedGender = settings.gender as Gender;
      _selectedlanguages = settings.languages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _userNameController,
              decoration: const InputDecoration(hintText: 'Username'),
            ),
          ),
          RadioListTile(
            title: const Text("Male"),
            value: Gender.male,
            groupValue: _selctedGender,
            onChanged: (newValue) => setState(
              () {
                _selctedGender = newValue!;
              },
            ),
          ),
          RadioListTile(
            title: const Text("Female"),
            value: Gender.feMale,
            groupValue: _selctedGender,
            onChanged: (newValue) => setState(
              () {
                _selctedGender = newValue!;
              },
            ),
          ),
          RadioListTile(
            title: const Text("Other"),
            value: Gender.other,
            groupValue: _selctedGender,
            onChanged: (newValue) => setState(
              () {
                _selctedGender = newValue!;
              },
            ),
          ),
          CheckboxListTile(
            title: const Text('Dart'),
            value: _selectedlanguages.contains(Languages.dart),
            onChanged: (_) {
              setState(() {
                _selectedlanguages.contains(Languages.dart)
                    ? _selectedlanguages.remove(Languages.dart)
                    : _selectedlanguages.add(Languages.dart);
              });
            },
          ),
          CheckboxListTile(
            title: const Text('C '),
            value: _selectedlanguages.contains(Languages.C),
            onChanged: (_) {
              setState(() {
                _selectedlanguages.contains(Languages.C)
                    ? _selectedlanguages.remove(Languages.C)
                    : _selectedlanguages.add(Languages.C);
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Java'),
            value: _selectedlanguages.contains(Languages.java),
            onChanged: (_) {
              setState(() {
                _selectedlanguages.contains(Languages.java)
                    ? _selectedlanguages.remove(Languages.java)
                    : _selectedlanguages.add(Languages.java);
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Kotlin'),
            value: _selectedlanguages.contains(Languages.kotline),
            onChanged: (_) {
              setState(() {
                _selectedlanguages.contains(Languages.kotline)
                    ? _selectedlanguages.remove(Languages.kotline)
                    : _selectedlanguages.add(Languages.kotline);
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Python'),
            value: _selectedlanguages.contains(Languages.python),
            onChanged: (_) {
              setState(() {
                _selectedlanguages.contains(Languages.python)
                    ? _selectedlanguages.remove(Languages.python)
                    : _selectedlanguages.add(Languages.python);
              });
            },
          ),
          SwitchListTile(
            title: const Text("isEmployed"),
            value: _isEmployed,
            onChanged: (newValue) => setState(
              () {
                _isEmployed = newValue;
              },
            ),
          ),
          TextButton(
            onPressed: () {
              _saveSettings();
            },
            child: const Text('Save settings'),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    final newSettings = Settings(
        userName: _userNameController.text,
        gender: _selctedGender.toString(),
        languages: _selectedlanguages,
        isEmployed: _isEmployed);
    _preferencesServices.saveSettings(newSettings);
  }
}
