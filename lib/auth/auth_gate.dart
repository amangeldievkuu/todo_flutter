import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/home.dart';
import 'package:todo/pages/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //when user is logged in
          if (snapshot.hasData) {
            return const Home();
          }
          //when user is not logged in
          else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
