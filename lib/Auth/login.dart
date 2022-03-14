//@dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myown/Auth/authmethod.dart';
import 'package:myown/Auth/signup.dart';
import 'package:myown/dashboard.dart';
import 'animation.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login';
  @override
  State<LoginScreen> createState() => _HomePageState();
}

class _HomePageState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: FadeAnimation(
                            1.6,
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                child: FadeAnimation(
                                    1.5,
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(143, 148, 251, 1),
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 80.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[100]))),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      email = value;
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.mail,
                                            color: Colors.black45),
                                        border: InputBorder.none,
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    keyboardType: TextInputType.emailAddress,
                                    // ignore: missing_return
                                    validator: (String value) {
                                      if (!(value.contains("@")) &&
                                          value.isNotEmpty) {
                                        return 'please enter a valid email address';
                                      }
                                      if (value == null || value.isEmpty) {
                                        return 'please enter email address';
                                      }
                                      ;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    // ignore: missing_return
                                    validator: (String value) {
                                      if (!(value.length > 5) &&
                                          value.isNotEmpty) {
                                        return 'Password should contain more than 5 characters';
                                      }
                                      if (value == null || value.isEmpty) {
                                        return 'please enter password';
                                      }
                                    },
                                    decoration: InputDecoration(
                                        icon: Icon(Icons.lock,
                                            color: Colors.black45),
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    obscureText: true,
                                  ),
                                )
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      /*Align(
                        alignment: Alignment.centerRight,
                        child: FadeAnimation(
                            1.5,
                            Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            )),
                      ),*/
                      SizedBox(
                        height: 10,
                      ),
                      FlatButton(
                        child: FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                              ),
                            )),
                        onPressed: () async {
                          try {
                            final newuser =
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);
                            if (newuser != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Dashboard();
                                  },
                                ),
                              );
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      FadeAnimation(
                        2,
                        Row(children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, right: 15.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          Expanded(
                            child: new Container(
                                margin: const EdgeInsets.only(
                                    left: 15.0, right: 10.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: FadeAnimation(
                            2,
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                              ),
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
