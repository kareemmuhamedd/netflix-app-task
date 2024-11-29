import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix_app/core/constants/assets_images.dart';
import 'package:flutter_netflix_app/search/presentation/bloc/search_bloc.dart';
import 'package:flutter_netflix_app/search/presentation/widgets/search_app_bar.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/utils/debouncer.dart';
import '../../../details/presentation/view/movie_details_screen.dart';
import '../../../home/domain/entities/tv_show_response.dart';
import '../../../home/presentation/widgets/grid_view_item.dart';
import '../widgets/empty_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<SearchBloc>(),
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
  late final Debouncer _debouncer;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer(milliseconds: 500);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: SearchAppBar(debouncer: _debouncer),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state.status == SearchStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == SearchStatus.loaded &&
              state.movies.isNotEmpty) {
            return _buildMoviesGrid(state.movies);
          } else {
            return const EmptyWidget();
          }
        },
      ),
    );
  }

  Widget _buildMoviesGrid(List<TvShowResponse> movies) {
    return CustomScrollView(
      slivers: [
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
                      builder: (context) => MovieDetailsScreen(movie: movie),
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
    );
  }
}
