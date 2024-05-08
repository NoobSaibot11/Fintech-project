import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
          Text(message?.notification?.title ?? 'No title'),
          Text(message?.notification?.body ?? 'No body'),
          Text(message?.data.toString() ?? 'No data'),
        ],
      ),
    );
  }
}
