import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_top_bar.dart';
import '../../core/widgets/primary_button.dart';
import '../../routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Hardcoded-дані замість бекенду.
  static const String _userName = 'Олена Ковальчук';
  static const String _email = 'olena.kovalchuk@example.com';
  static const String _phone = '+380 (67) 123-45-67';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        searchHint: 'Пошук загублених речей, документів...',
        dark: true,
        onLogoTap: () => Navigator.pushReplacementNamed(context, AppRoutes.home),
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
                    const Text('Профіль',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w800)),
                  ],
                ),
                const SizedBox(height: AppSpacing.medium),
                _card(
                  child: Column(
                    children: [
                      const _Avatar(),
                      const SizedBox(height: 12),
                      const Text(_userName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800)),
                      const SizedBox(height: 4),
                      Text(_email,
                          style: AppText.mono.copyWith(
                              fontSize: 10, color: AppColors.muted)),
                      const SizedBox(height: AppSpacing.medium),
                      const Divider(height: 1),
                      const SizedBox(height: AppSpacing.medium),
                      const _ProfileField(
                          label: 'ІМ’Я',
                          icon: Icons.person_outline,
                          value: _userName),
                      const SizedBox(height: AppSpacing.medium),
                      const _ProfileField(
                          label: 'ТЕЛЕФОН',
                          icon: Icons.phone_outlined,
                          value: _phone),
                      const SizedBox(height: AppSpacing.large),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: 160,
                          child: PrimaryButton(
                            label: 'Зберегти зміни',
                            uppercase: true,
                            mono: true,
                            height: 40,
                            trailingIcon: null,
                            leadingIcon: Icons.check,
                            color: const Color(0xFF0B1220),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Зміни збережено (демо)')),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.medium),
                _card(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      _MenuTile(
                        icon: Icons.inventory_2_outlined,
                        title: 'Мої оголошення',
                        badge: '4',
                        onTap: () {},
                      ),
                      const Divider(height: 1),
                      _MenuTile(
                        icon: Icons.vpn_key_outlined,
                        title: 'Змінити пароль',
                        onTap: () =>
                            Navigator.pushNamed(context, AppRoutes.forgot),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.medium),
                InkWell(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.login, (_) => false),
                  child: Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: const Color(0xFFF2A5A5)),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.logout,
                            size: 14, color: AppColors.danger),
                        const SizedBox(width: 8),
                        Text('ВИЙТИ З АКАУНТУ',
                            style: AppText.mono.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.danger)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _card({required Widget child, EdgeInsets? padding}) => Container(
        width: double.infinity,
        padding: padding ?? const EdgeInsets.all(AppSpacing.large),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.border),
        ),
        child: child,
      );
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              border: Border.all(
                  color: AppColors.hint, width: 1.5, style: BorderStyle.solid),
            ),
            child: const Icon(Icons.person_outline,
                size: 34, color: AppColors.muted),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 22,
              height: 22,
              decoration: const BoxDecoration(
                  color: AppColors.black, shape: BoxShape.circle),
              child:
                  const Icon(Icons.photo_camera, size: 11, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;

  const _ProfileField(
      {required this.label, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: AppText.mono.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.muted,
                letterSpacing: 0.5)),
        const SizedBox(height: 6),
        SizedBox(
          height: 44,
          child: TextFormField(
            initialValue: value,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, size: 16, color: AppColors.muted),
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: AppColors.white,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.black),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.black, width: 1.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? badge;
  final VoidCallback onTap;

  const _MenuTile(
      {required this.icon, required this.title, this.badge, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.border),
              ),
              child: Icon(icon, size: 13, color: AppColors.muted),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w700)),
            ),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(color: AppColors.border),
                ),
                child: Text(badge!,
                    style: AppText.mono
                        .copyWith(fontSize: 10, fontWeight: FontWeight.w700)),
              ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, size: 16, color: AppColors.hint),
          ],
        ),
      ),
    );
  }
}
