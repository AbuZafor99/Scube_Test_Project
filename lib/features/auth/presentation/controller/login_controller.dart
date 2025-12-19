import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:scube_task_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:scube_task_app/features/home/presentation/screens/home_screen.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final RxBool rememberMe = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  Future<void> login() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      
      await Future.delayed(const Duration(seconds: 2));
      
      isLoading.value = false;
      
      Get.snackbar(
        AppTexts.success,
        AppTexts.loginSuccess,
        snackPosition: SnackPosition.BOTTOM,
      );
      
      Get.offAll(() => const HomeScreen());
    }
  }

  void forgotPassword() {
    Get.to(() => const ForgotPasswordScreen());
  }

  void registerNow() {
    Get.to(() => const SignupScreen());
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.pleaseEnterUsername;
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.pleaseEnterPassword;
    }
    if (value.length < 6) {
      return AppTexts.passwordMinLength;
    }
    return null;
  }
}

