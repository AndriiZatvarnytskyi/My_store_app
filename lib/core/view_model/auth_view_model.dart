import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/view/home_view.dart';

import '../../view/control_view.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  //FacebookLogin _facebookLogin = FacebookLogin();

  late String email, password, name;
  Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void googleGignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(() => ControlView());
    });
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
      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar('Error', 'wrong email or password',
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 7, left: 15, right: 15));
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(HomeView());
    } catch (e) {
      Get.snackbar('Error', 'account not created',
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 7, left: 15, right: 15));
    }
  }

  void saveUser(UserCredential user) async {
    await FireStoreUser().addUserToFireStore(
        UserModel(userId: user.user!.uid, email: email, name: name, pic: ''));
  }
}
