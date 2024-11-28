import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';


import '../routes/app_routes.dart';
class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final routerConfig = router();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Netflix App',
      themeMode: ThemeMode.dark,
      theme: const AppTheme().theme,
      darkTheme: const AppDarkTheme().theme,
      routerConfig: routerConfig,
    );
  }
}

