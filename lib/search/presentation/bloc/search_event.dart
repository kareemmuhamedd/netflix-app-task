part of 'search_bloc.dart';

sealed class SearchEvent {
  const SearchEvent();
}

final class SearchLoadTvShows extends SearchEvent {
  final String query;

  const SearchLoadTvShows(this.query);
}
