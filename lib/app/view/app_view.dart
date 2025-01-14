import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Bloc package
import 'package:flutter_netflix_app/entrypoint/view/entry_point.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../entrypoint/cubit/bottom_nav_cubit.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: ScreenUtilInit(
          designSize: screenSize,
          minTextAdapt: true,
          splitScreenMode: false,
          useInheritedMediaQuery: true,
          builder: (_, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Netflix App',
              themeMode: ThemeMode.dark,
              theme: const AppTheme().theme,
              darkTheme: const AppDarkTheme().theme,
              home: const EntryPoint(),
            );
          }),
    );
  }
}
