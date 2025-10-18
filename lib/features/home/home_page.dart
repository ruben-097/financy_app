import 'package:financy_app/features/home/home_tab.dart';
import 'package:financy_app/features/stats_page/stats_page.dart';
import 'package:financy_app/features/wallate/wallat_page.dart';
import 'package:flutter/material.dart';
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/features/Profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Lista de páginas do PageView
  final List<Widget> _pages = const [
    HomeTab(),
    StatsPage(),
    WallatPage(),
    ProfilePage(),
  ];

  // Função simples para trocar de página
  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    debugPrint('Chamando página ${index + 1}');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages, // chamando a lista de páginas
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint('FAB pressionado!'),
        backgroundColor: AppColors.purpleButton,

        child: const Icon(Icons.add, color: Colors.white),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 248, 245, 245),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0
                    ? AppColors.purpleButton
                    : const Color.fromARGB(255, 66, 64, 64),
              ),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(
                Icons.bar_chart,
                color: _currentIndex == 1
                    ? AppColors.purpleButton
                    : Color.fromARGB(255, 56, 54, 54),
              ),
              onPressed: () => _onItemTapped(1),
            ),
            const SizedBox(width: 40), // espaço para FAB
            IconButton(
              icon: Icon(
                Icons.wallet,
                color: _currentIndex == 2
                    ? AppColors.purpleButton
                    : const Color.fromARGB(255, 41, 40, 40),
              ),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _currentIndex == 3
                    ? AppColors.purpleButton
                    : const Color.fromARGB(255, 41, 40, 40),
              ),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
