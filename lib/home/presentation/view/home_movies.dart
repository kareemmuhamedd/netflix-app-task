import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_app/core/constants/assets_images.dart';
import 'package:flutter_netflix_app/core/di/dependency_injection.dart';
import 'package:flutter_netflix_app/details/presentation/view/movie_details_screen.dart';
import 'package:flutter_netflix_app/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_netflix_app/home/presentation/widgets/grid_view_item.dart';
import 'package:flutter_netflix_app/home/presentation/widgets/widgets.dart';

import '../widgets/home_movie_slide_show.dart';

class HomeMovies extends StatelessWidget {
  const HomeMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeBloc>()..add(const HomeLoadTvShows()),
      child: const HomeMoviesView(),
    );
  }
}

class HomeMoviesView extends StatefulWidget {
  const HomeMoviesView({super.key});

  @override
  State<HomeMoviesView> createState() => _HomeMoviesViewState();
}

class _HomeMoviesViewState extends State<HomeMoviesView> {
  final PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movies = context.select((HomeBloc bloc) => bloc.state.movies);

    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          HomeMovieSlideShow(pageController: _pageController, movies: movies),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                "Movies",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 2 / 3,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(
                          movie: movie,
                        ),
                      ),
                    );
                  },
                  child: GridViewItem(
                    thumbnail: movie.show.image.original.isEmpty
                        ? AssetsImages.placeHolderNetworkImage
                        : movie.show.image.original,
                    title: movie.show.name,
                    summary: movie.show.summary,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

