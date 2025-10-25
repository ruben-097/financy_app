import 'package:financy_app/features/Profile/profile_page.dart';
import 'package:financy_app/features/home/home_page.dart';
import 'package:financy_app/features/onboarding/onboarding_page.dart';

import 'package:financy_app/features/splash/splash_page.dart';
import 'package:financy_app/features/wallate/wallat_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/wallat',
      routes: {
        // '/splash': (context) => const SplashPage(),
        // '/onboarding': (context) => const OnboardingPage(),
        //'/home': (context) => const HomePage(),
        '/wallat': (context) => const WallatPage(),
      },
    );
  }
}
