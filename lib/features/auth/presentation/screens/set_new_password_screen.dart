import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_buttoms.dart';
import 'package:scube_task_app/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:scube_task_app/features/auth/presentation/widgets/login_header_widget.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotPasswordController>();
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF00A8E8),
      body: Column(
        children: [
          LoginHeaderWidget(screenHeight: screenHeight),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    key: controller.formKeyReset,
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        const Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Set your new password',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        const SizedBox(height: 32),
                        
                        Obx(() => TextFormField(
                          controller: controller.newPasswordController,
                          validator: controller.validatePassword,
                          obscureText: !controller.isPasswordVisible.value,
                          decoration: _buildInputDecoration('New Password', controller.isPasswordVisible.value, controller.togglePasswordVisibility),
                          style: const TextStyle(color: Colors.black),
                        )),
                        
                        const SizedBox(height: 16),
                        
                        Obx(() => TextFormField(
                          controller: controller.confirmPasswordController,
                          validator: controller.validateConfirmPassword,
                          obscureText: !controller.isConfirmPasswordVisible.value,
                          decoration: _buildInputDecoration('Confirm Password', controller.isConfirmPasswordVisible.value, controller.toggleConfirmPasswordVisibility),
                          style: const TextStyle(color: Colors.black),
                        )),
                        
                        const SizedBox(height: 32),
                        
                        Obx(() => PrimaryButton(
                          onPressed: controller.setNewPassword,
                          text: 'Reset Password',
                          isLoading: controller.isLoading.value,
                          backgroundColor: const Color(0xFF00A8E8),
                          textColor: Colors.white,
                          height: 52,
                          borderRadius: 8,
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint, bool isVisible, VoidCallback toggle) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey),
        onPressed: toggle,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF00A8E8))),
    );
  }
}
