import 'package:flutter/material.dart';
import 'features/auth/forgot_password_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/auth/register_screen.dart';
import 'features/home/home_screen.dart';
import 'features/profile/change_password_screen.dart';
import 'features/profile/profile_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const forgot = '/forgot';
  static const home = '/home';
  static const profile = '/profile';
  static const changePassword = '/change-password';

  static Map<String, WidgetBuilder> get table => {
        login: (_) => const LoginScreen(),
        register: (_) => const RegisterScreen(),
        forgot: (_) => const ForgotPasswordScreen(),
        home: (_) => const HomeScreen(),
        profile: (_) => const ProfileScreen(),
        changePassword: (_) => const ChangePasswordScreen(),
      };
}
