import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/features/auth/presentation/screens/login_screen.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final otpController = TextEditingController(); // For 6 digit OTP
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxString otpCode = ''.obs;

  final formKeyEmail = GlobalKey<FormState>();
  final formKeyReset = GlobalKey<FormState>();

  @override
  void onClose() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() => isPasswordVisible.value = !isPasswordVisible.value;
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;

  // Step 1: Send Request to Email
  Future<void> sendResetLink() async {
    if (formKeyEmail.currentState?.validate() ?? false) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;

      // Navigate to OTP screen
      Get.toNamed('/otp-verification'); 
    }
  }

  // Step 2: Verify OTP
  Future<void> verifyOtp() async {
    // OTP validation logic (e.g., check length)
    if (otpCode.value.length == 4) { // Assuming 4 digit OTP for simplicity or 6
       isLoading.value = true;
       await Future.delayed(const Duration(seconds: 2));
       isLoading.value = false;

       // Navigate to New Password screen
       Get.toNamed('/set-new-password');
    } else {
      Get.snackbar('Error', 'Please enter a valid OTP code');
    }
  }

  // Step 3: Set New Password
  Future<void> setNewPassword() async {
    if (formKeyReset.currentState?.validate() ?? false) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      isLoading.value = false;

      Get.snackbar(
        AppTexts.success,
        'Password reset successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate back to Login
      Get.offAll(() => const LoginScreen());
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) return 'Please enter a valid email address';
    return null;
  }
   
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return AppTexts.pleaseEnterPassword;
    if (value.length < 6) return AppTexts.passwordMinLength;
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != newPasswordController.text) return 'Passwords do not match';
    return null;
  }
}
