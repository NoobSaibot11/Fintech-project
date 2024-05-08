import 'package:digischool/Pages/StudentPages/LandingPage/landing_page.dart';
import 'package:digischool/Pages/main_tabs.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LandingPage extends StatelessWidget{
  const LandingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(  
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            return const BottomNavbar();
          }
          else{
            return const AppTab();
          }
        },
      ),
    );
  }
}