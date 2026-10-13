import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Логотип «БЗ» + назва.
class BrandMark extends StatelessWidget {
  const BrandMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black, width: 1.5),
          ),
          alignment: Alignment.center,
          child: const Text('БЗ',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w800)),
        ),
        const SizedBox(width: 10),
        const Text('БЮРО ЗНАХІДОК',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
      ],
    );
  }
}

/// Верхня панель: профільна (з пошуком по центру) або головна.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String searchHint;
  final bool dark;
  final VoidCallback? onProfile;
  final VoidCallback? onLogoTap;

  const AppTopBar({
    super.key,
    this.searchHint = 'Пошук речей...',
    this.dark = false,
    this.onProfile,
    this.onLogoTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final narrow = MediaQuery.of(context).size.width < 700;
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          InkWell(onTap: onLogoTap, child: const BrandMark()),
          if (!narrow) ...[
            const SizedBox(width: 48),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: SizedBox(
                    height: 34,
                    child: TextField(
                      style: const TextStyle(fontSize: 13),
                      decoration: InputDecoration(
                        hintText: searchHint,
                        hintStyle: const TextStyle(
                            fontSize: 13, color: AppColors.muted),
                        prefixIcon: const Icon(Icons.search,
                            size: 18, color: AppColors.muted),
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: dark ? AppColors.white : AppColors.background,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(
                              color: dark ? AppColors.black : AppColors.border),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                          borderSide: BorderSide(color: AppColors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 48),
          ] else
            const Spacer(),
          if (narrow)
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, size: 20)),
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none, size: 20)),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                        color: AppColors.black, shape: BoxShape.circle)),
              ),
            ],
          ),
          IconButton(
            onPressed: onProfile,
            icon: const Icon(Icons.person_outline, size: 20),
          ),
        ],
      ),
    );
  }
}
