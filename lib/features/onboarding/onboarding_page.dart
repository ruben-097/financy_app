//import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
//import 'package:material_color_utilities/material_color_utilities.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.whiteColorTwo,
              child: Image.asset('assets/images/onbording.png'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Spend Smarter\n Salve More',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.purpleText,
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),

          SizedBox(height: 16),

          Material(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),

            child: Ink(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: AppColors.gradientPurple2,
                ),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                onTap: () {},
                // Handle button tap},
                child: Container(
                  alignment: Alignment.center,
                  height: 56.0,
                  width: 350.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.gradientPurple2,
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Already have an account? Sign In',
            style: TextStyle(
              color: AppColors.greyText,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
