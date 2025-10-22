import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double topContainerHeight = 270;
    final double avatarRadius = 50;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Topo roxo
          Container(
            height: topContainerHeight,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.purpleButton,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Stack(
              children: [
                // Texto centralizado
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsetsGeometry.only(top: 80),
                    child: Text(
                      'Profile',

                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
                ),

                // Ícone de notificações à direita
                Positioned(
                  right: 0,
                  top: 77,

                  child: Container(
                    height: 28,
                    width: 28,

                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: topContainerHeight - avatarRadius,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: avatarRadius * 2,
                height: avatarRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                  border: Border.all(color: AppColors.whiteColor, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/log.png',

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // Nome e e-mail
          Positioned(
            top: topContainerHeight + avatarRadius + 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  SizedBox(height: 6),
                  Text(
                    'Ruben Miguel Maimona',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'rubenmaimona@gmail.com',
                    style: TextStyle(
                      color: AppColors.purpleButton,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
          ),

          /* Row(
            children: const [
              Icon(Icons.person_2, color: Colors.black, size: 20),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Change Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
