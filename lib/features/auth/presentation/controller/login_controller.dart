import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';

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
    }
  }

  // Forgot password
  void forgotPassword() {
    // TODO: Navigate to forgot password screen
    Get.snackbar(
      AppTexts.info,
      AppTexts.forgotPasswordClicked,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void registerNow() {
    Get.snackbar(
      AppTexts.info,
      AppTexts.registerNowClicked,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return AppTexts.pleaseEnterUsername;
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

