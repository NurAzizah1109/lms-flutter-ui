import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'views/login_view.dart';
import 'views/dashboard_view.dart';
import 'views/splash_view.dart';
import 'views/class_detail_view.dart';
import 'views/announcement_detail_view.dart';
import 'views/material_detail_view.dart';
import 'views/assignments_view.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatelessWidget {
  const LMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/login', // Keep as login for flow
      routes: {
        '/': (context) => const SplashView(),
        '/login': (context) => const LoginView(),
        '/dashboard': (context) => const DashboardView(),
        '/class-detail': (context) => const ClassDetailView(),
        '/announcement-detail': (context) => const AnnouncementDetailView(),
        '/material-detail': (context) => const MaterialDetailView(),
        '/assignments': (context) => const AssignmentsView(),
      },
    );
  }
}
