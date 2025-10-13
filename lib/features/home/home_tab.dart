import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Corpo principal
      body: Column(
        children: [
          // Topo fixo
          Container(
            height: 250,
            alignment: Alignment.center,
            color: AppColors.purpleText,

            child: const Text(
              'Bem-vindo!\nRuben Miguel',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Conteúdo expandido ocupa o restante da tela
          Expanded(
            child: Container(
              color: Colors.blue.shade50,
              alignment: Alignment.center,
              child: const Text(
                'Aqui vai o conteúdo principal da Home',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),

      // FAB circular com ícone branco
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('FAB pressionado!'),
        backgroundColor: AppColors.purpleText,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
