import 'package:financy_app/service/firebase_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/features/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double avatarRadius = 50;
  final double topHeight = 200;

  late User? user;
  late String name;
  late String email;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    name = user?.displayName ?? "Usuário";
    email = user?.email ?? "email@exemplo.com";
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      print('✅ Usuário deslogado com sucesso');

      if (!mounted) return; // evita usar context se o widget já foi desmontado

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const SignInPage()),
        (route) => false,
      );
    } catch (e) {
      print('❌ Erro ao terminar sessão: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Erro ao terminar sessão: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Topo roxo com curva
            Container(
              height: topHeight,
              decoration: const BoxDecoration(
                color: AppColors.purpleButton,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 60),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Merriweather',
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 60,
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
              top: topHeight - avatarRadius,
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

            // Conteúdo abaixo do avatar
            Container(
              margin: EdgeInsets.only(top: topHeight + avatarRadius + 16),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    email,
                    style: const TextStyle(
                      color: AppColors.purpleButton,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Ações
                  _buildActionRow(Icons.edit, "Change name", () {}),
                  const SizedBox(height: 15),
                  _buildActionRow(Icons.lock, "Change password", () {}),
                  const SizedBox(height: 15),

                  // Logout funcional
                  _buildActionRow(
                    Icons.exit_to_app,
                    "Log out",
                    _logout,
                    iconColor: Colors.red,
                    textColor: Colors.red,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
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
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 10),
              Text(text, style: TextStyle(color: textColor, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
