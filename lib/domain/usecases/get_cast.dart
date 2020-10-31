
import 'package:prueba_gbp/domain/entities/actor_entity.dart';
import 'package:prueba_gbp/domain/repositories/movies_repository.dart';

class GetCastUseCase{
  final MoviesRepository repository;

  GetCastUseCase(this.repository);

  Future<List<ActorEntity>> call(String peliId) async{
    return await repository.getCast( peliId);
  }
}