import 'package:financy_app/features/Profile/profile_page.dart';
import 'package:financy_app/features/home/home_page.dart';
import 'package:financy_app/features/onboarding/onboarding_page.dart';
import 'package:financy_app/features/sign_in/sign_in_page.dart';

import 'package:financy_app/features/splash/splash_page.dart';
import 'package:financy_app/features/stats_page/stats_page.dart';
import 'package:financy_app/features/wallate/wallat_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/profile',
      routes: {
        // '/splash': (context) => const SplashPage(),
        //  '/onboarding': (context) => const OnboardingPage(),
        '/signin': (context) => const SignInPage(),
        //'/wallat': (context) => WallatPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
