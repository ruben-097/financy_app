import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WallatPage extends StatelessWidget {
  const WallatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double topContainerHeight = 200;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: topContainerHeight,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.purpleButton,
              borderRadius: const BorderRadius.only(
                // bottomLeft: Radius.elliptical(50, -15),
                // bottomRight: Radius.circular(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
