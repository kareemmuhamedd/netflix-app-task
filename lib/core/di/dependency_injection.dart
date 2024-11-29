import 'package:dio/dio.dart';
import 'package:flutter_netflix_app/core/networking/dio_factory.dart';
import 'package:flutter_netflix_app/details/data/data_source/movie_episodes_remote_data_source.dart';
import 'package:flutter_netflix_app/details/domain/repository/episodes_repository.dart';
import 'package:flutter_netflix_app/details/domain/usecase/get_episodes.dart';
import 'package:flutter_netflix_app/details/presentation/bloc/movie_details_bloc.dart';
import 'package:flutter_netflix_app/home/data/data_source/movies_remote_data_source.dart';
import 'package:flutter_netflix_app/home/domain/repository/movie_repository.dart';
import 'package:flutter_netflix_app/home/domain/usecase/get_all_movies.dart';
import 'package:flutter_netflix_app/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../details/data/repositories/episodes_repository_impl.dart';
import '../../home/data/repositories/movie_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  /// home feature
  getIt.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(
      getIt<Dio>(),
    ),
  );
  getIt.registerFactory<MovieRepository>(
    () => MovieRepositoryImpl(
      getIt<MoviesRemoteDataSource>(),
    ),
  );
  getIt.registerFactory<GetAllMovies>(
    () => GetAllMovies(
      getIt<MovieRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => HomeBloc(
      getAllMovies: getIt<GetAllMovies>(),
    ),
  );

  /// details feature
  getIt.registerFactory<MovieEpisodesRemoteDataSource>(
    () => MovieEpisodesRemoteDataSourceImpl(
      getIt<Dio>(),
    ),
  );
  getIt.registerFactory<EpisodesRepository>(
    () => EpisodesRepositoryImpl(
      remoteDataSource: getIt<MovieEpisodesRemoteDataSource>(),
    ),
  );
  getIt.registerFactory<GetEpisodes>(
    () => GetEpisodes(
      getIt<EpisodesRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => MovieDetailsBloc(
      getEpisodes: getIt<GetEpisodes>(),
    ),
  );
}
