import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_app/search/presentation/widgets/search_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../details/presentation/view/movie_details_screen.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../../../home/presentation/widgets/grid_view_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<HomeBloc>()..add(const HomeLoadTvShows()),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    final movies = context.select((HomeBloc bloc) => bloc.state.movies);
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: const Padding(
            padding: EdgeInsets.all(13),
            child: SearchField(),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          // const SliverToBoxAdapter(
          //   child: SearchField(),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Text(
                "Search Results",
                style: Theme.of(context).textTheme.titleLarge,
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
