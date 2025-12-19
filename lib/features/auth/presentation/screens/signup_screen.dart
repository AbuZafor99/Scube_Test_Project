import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/features/auth/presentation/controller/signup_controller.dart';
import 'package:scube_task_app/features/auth/presentation/widgets/login_header_widget.dart';
import 'package:scube_task_app/features/auth/presentation/widgets/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF00A8E8), // Blue
      body: Column(
        children: [
          LoginHeaderWidget(screenHeight: screenHeight), // Reuse Login Header

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
                  child: SignupFormWidget(controller: controller),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
