import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'core/authentication.controller.dart';
import 'core/customer.controller.dart';
import '../firestore/customer/customer.dart';

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

class CreateAccountController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  String? get phoneNumber => '+923${phoneController.text}';

  String? _verificationId;
  int? _forceResendCode;

  final smsCodeController = TextEditingController();

  final createAccountState = CreateAccountState.info.obs;

  onCreateAccountWithPhoneNumber() async {
    if (!formKey.currentState!.validate()) return;
    createAccountState.value = CreateAccountState.verification;
    final authController = Get.find<AuthenticationController>();
    // authController.createUserWithPhone(email, password, name)

    authController.signInWithPhoneNumber(
      phoneNumber!,
      onCompleteVerification: () {
        // TODO: Insert the Data in the Firestore
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
    final customerController = Get.find<CustomerController>();
    final customer = Customer(
      name: nameController.text,
      email: emailController.text,
      phone: phoneNumber!,
      address: addressController.text,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
    await customerController.createCustomerDoc(customer);
    createAccountState.value = CreateAccountState.userCreated;
  }
}
