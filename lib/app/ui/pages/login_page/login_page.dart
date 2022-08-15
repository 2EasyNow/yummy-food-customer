import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

import '../../../../assets/assets.gen.dart';
import '../../../config/app_information.dart';
import '../../../controllers/login_controller.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/input_formatters.dart';
import '../../global_widgets/global_widgets.dart';
import '../../global_widgets/timer_button.dart';
import '../../theme/app_colors.dart';
import '../../theme/text_theme.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Log In",
            style: AppTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Icon(
                  FontAwesomeIcons.burger,
                  color: AppColors(context).primary,
                  size: 30.w,
                ),
              ),
              Center(
                child: Text(
                  AppInformation.title,
                  style: AppTextStyle(fontWeight: FontWeight.w800, fontSize: 24.sp),
                ),
              ),
              /////////         Phone Number Field         /////////
              const VerticalSpacer(),
              Text('Phone Number', style: AppTextStyle(color: AppColors(context).grey400)),
              VerticalSpacer(space: 0.5.h),
              TextFormField(
                controller: controller.phoneController,
                autofillHints: const [AutofillHints.telephoneNumber],
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                  PakistanPhoneNumberFormatter(separator: '-', smaple: 'XX-XXXXXXX'),
                ],
                keyboardType: TextInputType.phone,
                validator: (value) {
                  // Valid Phone format XX-XXXXXXX
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  } else if (!RegExp(r'^[0-9]{2}-[0-9]{7}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Assets.icons.call.svg(color: AppColors(context).grey600).paddingSymmetric(vertical: 12),
                  prefix: Text(
                    '+92 3',
                    style: AppTextStyle(
                      color: AppColors(context).onBackground,
                    ),
                  ),
                ),
              ),
              /////////         Email Field         /////////
              /////////         Submit Button         /////////
              VerticalSpacer(space: 0.5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Don't have an account?",
                    style: AppTextStyle(color: AppColors(context).grey600),
                  ),
                  GestureDetector(
                    onTap: () => Get.offNamed(AppRoutes.CREATE_ACCOUNT),
                    child: Text(
                      " Sign Up",
                      style: AppTextStyle(
                        color: AppColors(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpacer(space: 1.h),
              TextButton(
                onPressed: () {
                  // showLoadingBottomSheet(context, title: 'Creating Account');
                  if (!controller.formKey.currentState!.validate()) return;
                  Get.bottomSheet(const _LoginBottomSheet());
                  controller.onLogin();
                },
                style: TextButton.styleFrom(
                  minimumSize: Size(Get.width, 60),
                ),
                child: const Text('Log In'),
              ),
              const VerticalSpacer(),
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      ),
    );
  }
}

class _LoginBottomSheet extends GetView<LoginController> {
  const _LoginBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200, 30),
          ),
        ),
        child: Obx(() {
          switch (controller.loginState.value) {
            case LoginAccountState.phoneVerification:
              return const _LoadingSheetUI(title: 'Verifying Phone Number');
            case LoginAccountState.invalidCode:
              return const _InvalidOTPCodeUI();
            case LoginAccountState.codeSent:
              return const _OTPCodeUI();
            case LoginAccountState.codeVerification:
              return const _LoadingSheetUI(title: 'Verifying OTP Code');
            case LoginAccountState.loggedIn:
              return const _LoggedInSheet();
            case LoginAccountState.error:
              return const _ErrorSheetUI();
          }
        }),
      ),
    );
  }
}

class _InvalidOTPCodeUI extends GetView<LoginController> {
  const _InvalidOTPCodeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Invalid OTP Code',
          style: AppTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacer(),
        const Text('You have entered an invalid OTP code. Please try again.'),
        const VerticalSpacer(),
        TextButton(
          onPressed: () => controller.loginState.value = LoginAccountState.codeSent,
          style: TextButton.styleFrom(
            minimumSize: Size(Get.width, 60),
            backgroundColor: AppColors(context).errorDark,
          ),
          child: Text(
            'Try Again',
            style: AppTextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class _OTPCodeUI extends GetView<LoginController> {
  const _OTPCodeUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enter OTP Code',
            style: AppTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          const VerticalSpacer(),
          OTPTextField(
            length: 6,
            width: MediaQuery.of(context).size.width,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            // spaceBetween: true,
            otpFieldStyle: OtpFieldStyle(
              borderColor: AppColors(context).grey100,
              focusBorderColor: AppColors(context).primary,
              backgroundColor: AppColors(context).grey100,
            ),
            fieldWidth: 50,
            fieldStyle: FieldStyle.box,
            onChanged: (value) {
              controller.smsCodeController.text = value;
            },
          ),
          const VerticalSpacer(),
          TextButton(
            onPressed: controller.onVerifyCode,
            style: TextButton.styleFrom(
              minimumSize: Size(Get.width, 60),
            ),
            child: const Text('Verify'),
          ),
        ],
      ).paddingAll(20),
    );
  }
}

class _LoggedInSheet extends StatelessWidget {
  const _LoggedInSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Successfully Logged In',
          style: AppTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacer(),
        Icon(
          Icons.check_circle,
          color: AppColors(context).success,
          size: 90,
        ),
        const VerticalSpacer(),
        TimerButton(
          onTap: () => Get.offAllNamed(AppRoutes.HOME),
          time: 3,
          backgroundColor: AppColors(context).primary,
          textColor: AppColors(context).onPrimary,
          title: 'Continue',
        ),
      ],
    ).paddingAll(20);
  }
}

class _ErrorSheetUI extends GetView<LoginController> {
  const _ErrorSheetUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Error',
          style: AppTextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        const VerticalSpacer(),
        const Text('Something went wrong. Please try again.'),
        const VerticalSpacer(),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: Get.back,
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(Get.width, 60),
                  side: BorderSide(
                    color: AppColors(context).errorDark,
                  ),
                ),
                child: Text(
                  'Close',
                  style: AppTextStyle(
                    color: AppColors(context).errorDark,
                  ),
                ),
              ),
            ),
            const HorizontalSpacer(),
            Expanded(
              child: TextButton(
                onPressed: controller.onLogin,
                style: TextButton.styleFrom(
                  minimumSize: Size(Get.width, 60),
                ),
                child: const Text('Try Again'),
              ),
            ),
          ],
        )
      ],
    ).paddingAll(20);
  }
}

class _LoadingSheetUI extends StatelessWidget {
  const _LoadingSheetUI({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: SpinKitCircle(
                color: AppColors(context).primary,
              ),
            ),
          )
        ],
      ).paddingAll(20),
    );
  }
}


