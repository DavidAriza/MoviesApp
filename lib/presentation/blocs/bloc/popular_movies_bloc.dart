import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/domain/usecases/get_populares_movies.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  
  final GetPopularesMoviesUseCase getPopularesMoviesUseCase;
  int page = 1;
  PopularMoviesBloc({this.getPopularesMoviesUseCase}) : super(PopularMoviesInitial());

  @override
  Stream<PopularMoviesState> mapEventToState(
    PopularMoviesEvent event,
  ) async* {
    final currentState = state;
    if(event is PopularMoviesFetched && !_hasReachedMax(currentState)){
      try {
        if(currentState is PopularMoviesInitial) {
          final popularMovies = await getPopularesMoviesUseCase.call(page);
          yield PopularMoviesLoadedState(
            popularMovies: popularMovies,
            hasReachedMax: false
          );
          return;
        }
        page++;
        if(currentState is PopularMoviesLoadedState){
          final popularMovies = await getPopularesMoviesUseCase.call(page);
          yield popularMovies.isEmpty 
              ? currentState.copyWith(hasReachedMax:true)
              : PopularMoviesLoadedState(
                popularMovies: currentState.popularMovies + popularMovies,
                hasReachedMax: false
              );
        }
      } catch (e) {
        yield PopularMoviesErrorState(error: e);
      }
    }
  }

  bool _hasReachedMax(PopularMoviesState currentState) => 
      currentState is PopularMoviesLoadedState && currentState.hasReachedMax;

  
}
