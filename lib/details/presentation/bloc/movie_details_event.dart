part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsEvent {
  const MovieDetailsEvent();
}

final class MovieDetailsEpisodeLoad extends MovieDetailsEvent {
  final String url;

  const MovieDetailsEpisodeLoad({required this.url});
}
