import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/app_top_bar.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        searchHint: 'Пошук загублених речей, документів...',
        dark: true,
        onLogoTap: () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.home, (_) => false),
        onProfile: () => Navigator.maybePop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.medium, vertical: AppSpacing.large),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.maybePop(context),
                      child: const Icon(Icons.arrow_back, size: 14),
                    ),
                    const SizedBox(width: 10),
                    const Text('Зміна пароля',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: AppSpacing.medium),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.large),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTextField(
                        label: 'Поточний пароль',
                        hint: 'Введіть поточний пароль',
                        icon: Icons.lock_outline,
                        uppercaseLabel: true,
                        isPassword: true,
                      ),
                      const SizedBox(height: AppSpacing.medium),
                      const Divider(height: 1),
                      const SizedBox(height: AppSpacing.medium),
                      const AppTextField(
                        label: 'Новий пароль',
                        hint: 'Мінімум 8 символів',
                        icon: Icons.vpn_key_outlined,
                        uppercaseLabel: true,
                        isPassword: true,
                      ),
                      const SizedBox(height: AppSpacing.medium),
                      const AppTextField(
                        label: 'Підтвердження нового пароля',
                        hint: 'Повторіть новий пароль',
                        icon: Icons.verified_user_outlined,
                        uppercaseLabel: true,
                        isPassword: true,
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
                                'Після зміни пароля вам потрібно буде увійти в акаунт повторно на інших пристроях.',
                                style: TextStyle(fontSize: 11, height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSpacing.large),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Navigator.maybePop(context),
                            child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(color: AppColors.border),
                              ),
                              alignment: Alignment.center,
                              child: Text('СКАСУВАТИ',
                                  style: AppText.mono.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          SizedBox(
                            width: 190,
                            child: PrimaryButton(
                              label: 'Змінити пароль',
                              uppercase: true,
                              mono: true,
                              height: 40,
                              trailingIcon: null,
                              leadingIcon: Icons.check,
                              color: const Color(0xFF0B1220),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Пароль змінено (демо)')),
                                );
                                Navigator.maybePop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
