import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_netflix_app/core/usecase/usecase.dart';
import '../../domain/entities/tv_show_response.dart';
import '../../domain/usecase/get_all_movies.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetAllMovies getAllMovies,
  })  : _getAllMovies = getAllMovies,
        super(const HomeState.initial()) {
    on<HomeLoadTvShows>(_homeLoadTvShowsRequested);
  }

  final GetAllMovies _getAllMovies;

  void _homeLoadTvShowsRequested(
    HomeLoadTvShows event,
    Emitter<HomeState> emit,
  ) async {
    final result = await _getAllMovies(NoParams());
    result.fold(
      (failure) {
        emit(
        state.copyWith(
          status: HomeStatus.loadFailed,
          error: failure.message,
        ),
      );
      },
      (movies) {
        emit(
        state.copyWith(
          status: HomeStatus.loaded,
          movies: movies,
        ),
      );
      },
    );
  }
}
