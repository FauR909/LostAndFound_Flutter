import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Біла картка з рамкою та (опціонально) жорсткою чорною тінню.
class AuthCard extends StatelessWidget {
  final Widget child;
  final bool hardShadow;
  final double width;

  const AuthCard({
    super.key,
    required this.child,
    this.hardShadow = true,
    this.width = 400,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          color: hardShadow ? AppColors.black : AppColors.border,
          width: hardShadow ? 1.5 : 1,
        ),
        boxShadow: hardShadow
            ? const [BoxShadow(color: AppColors.black, offset: Offset(4, 4))]
            : null,
      ),
      child: child,
    );
  }
}

/// Квадратний логотип з іконкою.
class LogoBox extends StatelessWidget {
  final IconData? icon;
  const LogoBox({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black, width: 1.5),
      ),
      child: Center(
        child: icon != null
            ? Icon(icon, size: 22, color: AppColors.black)
            : Container(width: 8, height: 8, color: AppColors.black),
      ),
    );
  }
}
