import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/not_logged_in.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/app_user_use_case.dart';

import '../../../common/widgets/snackbars.dart';
import '../../../core/controllers/authentication.controller.dart';

enum CreateAccountState {
  info,
  verification,
  verificationSuccess,
  codeSent,
  codeVerification,
  codeVerifying,
  codeVerificationFailed,
  userCreation,
  userCreated,
  error,
}

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final phoneNumberScopeNode = FocusScopeNode();

  String? get phoneNumber {
    final number = phoneController.text.replaceAll('-', '');
    return '+923$number';
  }

  String? _verificationId;
  int? _forceResendCode;

  final smsCodeController = TextEditingController();

  final createAccountState = CreateAccountState.info.obs;

  onCreateAccountWithPhoneNumber() async {
    if (!formKey.currentState!.validate()) return;
    // check if the user is already registered

    final appUserUseCase = Get.find<AppUserUseCase>();
    final isUserRegistered = await appUserUseCase.isUserRegistered(phoneNumber!);
    if (isUserRegistered) {
      if (Get.isBottomSheetOpen!) Get.back();
      showAppSnackBar('User Already Exists', "Please login");
      phoneNumberScopeNode.requestFocus();
      return;
    }

    createAccountState.value = CreateAccountState.verification;
    final authController = Get.find<AuthenticationController>();
    // authController.createUserWithPhone(email, password, name)

    authController.signInWithPhoneNumber(
      phoneNumber!,
      onCompleteVerification: () {
        createAccountState.value = CreateAccountState.userCreation;
        // Next Step is to Save User Data
      },
      onCodeSent: (verificationId, forceResendingToken) {
        _verificationId = verificationId;
        _forceResendCode = forceResendingToken;
        createAccountState.value = CreateAccountState.codeSent;
        // Next Step is ask user to enter code
      },
    );
  }

  onVerifyCode() async {
    final authController = Get.find<AuthenticationController>();
    try {
      // createAccountState.value = CreateAccountState.codeVerifying;
      await authController.verifyCode(smsCodeController.text, _verificationId!);
      createAccountState.value = CreateAccountState.userCreation;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-verification-code') {
        createAccountState.value = CreateAccountState.codeVerificationFailed;
      } else {
        createAccountState.value = CreateAccountState.error;
      }
    }
  }

  void saveUserData() async {
    final appUserUseCase = Get.find<AppUserUseCase>();
    await appUserUseCase.createUser(
      name: nameController.text,
      phone: phoneNumber!,
    );
    createAccountState.value = CreateAccountState.userCreated;
  }

  void onCreateAccount({required Widget processStartDesign}) async {
    if (!formKey.currentState!.validate()) return;
    Get.bottomSheet(processStartDesign);
    onCreateAccountWithPhoneNumber();
  }
}
