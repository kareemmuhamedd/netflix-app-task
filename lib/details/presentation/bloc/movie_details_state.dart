part of 'movie_details_bloc.dart';

enum MovieDetailsStatus {
  initial,
  loaded,
  loadFailed,
}

class MovieDetailsState extends Equatable {
  const MovieDetailsState._({
    required this.status,
    this.episodes,
    required this.error,
  });

  const MovieDetailsState.initial()
      : this._(
          status: MovieDetailsStatus.initial,
          episodes: null,
          error: '',
        );

  final MovieDetailsStatus status;

  final EpisodeEntity? episodes;
  final String error;

  @override
  List<Object?> get props => [status, episodes, error];

  MovieDetailsState copyWith({
    MovieDetailsStatus? status,
    EpisodeEntity? episodes,
    String? error,
  }) {
    return MovieDetailsState._(
      status: status ?? this.status,
      episodes: episodes ?? this.episodes,
      error: error ?? this.error,
    );
  }
}
