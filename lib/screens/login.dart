import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sastobazar/screens/home_page.dart';
import 'package:sastobazar/screens/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  bool isLoading = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

// void _submitForm() async {
//     setState(() {
//       _registerFormLoading = true;
//     });
//     String _loginAccountFeedBack = await _loginAccount();
//     if (_loginAccountFeedBack != null) {
//       _alertDiaglogBuilder(_loginAccountFeedBack);
//       setState(() {
//         _registerFormLoading = false;
//       });
//     }
//   }

//   Future<String> _loginAccount() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _loginEmail, password: _loginPassword);
//       return null;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         return ('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         return ('The account already exists for that email.');
//       }
//       return e.message.toString();
//     } catch (e) {
//       return (e.toString());
//     }
//   }

  FocusNode _email;

  @override
  void initState() {
    super.initState();
    _email = FocusNode();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  setUserStatus(bool userStatus) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("visitingFlag", userStatus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.asset(
                    "assets/background.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Image.asset(
                        "assets/logo.png",
                        height: 30,
                        width: 30,
                        alignment: Alignment.center,
                      )),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        "SastoBazar",
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                letterSpacing: 1)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 180,
                        child: Text(
                          "Buy with comfort.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: Colors.white54,
                                letterSpacing: 0.6,
                                fontSize: 11),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 23,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 45),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                focusNode: _email,
                                textInputAction: TextInputAction.next,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: _emailController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  email = val;
                                },
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Colors.white70, fontSize: 15),
                                ),
                                onSaved: (val) {
                                  email = val;
                                },
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      // if (isLoading) {
                                      //   return;
                                      // }
                                      if (_emailController.text.isEmpty ||
                                          _passwordController.text.isEmpty) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    "Please Fill all fileds")));
                                        return;
                                      }
                                      var data = await login(
                                          _emailController.text,
                                          _passwordController.text);
                                      print(data);
                                      if (data == '"Success"') {
                                        await setUserStatus(true);
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomePage(),
                                          ),
                                          (route) => false,
                                        );
                                      } else {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text("Invalid User")));
                                      }
                                      setState(() {
                                        isLoading = true;
                                      });
                                      //Navigator.pushReplacementNamed(context, "/home");
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 0),
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        "SUBMIT",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                letterSpacing: 1)),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: (isLoading)
                                        ? Center(
                                            child: Container(
                                                height: 26,
                                                width: 26,
                                                child:
                                                    CircularProgressIndicator(
                                                  backgroundColor: Colors.green,
                                                )))
                                        : Container(),
                                    right: 30,
                                    bottom: 0,
                                    top: 0,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(fontSize: 14, color: Colors.white60),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        "assets/google_logo.jpg",
                        height: 36,
                        width: 36,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account?",
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                  letterSpacing: 0.5)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  List userData;
  Future login(email, password) async {
    var url = "http://192.168.0.2:1234/sasto/login.php";
    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });
    return (response.body);
  }
}
