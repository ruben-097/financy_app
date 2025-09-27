import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.gradientPurple,
          ),
        ),
        child: const Text(
          'Financy',
          style: TextStyle(
            fontFamily: 'Merriweather',
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: AppColors.whiteText,
          ),
        ),
      ),
    );
  }
}
