import 'package:flutter/material.dart';
import '../controllers/dashboard_controller.dart';
import 'home_view.dart';
import 'classes_view.dart';
import 'notifications_view.dart';
import 'profile_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final DashboardController _controller = DashboardController();

  final List<Widget> _pages = [
    const HomeView(),
    const ClassesView(),
    const NotificationsView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    // Ideally use Provider/Riverpod/GetX, but for "simple MVC" and no extra deps yet:
    // We'll use AnimatedBuilder or setState. Let's use setState for simplicity as requested,
    // or Listen to the controller for a cleaner separation.
    
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        return Scaffold(
          body: _pages[_controller.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: _controller.selectedIndex,
            onDestinationSelected: _controller.changeIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.book_outlined),
                selectedIcon: Icon(Icons.book),
                label: 'Classes',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
