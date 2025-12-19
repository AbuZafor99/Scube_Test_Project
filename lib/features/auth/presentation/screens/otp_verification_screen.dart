import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/core/theme/app_buttoms.dart';
import 'package:scube_task_app/features/auth/presentation/controller/forgot_password_controller.dart';
import 'package:scube_task_app/features/auth/presentation/widgets/login_header_widget.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is already put by previous screen, but use Get.find to be safe or put if direct access
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
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      const Text(
                        'Verification',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Mask Email Logic
                      Builder(
                        builder: (context) {
                          final email = controller.emailController.text;
                          String maskedEmail = email;
                          if (email.contains('@')) {
                            final parts = email.split('@');
                            if (parts[0].length > 2) {
                              maskedEmail = '${parts[0].substring(0, 2)}***@${parts[1]}';
                            } else {
                              maskedEmail = '${parts[0]}***@${parts[1]}';
                            }
                          }
                          
                          return Text(
                            'Enter the 4 digit code sent to $maskedEmail',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                          );
                        }
                      ),

                      const SizedBox(height: 32),
                      
                      // 4 Separate Box OTP Input
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 60,
                            height: 60,
                            child: TextField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  // Move to next field
                                  FocusScope.of(context).nextFocus();
                                }
                                // Update controller OTP value logic would be needed here for real joining
                                // For now, simpler implementation:
                                if (controller.otpCode.value.length < 4) {
                                  controller.otpCode.value += value;
                                }
                              },
                              style: const TextStyle(fontSize: 24, color: Colors.black),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counterText: "",
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF00A8E8), width: 1.5),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      
                      const SizedBox(height: 32),
                      
                      Obx(() => PrimaryButton(
                        onPressed: controller.verifyOtp,
                        text: 'Verify',
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
}
