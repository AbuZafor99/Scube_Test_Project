import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/features/home/presentation/screens/home_screen.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  Future<void> signup() async {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;

      Get.snackbar(
        AppTexts.success,
        'Account created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offAll(() => const HomeScreen());
    }
  }

  void loginNow() {
    Get.back();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? validateEmail(String? value) {
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
