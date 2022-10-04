// import 'package:flutter/material.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({super.key});

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   bool _isLoggedIn = false;
//   Map _userObj = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       width: MediaQuery.of(context).size.width,
//       child: _isLoggedIn == true
//           ? Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                   Text(_userObj['name']),
//                   Text(_userObj['email']),
//                   TextButton(
//                       onPressed: () {
//                         FacebookAuth.instance.logOut().then((value) {
//                           setState(() {
//                             _isLoggedIn = false;
//                             _userObj = {};
//                           });
//                         });
//                       },
//                       child: Text('Logout'))
//                 ])
//           : Container(
//               child: ElevatedButton(
//                   child: Text('Login with Facebook'),
//                   onPressed: () async {
//                     FacebookAuth.instance
//                         .login(permissions: ['public_profile', 'email']).then(
//                             (value) => FacebookAuth.instance
//                                     .getUserData()
//                                     .then((userData) async {
//                                   setState(() {
//                                     _isLoggedIn = true;
//                                     _userObj = userData;
//                                   });
//                                 }));
//                   })),
//     ));
//   }
// }
