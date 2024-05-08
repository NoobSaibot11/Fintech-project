import 'package:flutter/material.dart';

import 'SubSettings/app_lang.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('DigiSchool',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto'
        ),
        ),
      ),
      body: ListView(
        children: [
          _buildSection('Settings', [
            _buildSettingsItem(Icons.security_outlined, 'Privacy and Security', context),
            _buildSettingsItem(Icons.storage_outlined, 'Data & Storage', context),
            _buildSettingsItem(Icons.devices_outlined, 'Devices', context),
            _buildSettingsItem(Icons.language_outlined, 'Language', context),

          ]),
          const Divider(), // Add a divider between sections
          _buildSection('Help', [
            _buildHelpItem(Icons.question_answer_outlined, 'Ask a question'),
            _buildHelpItem(Icons.help_outlined, 'DigiSchool FAQ'),
            _buildHelpItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
          ]),
        ],
      ),
    );
  }
  Widget _buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Column(
          children: items,
        ),
      ],
    );
  }
  Widget _buildSettingsItem(IconData icon, String title, BuildContext context) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: () {
      // Handle tap for Privacy and Security, Data & Storage, Devices
      if (title == 'Language') {
        // Redirect to AppLanguages Page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const AppLanguagesPage()),
        );
      } else {
        // Handle tap for Privacy and Security, Data & Storage, Devices
        // Add your logic here
      }
    },
  );
}


  Widget _buildHelpItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Handle tap for Ask a question, DigiSchool FAQ, Privacy Policy
      },
    );
  }
}