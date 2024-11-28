part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loaded,
  loadFailed,
}

class HomeState extends Equatable {
  const HomeState._({
    required this.status,
    required this.movies,
    required this.error,
  });

  const HomeState.initial()
      : this._(
          status: HomeStatus.initial,
          movies: const [],
          error: '',
        );

  final HomeStatus status;

  final List<TvShowResponse> movies;
  final String error;

  @override
  List<Object?> get props => [status, movies, error];

  HomeState copyWith({
    HomeStatus? status,
    List<TvShowResponse>? movies,
    String? error,
  }) {
    return HomeState._(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      error: error ?? this.error,
    );
  }
}
