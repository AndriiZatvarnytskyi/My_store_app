import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/view/home_view.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  //FacebookLogin _facebookLogin = FacebookLogin();

  late String email, password, name;
  Rxn<User> _firebaseUser = Rxn<User>();
  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleGignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential);
  }

  // void facebookSigningMethod() async {
  //   FacebookLoginResult result = await _facebookLogin.logIn(['email']);

  //   final accessToken = result.accessToken.token;

  //   if (result.status == FacebookLoginStatus.loggedIn) {
  //     final faceCedential = FacebookAuthProvider.credential(accessToken);

  //     await _auth.signInWithCredential(faceCedential);
  //   }
  // }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    } catch (e) {
      print('e.message');

      Get.snackbar('Error login account', 'e.message');
    }
  }
}
