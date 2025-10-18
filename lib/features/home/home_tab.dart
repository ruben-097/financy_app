import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // 🔹 Topo roxo com saudação e ícone de sino
          Container(
            height: 270,
            decoration: BoxDecoration(
              color: AppColors.purpleButton,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start, // alinha topo
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back !',
                      style: TextStyle(
                        color: AppColors.greyText3,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Ruben Maimona',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Retângulo com ícone de sino
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.notifications, color: Colors.white),
                ),
              ],
            ),
          ),

          // 🔹 Card flutuante de saldo
          Positioned(
            top: 150,
            left: 20,
            right: 20,
            child: Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 220,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.purpleButton2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Saldo atual
                    const Text(
                      'Total Balance',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '\$2.530,00',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Income e Expenses lado a lado
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Income
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.green,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '\$1.530,00',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          // Expenses
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_upward,
                                color: Color(0xFFD41414),
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Expenses',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  // SizedBox(height: 4),
                                  Text(
                                    '\$500,00',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
