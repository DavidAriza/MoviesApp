

import 'package:prueba_gbp/domain/entities/actor_entity.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';

abstract class MoviesRepository {
  Future<List<MovieEntity>> getTopRatedMovies();
  Future<List<MovieEntity>> getPopularesMovies(int page);
  Future<List<ActorEntity>> getCast(String peliId);
}