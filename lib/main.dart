import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sastobazar/screens/home_page.dart';
import 'package:sastobazar/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

var userStatus;

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool status = preferences.getBool("visitingFlag");
    return status;
  }

  int timeForTimer = 1;
  void checkVisitingStatus() async {
    bool status = await getVisitingFlag();
    print(status);
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      timeForTimer = timeForTimer - 1;
      if (timeForTimer == 0) {
        if (status == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //checkVisitingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sasto Bazar',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
            body: FutureBuilder<Object>(
                future: getVisitingFlag(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  if (snapshot.data == true) {
                    return HomePage();
                  } else if (snapshot.data == false) {
                    return Login();
                  } else if (snapshot.data == null) {
                    return Login();
                  }
                  // if (!snapshot.hasData) {
                  //   return Center(
                  //     child: CircularProgressIndicator(),
                  //   );
                  // }
                })));
  }
}
