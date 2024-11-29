part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  loading,
  loaded,
  loadFailed,
}

class SearchState extends Equatable {
  const SearchState._({
    required this.status,
    required this.movies,
    required this.error,
  });

  const SearchState.initial()
      : this._(
          status: SearchStatus.initial,
          movies: const [],
          error: '',
        );

  final SearchStatus status;

  final List<TvShowResponse> movies;
  final String error;

  @override
  List<Object?> get props => [status, movies, error];

  SearchState copyWith({
    SearchStatus? status,
    List<TvShowResponse>? movies,
    String? error,
  }) {
    return SearchState._(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      error: error ?? this.error,
    );
  }
}
