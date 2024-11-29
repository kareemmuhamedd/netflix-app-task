import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_app/home/presentation/view/home_movies.dart';
import '../../search/presentation/view/search_screen.dart';
import '../cubit/bottom_nav_cubit.dart';
import 'bottom_nav_bar.dart';

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
          return bottomNavScreens[currentIndex];
        },
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
