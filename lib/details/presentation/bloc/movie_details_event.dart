part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsEvent {
  const MovieDetailsEvent();
}

final class MovieDetailsLoad extends MovieDetailsEvent {
  final String url;

  const MovieDetailsLoad({required this.url});
}
