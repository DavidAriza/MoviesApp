part of 'top_rated_movies_cubit.dart';

abstract class TopRatedMoviesState extends Equatable {
  const TopRatedMoviesState();

  @override
  List<Object> get props => [];
}

class TopRatedMoviesInitial extends TopRatedMoviesState {}



class TopRatedMoviesLoadingState extends TopRatedMoviesState{
  @override
  List<Object> get props => [];
}

class TopRatedMoviesLoadedState extends TopRatedMoviesState{
  final List<MovieEntity> topRatedMovies;
  final bool hasTopRatedReachedMax;

  const TopRatedMoviesLoadedState({this.topRatedMovies, this.hasTopRatedReachedMax}); 

  TopRatedMoviesLoadedState copyWith({
    List<MovieEntity> topRatedMovies,
    bool hasPopularReachedMax,
  }) {
    return TopRatedMoviesLoadedState(
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      hasTopRatedReachedMax: hasTopRatedReachedMax ?? this.hasTopRatedReachedMax,
    );
  }

  @override
  List<Object> get props => [topRatedMovies];
}