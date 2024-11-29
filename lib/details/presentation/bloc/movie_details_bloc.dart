import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_netflix_app/details/domain/entities/episode.dart';
import 'package:flutter_netflix_app/details/domain/usecase/get_episodes.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required GetEpisodes getEpisodes})
      : _getEpisodes = getEpisodes,
        super(const MovieDetailsState.initial()) {
    on<MovieDetailsEpisodeLoad>(_movieEpisodesRequested);
  }

  final GetEpisodes _getEpisodes;

  Future _movieEpisodesRequested(
    MovieDetailsEpisodeLoad event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await _getEpisodes(event.url);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: MovieDetailsStatus.loadFailed,
            error: failure.message,
          ),
        );
      },
      (episodes) {
        emit(
          state.copyWith(
            status: MovieDetailsStatus.loaded,
            episodes: episodes,
          ),
        );
      },
    );
  }
}
