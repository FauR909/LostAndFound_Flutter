import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/auth_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.medium),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                color: AppColors.black,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 6, height: 6, child: ColoredBox(color: Colors.white)),
                    SizedBox(width: 8),
                    Text('БЮРО ЗНАХІДОК',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.large),
              AuthCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LogoBox(),
                    const SizedBox(height: AppSpacing.medium),
                    const Text('Відновлення пароля',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 8),
                    const Text(
                      'Введіть електронну пошту, і ми надішлемо посилання для відновлення доступу',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12, color: AppColors.muted, height: 1.5),
                    ),
                    const SizedBox(height: AppSpacing.large),
                    const AppTextField(
                      label: 'Електронна пошта',
                      hint: 'name@example.com',
                      icon: Icons.mail_outline,
                      uppercaseLabel: true,
                      thickBorder: true,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        border: Border.all(color: AppColors.black),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.info, size: 12),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Перевірте поштову скриньку після відправки. Посилання буде активним протягом 24 годин.',
                              style: TextStyle(fontSize: 11, height: 1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    PrimaryButton(
                      label: 'Надіслати інструкцію',
                      uppercase: true,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Інструкцію надіслано (демо)')),
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.large),
                    InkWell(
                      onTap: () => Navigator.pushReplacementNamed(
                          context, AppRoutes.login),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back, size: 14),
                          SizedBox(width: 8),
                          Text('Повернутися до входу',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
