import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/auth_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _agree = false;

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
                const SizedBox(height: AppSpacing.small),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_outline, size: 10),
                      SizedBox(width: 6),
                      Text('ЄДИНА СЛУЖБА ПОВЕРНЕННЯ РЕЧЕЙ',
                          style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1)),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.medium),
                const Text('Створення акаунту',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 6),
                const Text(
                  'Зареєструйтесь, щоб публікувати та шукати оголошення',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: AppColors.muted),
                ),
                const SizedBox(height: AppSpacing.large),
                const AppTextField(
                  label: 'Повне ім’я *',
                  hint: 'Олександр Коваленко',
                  icon: Icons.person_outline,
                  uppercaseLabel: true,
                ),
                const SizedBox(height: AppSpacing.medium),
                const AppTextField(
                  label: 'Електронна пошта *',
                  hint: 'name@example.com',
                  icon: Icons.mail_outline,
                  uppercaseLabel: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: AppSpacing.medium),
                const AppTextField(
                  label: 'Номер телефону',
                  hint: '+380 (99) 000-00-00',
                  icon: Icons.phone_outlined,
                  uppercaseLabel: true,
                  keyboardType: TextInputType.phone,
                  labelTrailing: Text('необов’язково',
                      style: TextStyle(fontSize: 9, color: AppColors.hint)),
                ),
                const SizedBox(height: 6),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_outline, size: 10, color: AppColors.hint),
                      SizedBox(width: 4),
                      Text('Приховано до згоди на контакт',
                          style:
                              TextStyle(fontSize: 10, color: AppColors.muted)),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.medium),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppTextField(
                        label: 'Пароль *',
                        hint: 'Мінімум 8 символів',
                        icon: Icons.lock_outline,
                        uppercaseLabel: true,
                        isPassword: true,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: AppTextField(
                        label: 'Підтвердження *',
                        hint: 'Повторіть пароль',
                        icon: Icons.verified_user_outlined,
                        uppercaseLabel: true,
                        isPassword: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.medium),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Checkbox(
                        value: _agree,
                        onChanged: (v) => setState(() => _agree = v ?? false),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                              fontSize: 11,
                              color: AppColors.muted,
                              height: 1.5),
                          children: [
                            TextSpan(text: 'Погоджуюся з '),
                            TextSpan(
                              text: 'Правилами спільноти',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                                text:
                                    ' та обробкою моїх персональних даних для повернення знахідок.'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.large),
                PrimaryButton(
                  label: 'Зареєструватися',
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRoutes.home),
                ),
                const SizedBox(height: AppSpacing.medium),
                const Divider(height: 1),
                const SizedBox(height: AppSpacing.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Вже є акаунт? ',
                        style:
                            TextStyle(fontSize: 12, color: AppColors.muted)),
                    UnderlinedLink(
                      text: 'Увійти',
                      onTap: () =>
                          Navigator.pushReplacementNamed(context, AppRoutes.login),
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
