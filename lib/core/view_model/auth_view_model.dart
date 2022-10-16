import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/helper/local_storage_data.dart';
import 'package:my_app/model/user_model.dart';
import 'package:my_app/view/home_view.dart';

import '../../view/control_view.dart';
import '../services/firestore_user.dart';

class AuthViewModel extends GetxController {
  //GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //FacebookLogin _facebookLogin = FacebookLogin();

  late String email, password, name;
  Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;
  //User? get users => _user.value;

  final LocalStorageData localStorageData = Get.find();

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

  // void googleGignInMethod() async {
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleUser!.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleSignInAuthentication.idToken,
  //     accessToken: googleSignInAuthentication.accessToken,
  //   );

  //   await _auth.signInWithCredential(credential).then((user) {
  //     saveUser(user);
  //     Get.offAll(() => ControlView());
  //   });
  // }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);

    // UserCredential? userCredential =
    //     await _auth.signInWithCredential(credential).then((user) {
    //   saveUser(user);
    //   Get.offAll(() => ControlView());
    // });
    // User? user = userCredential!.user;
    // Get.offAll(() => ControlView());

    // if (user != null) {
    //   if (userCredential.additionalUserInfo!.isNewUser) {
    //     // add the data to fire base
    //     await _firestore.collection('Users').doc(user.uid).set({
    //       'name': user.displayName,
    //       'userId': user.uid,
    //       'pic': user.photoURL,
    //       'email': user.email
    //     });
    //   }
    // }
    await _auth.signInWithCredential(credential).then((user) {
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
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireStoreUser().getCurrentUser(value.user!.uid).then((value) {
          setUser(UserModel.fromJson(value.data() as Map<String, dynamic>));
        });
      });
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

      Get.offAll(ControlView());
    } catch (e) {
      Get.snackbar('Error', 'account not created',
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 7, left: 15, right: 15));
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: user.user!.displayName == null ? name : user.user!.displayName,
        pic: user.user!.photoURL == null
            ? 'https://firebasestorage.googleapis.com/v0/b/my-app-7759c.appspot.com/o/nike%20blue%20hoodie.png?alt=media&token=1bca89fd-da5e-4559-bff9-a08407674aad'
            : user.user!.photoURL);
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
