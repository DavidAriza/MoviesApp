
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/domain/repositories/movies_repository.dart';

class GetPopularesMoviesUseCase{
  final MoviesRepository repository;

  GetPopularesMoviesUseCase({this.repository});

  Future<List<MovieEntity>> call() async{
    return await repository.getPopularesMovies();
  }
}