part of 'home_bloc.dart';


sealed class HomeEvent {
  const HomeEvent();
}
final class HomeLoadTvShows extends HomeEvent {
  const HomeLoadTvShows();
}
