//import 'package:flutter/gestures.dart';
import 'package:financy_app/features/sign_in/sign_in_page.dart';
import 'package:financy_app/features/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.whiteColorTwo,
              child: Image.asset('assets/images/onbording.png'),
            ),
          ),
          SizedBox(height: 20),
          FittedBox(
            child: Text(
              'Spend Smarter\n Save More',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.purpleText,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                // Handle button tap},
                child: Container(
                  alignment: Alignment.center,
                  height: 56.0,
                  width: MediaQuery.of(context).size.width * 0.9,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                ),
              ),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: AppColors.purpleText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
        ],
      ),
    );
  }
}
