import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/common/constants/app_texts.dart';
import 'package:scube_task_app/core/theme/app_buttoms.dart';
import 'package:scube_task_app/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:scube_task_app/features/auth/presentation/widgets/login_header_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: controller.formKeyEmail,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      const Text(
                        AppTexts.forgotPassword,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Enter your email address to receive a verification code',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 32),
                      
                      TextFormField(
                        controller: controller.emailController,
                        validator: controller.validateEmail,
                        decoration: _buildInputDecoration('Email Address'),
                        style: const TextStyle(color: Colors.black),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      Obx(() => PrimaryButton(
                        onPressed: controller.sendResetLink,
                        text: 'Send Code',
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
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF00A8E8))),
    );
  }
}
