import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';  // Import Bloc package
import 'package:flutter_netflix_app/home/presentation/view/home_movies.dart';
import '../../../navigation/view/bottom_nav_bar.dart';
import '../../../search/presentation/view/search_screen.dart';
import '../../../navigation/cubit/bottom_nav_cubit.dart';  // Import BottomNavCubit

List<Widget> bottomNavScreens = [
  const HomeMovies(),
  const SearchScreen(),
];

class EntryPoint extends StatelessWidget {
  const EntryPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          // Display the screen based on the selected index
          return bottomNavScreens[currentIndex];
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
