part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  
}

class MoviesInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
  
  
}

class MoviesLoadingState extends HomeState{
  @override
  List<Object> get props => [];
}

class PopularesMoviesLoadedState extends HomeState{
  final List<MovieEntity> popularesMovies;

  PopularesMoviesLoadedState(this.popularesMovies); 
  @override
  List<Object> get props => [popularesMovies];
}

class TopRatedMoviesLoadedState extends HomeState{
  final List<MovieEntity> topRatedMovies;

  TopRatedMoviesLoadedState(this.topRatedMovies); 
  @override
  List<Object> get props => [topRatedMovies];
}

