// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:roshan_ecommerce_app/constraints/constants.dart';

// import 'home_page.dart';
// import 'login_page.dart';

// class LandingPage extends StatelessWidget {
//   final Future<FirebaseApp> _initilization = Firebase.initializeApp();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initilization,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
//               child: Text("Error:${snapshot.error}"),
//             ),
//           );
//         }
//         //Connection Initalization Firebase app
//         if (snapshot.connectionState == ConnectionState.done) {
//           //Stream builder can check loginstate live
//           return StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, streamSnapshot) {
//               if (streamSnapshot.hasError) {
//                 return Scaffold(
//                   body: Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
//                     child: Text("Error:${streamSnapshot.error}"),
//                   ),
//                 );
//               }
//               //Connection state active - Do the user login check inside
//               if (streamSnapshot.connectionState == ConnectionState.active) {
//                 //get the user
//                 User user = streamSnapshot.data;
//                 //if user is null user is not logged in
//                 if (user == null) {
//                   return LoginPage();
//                 } else {
//                   return HomePage();
//                 }
//               }
//               //Checking the auth state
//               return Scaffold(
//                 body: Center(
//                   child: Text(
//                     "Checking authication....",
//                     style: Constants.regularHeading,
//                   ),
//                 ),
//               );
//             },
//           );
//         }
//         //Checking the loading state
//         return Scaffold(
//           body: Center(
//             child: Text(
//               "Initilizing app....",
//               style: Constants.regularHeading,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
