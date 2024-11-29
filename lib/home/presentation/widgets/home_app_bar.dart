import 'package:flutter/material.dart';
import 'package:app_ui/app_ui.dart';
import '../../../search/presentation/view/search_screen.dart';

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
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Navigate to the search screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const SearchScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
