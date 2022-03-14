//@dart=2.9
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myown/Auth/login.dart';
import 'package:myown/Auth/signup.dart';
import 'package:myown/dashboard.dart';
import 'package:myown/home.dart';


Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyOwn());
}

class MyOwn extends StatefulWidget {
  @override
  State<MyOwn> createState() => _MyOwnState();
}

class _MyOwnState extends State<MyOwn> {
  
  StreamSubscription<User> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
       initialRoute:
          FirebaseAuth.instance.currentUser == null ? LoginScreen.id : Dashboard.id,
      
      routes: {
        Home.id: (context) => Home(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        Dashboard.id: (context) => Dashboard(),
      },
    );
  }
}
