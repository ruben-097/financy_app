import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/service/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Transaction {
  final String title;
  final double amount;
  final bool isIncome;
  final DateTime date;

  Transaction({
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.date,
  });
}

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final authService = FirebaseAuthService();
  String userName = 'Usuário';

  final List<Transaction> transactions = [
    Transaction(
      title: "Netflix",
      amount: 1500,
      isIncome: true,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Transaction(
      title: "BFA",
      amount: 200,
      isIncome: false,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      title: "GloboPlay",
      amount: 500,
      isIncome: true,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      title: "Crunchyroll",
      amount: 100,
      isIncome: false,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Transaction(
      title: "Pionner",
      amount: 673,
      isIncome: true,
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Transaction(
      title: "BAI",
      amount: 150,
      isIncome: false,
      date: DateTime.now().subtract(const Duration(days: 7)),
    ),
    Transaction(
      title: "Redbull",
      amount: 52,
      isIncome: false,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      title: "AMDRyzen",
      amount: 78,
      isIncome: true,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    authService.authStateChanges.listen((user) {
      setState(() {
        userName = user?.displayName?.isNotEmpty == true
            ? user!.displayName!
            : user?.email?.split('@')[0] ?? 'Usuário';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Topo roxo
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                    color: AppColors.purpleButton,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 70,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome Back !',
                            style: TextStyle(
                              color: AppColors.greyText3,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            userName,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Card flutuante
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
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: const [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.green,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                              Row(
                                children: const [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Expenses',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 130), // espaçamento abaixo do card
            // Histórico fora do card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Transaction History',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...transactions.map(
                    (tx) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                tx.isIncome
                                    ? Icons.arrow_downward
                                    : Icons.arrow_upward,
                                color: tx.isIncome ? Colors.green : Colors.red,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tx.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "${tx.date.day}/${tx.date.month}/${tx.date.year}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            "\$${tx.amount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: tx.isIncome ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
