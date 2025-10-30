import 'package:financy_app/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

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
                    padding: EdgeInsets.only(top: 80),
                    child: const Text(
                      'Profile',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Merriweather',
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
                    child: const Icon(
                      Icons.notifications,
                      color: AppColors.whiteColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Avatar
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

          // Nome, email e ações
          Positioned(
            top: topContainerHeight + avatarRadius + 16,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  const Text(
                    'Ruben Miguel Maimona',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'rubenmaimona@gmail.com',
                    style: TextStyle(
                      color: AppColors.purpleButton,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),

                  const SizedBox(height: 55),

                  // Change name
                  _buildActionRow(Icons.edit, "Change name", () {}),

                  const SizedBox(height: 15),

                  // Change password
                  _buildActionRow(Icons.lock, "Change password", () {}),

                  const SizedBox(height: 15),

                  // LOG OUT
                  _buildActionRow(
                    Icons.exit_to_app,
                    "Log out",
                    () {
                      FirebaseAuthService().signOut(
                        onSuccess: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/sign_in', // nome da rota da tela de login
                            (route) => false,
                          );
                        },
                      );
                    },
                    iconColor: Colors.red,
                    textColor: Colors.red,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow(
    IconData icon,
    String text,
    VoidCallback onTap, {
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 17),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 10),
            Text(text, style: TextStyle(color: textColor, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
