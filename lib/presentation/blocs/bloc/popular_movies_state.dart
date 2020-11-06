part of 'popular_movies_bloc.dart';

abstract class PopularMoviesState extends Equatable {
  const PopularMoviesState();
  
  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
  
}

// class MoviesLoadingState extends PopularMoviesState{
//   @override
//   List<Object> get props => [];
// }

class PopularMoviesLoadedState extends PopularMoviesState{
  final List<MovieEntity> popularMovies;
  final bool hasReachedMax;

  PopularMoviesLoadedState({this.popularMovies, this.hasReachedMax}); 

  PopularMoviesLoadedState copyWith({
    List<MovieEntity> popularMovies,
    bool hasReachedMax,
  }) {
    return PopularMoviesLoadedState(
      popularMovies: popularMovies ?? this.popularMovies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [popularMovies, hasReachedMax];
}

class PopularMoviesErrorState extends PopularMoviesState {
  final String error;

  const PopularMoviesErrorState({
     this.error,
  });

  @override
  // TODO: implement props
  List<Object> get props => [error];
}