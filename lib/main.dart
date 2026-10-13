import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'routes.dart';

void main() {
  runApp(const LostFoundApp());
}

class LostFoundApp extends StatelessWidget {
  const LostFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Бюро знахідок',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.login,
      routes: AppRoutes.table,
    );
  }
}
