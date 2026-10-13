import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Чорна кнопка підтвердження з текстом та іконкою.
class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? trailingIcon;
  final IconData? leadingIcon;
  final VoidCallback onPressed;
  final bool uppercase;
  final bool mono;
  final double height;
  final Color color;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.trailingIcon = Icons.arrow_forward,
    this.leadingIcon,
    this.uppercase = false,
    this.mono = false,
    this.height = 48,
    this.color = AppColors.black,
  });

  @override
  Widget build(BuildContext context) {
    final style = (mono ? AppText.mono : const TextStyle()).copyWith(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w700,
      letterSpacing: uppercase ? 0.6 : 0,
    );
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Material(
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null) ...[
                Icon(leadingIcon, size: 14, color: Colors.white),
                const SizedBox(width: 8),
              ],
              Text(uppercase ? label.toUpperCase() : label, style: style),
              if (trailingIcon != null) ...[
                const SizedBox(width: 8),
                Icon(trailingIcon, size: 16, color: Colors.white),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Підкреслене посилання (напр. «Увійти», «Зареєструватися»).
class UnderlinedLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double fontSize;

  const UnderlinedLink({
    super.key,
    required this.text,
    required this.onTap,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
