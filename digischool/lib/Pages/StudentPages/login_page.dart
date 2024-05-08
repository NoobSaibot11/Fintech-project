import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digischool/Components/material_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Components/text_field.dart';
import 'forgot_pass_page.dart';
import 'query_resolve.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text Controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    //Loding Progress bar
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        });
    //If user doesn't exist
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email!)
          .set({
        'username': _emailController.text.split('@')[0],
        'About': 'Write Your Background',
        'Full Name': 'Write Your Name',
        'Mobile No.':'Enter Your Mobile No.',
        'Date of Birth':'DD/MM/YYYY'
      });

      //After everything is loaded
      //Navigator.canPop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showerrorMessage(e.code);
    }
  }

  void showerrorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, 
                children: [
              //Email Id
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyTextField(
                      controller: _emailController,
                      hintText: "Email",
                      obscureText: false
                      ),
                      ),
              const SizedBox(
                height: 10,
              ),

              //Password
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MyTextField(
                      controller: _passwordController,
                      hintText: "Password",
                      obscureText: true)),
              const SizedBox(
                height: 18,
              ),

              //Forgot Password
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const ForgotPasswordPage();
                        }));
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              //Sign In button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: MyButton(
                  onTap: signIn,
                  text: "Sign In",
                  bgColor: Colors.black,
                  textColor: Colors.white,
                  showBorder: true,
                ),
              ),

              const SizedBox(
                height: 18,
              ),

              //Issue resolution button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Facing Issue regarding SignIn?',
                    style: TextStyle(fontSize: 12),
                    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const QueryResolutionPage();
                      }));
                    },
                    child: const Text(
                      ' Resolve Query',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
