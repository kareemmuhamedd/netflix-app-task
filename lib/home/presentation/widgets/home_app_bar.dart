import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: Text(
        'Netflix',
        style: context.titleLarge
            ?.copyWith(fontWeight: AppFontWeight.bold, color: AppColors.red),
        overflow: TextOverflow.ellipsis,
      ),
      actions: const [
        Icon(Icons.search),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
