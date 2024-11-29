import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_app/core/di/dependency_injection.dart';
import 'package:flutter_netflix_app/details/presentation/view/movie_details_screen.dart';
import 'package:flutter_netflix_app/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_netflix_app/home/presentation/widgets/grid_view_item.dart';
import 'package:flutter_netflix_app/home/presentation/widgets/widgets.dart';



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
  @override
  Widget build(BuildContext context) {
    final movies = context.select((HomeBloc bloc) => bloc.state.movies);
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CarouselSlider(
                items: movies.map((movie) {
                  return SliderItem(
                    imagePath: movie.show.image.original.isEmpty
                        ? 'https://wallpaperfx.com/view_image/walle-movie-1280x1024-wallpaper-2731.jpg'
                        : movie.show.image.medium,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  viewportFraction: 1.0,
                  scrollPhysics: const BouncingScrollPhysics(),
                  pageSnapping: true,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                "Movies",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),
          // Grid View for Movies
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
                      // Navigate to DetailScreen with the selected movie
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
                          ? 'https://wallpaperfx.com/view_image/walle-movie-1280x1024-wallpaper-2731.jpg'
                          : movie.show.image.original,
                      title: movie.show.name,
                      summary: movie.show.summary,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
