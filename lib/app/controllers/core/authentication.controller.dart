import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../../utils/firebase.dart';

class AuthenticationController extends GetxController {
  AuthenticationController();

  bool get isUserLoggedIn => FirebaseAuth.instance.currentUser != null;

  // Future<bool> get isUserVerified async {
  //   if (FirebaseAuth.instance.currentUser == null) {
  //     logOut();
  //     return Future.value(false);
  //   }
  //   await FirebaseAuth.instance.currentUser!.reload();
  //   final provider = FirebaseAuth.instance.currentUser!.providerData.first.providerId;
  //   if (!provider.contains("password")) {
  //     return true;
  //   } else {
  //     return FirebaseAuth.instance.currentUser!.emailVerified;
  //   }
  // }

  String? get currentUserId => FirebaseAuth.instance.currentUser?.uid;

  Future signInWithPhoneNumber(
    String phone, {
    required Function onCompleteVerification,
    required Function(String, int?) onCodeSent,
  }) async {
    // final result = await FirebaseAuth.instance.signInWithPhoneNumber(phone);
    FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 60),
      phoneNumber: phone,
      verificationCompleted: (AuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        onCompleteVerification();
      },
      verificationFailed: (FirebaseAuthException exception) {
        if (exception.code == 'invalid-phone-number') {
          throw Exception('The provided phone number is not valid.');
        }
        throw exception;
      },
      codeSent: (verificationId, forceResendingToken) {
        onCodeSent(verificationId, forceResendingToken);
      },
      codeAutoRetrievalTimeout: (verificationId) {
      },
    );
    // final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    // credentials.user!.updateDisplayName(name);
  }

  Future<bool> logOut() async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "Logged out successfully");
    if (FirebaseAuth.instance.currentUser == null) {
      Get.offAllNamed(AppRoutes.SPLASH);
      return true;
    } else {
      return false;
    }
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  Future updateProfileImage(
    File image, {
    Function? onUpdate,
    bool updateAuthInstance = true,
    bool updateDocInstance = true,
  }) async {
    final imageUrl = await FirebaseUtils.uploadFileOnFirebaseStorage(image, "images/profile/${FirebaseAuth.instance.currentUser!.uid}.jpg");
    if (updateAuthInstance) {
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(imageUrl);
    }
    if (updateDocInstance) {
      // await userRef.doc(currentUserId).update(photoUrl: imageUrl);
    }
    if (onUpdate != null) onUpdate();
  }

  Future verifyCode(String smsCode, String verificationId) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future updateProfile(String name, String userName, String role) async {
  //   return await userRef.doc(currentUserId).update(
  //         name: name,
  //         userName: userName,
  //         role: role,
  //         updatedAt: DateTime.now(),
  //       );
  // }
}
