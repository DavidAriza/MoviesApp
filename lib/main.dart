import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_gbp/presentation/blocs/bloc/popular_movies_bloc.dart';
import 'package:prueba_gbp/presentation/blocs/top_rated_movies_bloc/top_rated_movies_cubit.dart';
import 'package:prueba_gbp/presentation/screens/home_screen.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider<PopularMoviesBloc>(
          create: (_) => di.sl<PopularMoviesBloc>()..add(PopularMoviesFetched()),
        ),
        BlocProvider<TopRatedMoviesCubit>(
          create: (_) => di.sl<TopRatedMoviesCubit>()..getTopRatedMovies(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
