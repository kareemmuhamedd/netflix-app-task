import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  // Import Bloc package

import '../../core/bottom_nav_bar_data/bottom_nav_bar_data.dart';
import '../cubit/bottom_nav_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({

    super.key,
  });



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
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, currentIndex) {
            return BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                // Update the BottomNavCubit state when an item is tapped
                context.read<BottomNavCubit>().setIndex(index);

                // You can also use the navigationShell to handle internal navigation

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
            );
          },
        ),
      ),
    );
  }
}
