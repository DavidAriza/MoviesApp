

import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/domain/repositories/movies_repository.dart';

class GetTopRatedMoviesUseCase{
  final MoviesRepository repository;

  GetTopRatedMoviesUseCase({this.repository});

  Future<List<MovieEntity>> call() async{
    return await repository.getTopRatedMovies();
  }
}