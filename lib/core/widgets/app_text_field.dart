import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Стилізоване текстове поле з підписом, іконкою та перемикачем видимості пароля.
class AppTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final bool uppercaseLabel;
  final Widget? labelTrailing;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final bool thickBorder;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.uppercaseLabel = false,
    this.labelTrailing,
    this.controller,
    this.keyboardType,
    this.textStyle,
    this.thickBorder = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(
        color: widget.thickBorder ? AppColors.black : AppColors.border,
        width: widget.thickBorder ? 2 : 1,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.uppercaseLabel ? widget.label.toUpperCase() : widget.label,
              style: TextStyle(
                fontSize: widget.uppercaseLabel ? 11 : 13,
                fontWeight: FontWeight.w600,
                letterSpacing: widget.uppercaseLabel ? 0.6 : 0,
                color: AppColors.black,
              ),
            ),
            if (widget.labelTrailing != null) widget.labelTrailing!,
          ],
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 44,
          child: TextField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword && _obscure,
            style: widget.textStyle ?? const TextStyle(fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 14, color: AppColors.hint),
              prefixIcon: Icon(widget.icon, size: 18, color: AppColors.muted),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 18,
                        color: AppColors.hint,
                      ),
                      onPressed: () => setState(() => _obscure = !_obscure),
                    )
                  : null,
              contentPadding: EdgeInsets.zero,
              filled: true,
              fillColor: AppColors.white,
              enabledBorder: border,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppColors.black, width: 1.5),
              ),
              border: border,
            ),
          ),
        ),
      ],
    );
  }
}
