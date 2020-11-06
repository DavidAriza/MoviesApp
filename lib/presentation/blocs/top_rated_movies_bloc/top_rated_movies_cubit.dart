import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/domain/usecases/get_top_rated_movies.dart';

part 'top_rated_movies_state.dart';

class TopRatedMoviesCubit extends Cubit<TopRatedMoviesState> {
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  
  TopRatedMoviesCubit({this.getTopRatedMoviesUseCase}) : super(TopRatedMoviesInitial());

  Future<void> getTopRatedMovies() async {
    try {
      emit(TopRatedMoviesLoadingState());
      final topRatedMovies = await getTopRatedMoviesUseCase.call();
      emit(TopRatedMoviesLoadedState(
        topRatedMovies: topRatedMovies ,
      ));
    } catch (e) {
      print(e);
    }
  }
}
