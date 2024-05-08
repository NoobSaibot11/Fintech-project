import 'package:digischool/Models/DrawerPages/SettingsPage/settings_page.dart';
import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          borderRadius: BorderRadius.zero,
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader with Divider
            Container(
              height: 50,
              color: const Color.fromRGBO(0, 0, 0, 0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 10),
                    child: Text(
                      'DigiSchool Storage',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 10,
                  ),
                ],
              ),
            ),            ListTile(
              leading: const Icon(Icons.access_time_outlined),
              title: const Text('Recent'),
              onTap: () {
                // Add logic for Recent
              },
            ),
            ListTile(
              leading: const Icon(Icons.offline_bolt_outlined),
              title: const Text('Offline'),
              onTap: () {
                // Add logic for Offline
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outlined),
              title: const Text('Trash'),
              onTap: () {
              },
            ),
            ListTile(
              leading: const Icon(Icons.report_outlined),
              title: const Text('Spam'),
              onTap: () {
                // Add logic for Spam
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              onTap: () {
                // Add logic for Notifications
              },
            ),
            ListTile(
              leading: const Icon(Icons.backup_outlined),
              title: const Text('Backups'),
              onTap: () {
                // Add logic for Backups
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                // Add logic for Settings
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.storage_outlined),
              title: const Text('Storage'),
              subtitle: const Text('3.73 GB of 5 GB used'),
              onTap: () {
                // Add logic for Storage
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LinearProgressIndicator(
                value: 0.75, // Replace with actual storage utilization value (between 0.0 and 1.0)
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
