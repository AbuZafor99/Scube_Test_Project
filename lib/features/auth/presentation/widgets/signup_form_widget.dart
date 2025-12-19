import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/theme/app_buttoms.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/features/auth/presentation/controller/signup_controller.dart';

class SignupFormWidget extends StatelessWidget {
  final SignupController controller;

  const SignupFormWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Name Field
          TextFormField(
            controller: controller.nameController,
            validator: controller.validateName,
            decoration: _buildInputDecoration('Full Name'),
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          
          const SizedBox(height: 16),
          
          // Email Field
          TextFormField(
            controller: controller.emailController,
            validator: controller.validateEmail,
            decoration: _buildInputDecoration('Email'),
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          
          const SizedBox(height: 16),
          
          // Password Field
          Obx(() => TextFormField(
            controller: controller.passwordController,
            validator: controller.validatePassword,
            obscureText: !controller.isPasswordVisible.value,
            decoration: _buildInputDecoration(AppTexts.password).copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF9CA3AF),
                  size: 20,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 14),
          )),
          
          const SizedBox(height: 16),
          
          // Confirm Password Field
          Obx(() => TextFormField(
            controller: controller.confirmPasswordController,
            validator: controller.validateConfirmPassword,
            obscureText: !controller.isConfirmPasswordVisible.value,
            decoration: _buildInputDecoration('Confirm Password').copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isConfirmPasswordVisible.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF9CA3AF),
                  size: 20,
                ),
                onPressed: controller.toggleConfirmPasswordVisibility,
              ),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 14),
          )),
          
          const SizedBox(height: 32),
          
          // Sign Up Button
          Obx(() => PrimaryButton(
            onPressed: controller.signup,
            text: 'Sign Up',
            isLoading: controller.isLoading.value,
            backgroundColor: const Color(0xFF00A8E8),
            textColor: Colors.white,
            height: 52,
            borderRadius: 8,
          )),
          
          const SizedBox(height: 16),
          
          // Login Link
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: controller.loginNow,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF00A8E8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFD1D5DB), width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF00A8E8), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      hintStyle: const TextStyle(
        color: Color(0xFF9CA3AF),
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
