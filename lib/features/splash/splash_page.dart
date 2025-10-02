import 'dart:async';

import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
//import 'package:financy_app/features/onboarding/onboarding_page.dart ';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

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
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
