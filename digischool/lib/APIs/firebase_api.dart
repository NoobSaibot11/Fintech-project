import 'package:digischool/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  //create instance of firebase messaging
  final _firebaseMessage=FirebaseMessaging.instance;

  //function to initialize notifications
  Future<void> initNotifications() async{
    //request from user (will prompt user)
    await _firebaseMessage.requestPermission();

    //fetch Firebase Cloud Messaging token for this device
    //final fcmToken= await _firebaseMessage.getToken();

    //print token 
    //print(fcmToken.toString());

    //Initialize further settings for push notifications
    initNotifications();
  }
  //funtion to handle received messages
  void handleMessage(RemoteMessage? message){
    //if message is null
    if(message==null) return;

    //navigate to new screen when message is received and user taps on notification.
    navigatorKey.currentState?.pushNamed(
      '/notification_screen',
      arguments: message,
    );
  }

  //function to initialize foreground and background settings
  Future initPushNotifications() async{
    //handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    //attach event listener for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}