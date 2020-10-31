import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_gbp/data/data_source/movies_remote_data_source.dart';
import 'package:prueba_gbp/data/repositories/movies_repository_impl.dart';
import 'package:prueba_gbp/domain/repositories/movies_repository.dart';
import 'package:prueba_gbp/domain/usecases/get_populares_movies.dart';
import 'package:prueba_gbp/domain/usecases/get_top_rated_movies.dart';
import 'package:prueba_gbp/presentation/blocs/home_bloc/home_cubit.dart';
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
    return BlocProvider(
      create: (context) => di.sl<HomeCubit>()..getPopularMovies()..getTopRatedMovies(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
