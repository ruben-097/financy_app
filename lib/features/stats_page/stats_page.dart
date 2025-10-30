import 'package:financy_app/features/others/transaction.dart';
import 'package:financy_app/features/others/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageFrontState();
}

class _StatsPageFrontState extends State<StatsPage> {
  int selectedTab = 0;
  final labels = ['Day', 'Week', 'Month', 'Year'];

  // Dados mockados apenas para front

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Center(
              child: Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackText,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Tabs animadas
            Row(
              children: List.generate(labels.length, (index) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          labels[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: selectedTab == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: selectedTab == index
                                ? AppColors.purpleButton
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          height: 2,
                          width: selectedTab == index ? 50 : 0,
                          decoration: BoxDecoration(
                            color: AppColors.purpleButton,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 30),

            // Cards mockados
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildCard('Income', '\$1,500', Colors.green),
                  const SizedBox(width: 10),
                  _buildCard('Expense', '\$800', Colors.red),
                  const SizedBox(width: 10),
                  _buildCard('Balance', '\$700', Colors.blue),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Tabela mockada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Top Transaction',
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

  Widget _buildCard(String title, String value, Color color) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
