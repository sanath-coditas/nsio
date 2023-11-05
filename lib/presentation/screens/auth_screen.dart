import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nonstopioassignment/constants/text_style_constants.dart';
import 'package:nonstopioassignment/presentation/screens/home_screen.dart';
import 'package:nonstopioassignment/presentation/screens/login_screen.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final firebaseAuthInstance = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseAuthInstance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data != null && snapshot.hasData) {
          return HomeScreen(
            user: snapshot.data!,
          );
        } else if (snapshot.data == null) {
          return const LoginScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: TextStyleConstants.s16W700cFFFFFF,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
