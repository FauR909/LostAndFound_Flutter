import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum ItemStatus { lost, found }

/// Картка оголошення для реєстру знахідок.
class ItemCard extends StatelessWidget {
  final ItemStatus status;
  final IconData icon;
  final String photoLabel;
  final String title;
  final String description;
  final String location;
  final String date;

  const ItemCard({
    super.key,
    required this.status,
    required this.icon,
    required this.photoLabel,
    required this.title,
    required this.description,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final lost = status == ItemStatus.lost;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: AppColors.placeholder,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icon, size: 30, color: AppColors.hint),
                        const SizedBox(height: 8),
                        Text(
                          '[ФОТО: $photoLabel]',
                          textAlign: TextAlign.center,
                          style: AppText.mono.copyWith(
                              fontSize: 10, color: AppColors.hint),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: lost ? AppColors.black : AppColors.white,
                      border: Border.all(color: AppColors.black),
                    ),
                    child: Text(
                      lost ? 'ЗАГУБЛЕНО' : 'ЗНАЙДЕНО',
                      style: AppText.mono.copyWith(
                        fontSize: 9,
                        color: lost ? Colors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                SizedBox(
                  height: 32,
                  child: Text(description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.muted, height: 1.4)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFFAFAFA),
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('# $location',
                    style: AppText.mono
                        .copyWith(fontSize: 10, color: AppColors.muted)),
                Text(date,
                    style: AppText.mono
                        .copyWith(fontSize: 10, color: AppColors.muted)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
