import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_netflix_app/search/domain/usecase/get_searched_movie.dart';

import '../../../home/domain/entities/tv_show_response.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required GetSearchedMovies getSearchedMovies,
  })  : _getSearchedMovies = getSearchedMovies,
        super(const SearchState.initial()) {
    on<SearchLoadTvShows>(_searchedMoviesRequested);
  }

  final GetSearchedMovies _getSearchedMovies;

  void _searchedMoviesRequested(
    SearchLoadTvShows event,
    Emitter<SearchState> emit,
  ) async {
    final result = await _getSearchedMovies(event.query);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: SearchStatus.loadFailed,
            error: failure.message,
          ),
        );
      },
      (movies) {
        emit(
          state.copyWith(
            status: SearchStatus.loaded,
            movies: movies,
          ),
        );
      },
    );
  }
}
