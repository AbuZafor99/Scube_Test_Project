import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/features/auth/presentation/screens/login_screen.dart';
import 'package:scube_task_app/features/details_view/presentation/screens/details_view_screen.dart';

import 'core/theme/app_theme.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScubeApp',
      theme: AppTheme.light,
      home: LoginScreen(),
      getPages: [
        GetPage(name: '/details-view', page: () => const DetailsViewScreen()),
      ],
    );
  }
}
