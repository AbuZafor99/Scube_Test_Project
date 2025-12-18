import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    primaryColor: AppColors.primaryBackground,
    colorScheme: ColorScheme.light(primary: AppColors.primaryBackground),

    textTheme: GoogleFonts.interTextTheme(),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
