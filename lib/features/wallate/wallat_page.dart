import 'package:financy_app/features/others/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

class WallatPage extends StatefulWidget {
  const WallatPage({super.key});

  @override
  State<WallatPage> createState() => _WallatPageState();
}

class _WallatPageState extends State<WallatPage> {
  int selectedTab = 0; // 0 = Transactions | 1 = Upcoming Bills

  @override
  Widget build(BuildContext context) {
    final double topContainerHeight = 160;

    return Scaffold(
      body: Column(
        children: [
          // Topo reto
          Container(
            height: topContainerHeight,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.purpleButton,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            //color: AppColors.purpleButton,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      'Wallat',
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 57,
                  child: Container(
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Conteúdo branco
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Total Balance
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      color: AppColors.darkgreyText,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '\$ 2.530,00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Row de abas selecionáveis (Estilo A)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Transactions
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 0;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Transactions",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selectedTab == 0
                                    ? AppColors.purpleButton
                                    : Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 100,
                              color: selectedTab == 0
                                  ? AppColors.purpleButton
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Upcoming Bills
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTab = 1;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Upcoming Bills",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: selectedTab == 1
                                    ? AppColors.purpleButton
                                    : Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Container(
                              height: 2,
                              width: 120,
                              color: selectedTab == 1
                                  ? AppColors.purpleButton
                                  : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  //onst SizedBox(height: 12),

                  // Conteúdo dinâmico
                  Expanded(
                    child: selectedTab == 0
                        ? ListView.builder(
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              return ListTile(
                                leading: Icon(
                                  transaction.isIncome
                                      ? Icons.arrow_downward
                                      : Icons.arrow_upward,
                                  color: transaction.isIncome
                                      ? Colors.green
                                      : Colors.red,
                                ),
                                title: Text(transaction.title),
                                subtitle: Text(
                                  "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}",
                                ),
                                trailing: Text(
                                  "${transaction.isIncome ? "+" : "-"}\$${transaction.amount}",
                                  style: TextStyle(
                                    color: transaction.isIncome
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: 5, // exemplo: 5 contas a pagar
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: const Icon(Icons.receipt),
                                title: Text("Upcoming Bill ${index + 1}"),
                                subtitle: const Text("Descrição da conta"),
                                trailing: const Text("\$50,00"),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
