import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/bottom_nav_bar_data/bottom_nav_bar_data.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final navigationBarItems = mainNavigationBarItems(
      homeLabel: 'Home',
      searchLabel: 'Search',
    );

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.white70,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          iconSize: 28,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          items: navigationBarItems
              .map(
                (toElement) => BottomNavigationBarItem(
              icon: toElement.child ?? Icon(toElement.icon),
              label: toElement.label,
              tooltip: toElement.tooltip,
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}
