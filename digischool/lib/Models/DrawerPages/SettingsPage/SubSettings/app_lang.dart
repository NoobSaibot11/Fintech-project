import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguagesPage extends StatefulWidget {
  const AppLanguagesPage({Key? key}) : super(key: key);

  @override
  _AppLanguagesPageState createState() => _AppLanguagesPageState();
}

class _AppLanguagesPageState extends State<AppLanguagesPage> {
  late String selectedLanguage;
  late List<String> languages;

  @override
  void initState() {
    super.initState();
    selectedLanguage = 'English'; // Set default language
    languages = [
      'English',
      'Hindi',
      'Marathi',
      'Bengali',
      'Punjabi',
      'Gujarati',
      'Sanskrit',
      'Telugu',
      'Tamil',
      'Kannada',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DigiSchool'),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(languages[index]),
            onTap: () {
              _changeLanguage(languages[index]);
            },
          );
        },
      ),
    );
  }

  Future<void> _changeLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);

    // Update the app's locale to reflect the change
    // You may need to restart the app or rebuild the UI
    // For example, you can use a package like `provider` for state management
    setState(() {
      selectedLanguage = language;
    });
  }
}
