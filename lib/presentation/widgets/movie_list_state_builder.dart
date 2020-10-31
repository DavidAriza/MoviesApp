import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_gbp/presentation/blocs/home_bloc/home_cubit.dart';
import 'package:prueba_gbp/presentation/widgets/movie_horizontal.dart';

class MovieListStateBuilder extends StatelessWidget {
  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    var currentState = BlocProvider.of<HomeCubit>(context).state;
    if (currentState is MoviesLoadingState) {
      return CircularProgressIndicator();
    } else if (currentState is PopularesMoviesLoadedState) {
      return MovieHorizontal(peliculas: currentState.popularesMovies ,);
    } else if (currentState is TopRatedMoviesLoadedState) {
      return MovieHorizontal(peliculas: currentState.topRatedMovies);
    }
  }
}