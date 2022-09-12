import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/snackbars.dart';
import '../../../core/controllers/authentication.controller.dart';
import '../../../core/controllers/customer.controller.dart';

enum LoginAccountState {
  phoneVerification,
  codeSent,
  codeVerification,
  invalidCode,
  loggedIn,
  error,
}

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();
  final loginState = LoginAccountState.phoneVerification.obs;

  String? get phoneNumber {
    final number = phoneController.text.replaceAll('-', '');
    return '+923$number';
  }

  String? _verificationId;
  int? _forceResendCode;

  onLogin() async {
    final authController = Get.find<AuthenticationController>();
    final customerController = Get.find<CustomerController>();
    if (!(await customerController.isCustomerExist(phoneNumber!))) {
      if (Get.isBottomSheetOpen!) Get.back();
      showAppSnackBar('User Not found', "Please create an account first");
    }
    authController.signInWithPhoneNumber(
      phoneNumber!,
      onCompleteVerification: () {
        loginState.value = LoginAccountState.loggedIn;
      },
      onCodeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _forceResendCode = forceResendingToken;
        loginState.value = LoginAccountState.codeSent;
      },
    );
  }

  onVerifyCode() async {
    loginState.value = LoginAccountState.codeVerification;
    final authController = Get.find<AuthenticationController>();
    try {
      // createAccountState.value = CreateAccountState.codeVerifying;
      await authController.verifyCode(smsCodeController.text, _verificationId!);
      loginState.value = LoginAccountState.loggedIn;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        loginState.value = LoginAccountState.invalidCode;
      } else {
        loginState.value = LoginAccountState.error;
      }
    }
  }
}
