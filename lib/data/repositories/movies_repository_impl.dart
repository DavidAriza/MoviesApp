

import 'package:prueba_gbp/data/data_source/movies_remote_data_source.dart';
import 'package:prueba_gbp/domain/entities/actor_entity.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({this.remoteDataSource});

  @override
  Future<List<ActorEntity>> getCast(String peliId) async {
    return await remoteDataSource.getCast(peliId);
  }

  @override
  Future<List<MovieEntity>> getPopularesMovies() async {
    return await remoteDataSource.getPopularesMovies();
  }

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    return await remoteDataSource.getTopRatedMovies();
  }

}