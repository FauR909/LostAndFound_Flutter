import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/widgets/app_top_bar.dart';
import '../../core/widgets/item_card.dart';
import '../../routes.dart';

class _Item {
  final ItemStatus status;
  final IconData icon;
  final String photo, title, description, location, date;
  const _Item(this.status, this.icon, this.photo, this.title, this.description,
      this.location, this.date);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 0 – усі, 1 – загублено, 2 – знайдено
  int _filter = 0;

  // Hardcoded-дані замість бекенду.
  static const _items = <_Item>[
    _Item(ItemStatus.lost, Icons.credit_card, 'Шкіряний чорний гаманець',
        'Шкіряний чорний гаманець',
        'Всередині водійське посвідчення на ім’я Олександр К. та дві картки.',
        'м. Київ', 'Сьогодні, 14:20'),
    _Item(ItemStatus.found, Icons.watch_outlined, 'Годинник Casio Vintage',
        'Годинник Casio Vintage',
        'Сріблястий сталевий браслет, цифровий дисплей, знайдено біля метро.',
        'Хрещатик', 'Сьогодні, 11:05'),
    _Item(ItemStatus.found, Icons.vpn_key_outlined, 'Ключі від квартири',
        'Ключі від квартири',
        'Зв’язка з 3 ключів з чипом домофону та брелоком у формі маяка.',
        'Поділ', 'Вчора, 18:45'),
    _Item(ItemStatus.lost, Icons.headphones_outlined,
        'Навушники Sony WH-1000XM4', 'Навушники Sony WH-1000XM4',
        'Чорні бездротові навушники у чохлі. Забуті у швидкісному трамваї.',
        'Кільцева дорога', 'Вчора, 09:15'),
    _Item(ItemStatus.found, Icons.description_outlined,
        'Паспорт громадянина України', 'Паспорт громадянина України',
        'Біометричний паспорт у синій обкладинці. Передано черговому.',
        'Вокзал', '12 травня'),
    _Item(ItemStatus.lost, Icons.shopping_bag_outlined, 'Рюкзак Kånken бордовий',
        'Рюкзак Kånken бордовий',
        'Бордовий рюкзак із конспектом та термосом. Дуже дорогий як пам’ять.',
        'Ботсад', '10 травня'),
  ];

  List<_Item> get _visible => _items.where((i) {
        if (_filter == 1) return i.status == ItemStatus.lost;
        if (_filter == 2) return i.status == ItemStatus.found;
        return true;
      }).toList();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cols = width >= 900 ? 3 : (width >= 600 ? 2 : 1);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppTopBar(
        onProfile: () => Navigator.pushNamed(context, AppRoutes.profile),
      ),
      floatingActionButton: _AddButton(onTap: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Column(
        children: [
          _filters(),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    const SizedBox(height: AppSpacing.medium),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _visible.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        mainAxisExtent: 250,
                      ),
                      itemBuilder: (_, i) {
                        final it = _visible[i];
                        return ItemCard(
                          status: it.status,
                          icon: it.icon,
                          photoLabel: it.photo,
                          title: it.title,
                          description: it.description,
                          location: it.location,
                          date: it.date,
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.large),
                    _footer(),
                    const SizedBox(height: 56),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filters() {
    Widget chip(String text, int index) {
      final active = _filter == index;
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: InkWell(
          onTap: () => setState(() => _filter = index),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: active ? AppColors.black : AppColors.white,
              border: Border.all(
                  color: active ? AppColors.black : AppColors.border),
            ),
            child: Text(text,
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: active ? Colors.white : AppColors.black)),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            chip('УСІ', 0),
            chip('ЗАГУБЛЕНО', 1),
            chip('ЗНАЙДЕНО', 2),
            PopupMenuButton<String>(
              tooltip: '',
              offset: const Offset(0, 36),
              color: AppColors.white,
              elevation: 0,
              padding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                side: BorderSide(color: AppColors.black),
              ),
              // Не функціональні: просто показуємо список.
              onSelected: (_) {},
              itemBuilder: (_) => [
                for (final c in const ['ТЕХНІКА', 'ОДЯГ', 'ДОКУМЕНТИ'])
                  PopupMenuItem<String>(
                    value: c,
                    height: 36,
                    child: Text(c,
                        style: const TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w700)),
                  ),
              ],
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration:
                    BoxDecoration(border: Border.all(color: AppColors.border)),
                child: const Row(
                  children: [
                    Text('КАТЕГОРІЯ',
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w700)),
                    SizedBox(width: 6),
                    Icon(Icons.keyboard_arrow_down, size: 14),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('РЕЄСТР ЗНАХІДОК',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(width: 12),
          Text('Оновлено 4 хв тому',
              style: AppText.mono
                  .copyWith(fontSize: 10, color: AppColors.hint)),
          const Spacer(),
          const Text('СОРТУВАННЯ: ',
              style: TextStyle(fontSize: 11, color: AppColors.muted)),
          const Text('Найновіші спочатку',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
          const Icon(Icons.keyboard_arrow_down, size: 14),
        ],
      ),
    );
  }

  Widget _footer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('© 2025 Бюро знахідок',
            style: AppText.mono.copyWith(fontSize: 10, color: AppColors.muted)),
        Row(
          children: [
            Text('Конфіденційність',
                style: AppText.mono
                    .copyWith(fontSize: 10, color: AppColors.muted)),
            const SizedBox(width: 16),
            Text('Допомога',
                style: AppText.mono
                    .copyWith(fontSize: 10, color: AppColors.muted)),
          ],
        ),
      ],
    );
  }
}

class _AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const _AddButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.black,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add, size: 14, color: Colors.white),
              const SizedBox(width: 8),
              Text('ДОДАТИ ОГОЛОШЕННЯ',
                  style: AppText.mono.copyWith(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700)),
            ],
          ),
        ),
      ),
    );
  }
}
