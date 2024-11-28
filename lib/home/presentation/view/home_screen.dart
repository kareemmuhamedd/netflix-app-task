import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../navigation/view/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return HomeView(
      navigationShell: navigationShell,
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
