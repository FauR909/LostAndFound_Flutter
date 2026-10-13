import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/auth_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: AuthCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LogoBox(icon: Icons.manage_search),
                const SizedBox(height: AppSpacing.medium),
                const Text('Бюро знахідок',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                const Text('Увійдіть у свій обліковий запис',
                    style: TextStyle(fontSize: 12, color: AppColors.muted)),
                const SizedBox(height: AppSpacing.large),
                const AppTextField(
                  label: 'Електронна пошта',
                  hint: 'name@example.com',
                  icon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppSpacing.medium),
                AppTextField(
                  label: 'Пароль',
                  hint: '••••••••',
                  icon: Icons.lock_outline,
                  isPassword: true,
                  labelTrailing: UnderlinedLink(
                    text: 'Забули пароль?',
                    fontSize: 11,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.forgot),
                  ),
                ),
                const SizedBox(height: AppSpacing.large),
                PrimaryButton(
                  label: 'Увійти',
                  // Без бізнес-логіки: одразу відкриваємо головну сторінку.
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.home),
                ),
                const SizedBox(height: AppSpacing.medium),
                const Divider(height: 1),
                const SizedBox(height: AppSpacing.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Немає акаунту? ',
                        style:
                            TextStyle(fontSize: 12, color: AppColors.muted)),
                    UnderlinedLink(
                      text: 'Зареєструватися',
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.register),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
