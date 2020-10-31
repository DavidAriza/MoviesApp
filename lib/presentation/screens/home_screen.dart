import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_gbp/data/data_source/movies_remote_data_source.dart';
import 'package:prueba_gbp/presentation/blocs/home_bloc/home_cubit.dart';

import 'package:prueba_gbp/presentation/widgets/movie_horizontal.dart';
import 'package:prueba_gbp/presentation/widgets/movie_list_state_builder.dart';

import '../../injection_container.dart';



class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

// @override
// void didChangeDependencies() {

//   _homeBloc = BlocProvider.of<HomeBloc>(context);

// super.didChangeDependencies();
// }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: SingleChildScrollView(
        child: _buildBody(size, context)
      ),
    );
  }

    _buildBody(Size size, BuildContext context, )  {
    return Column(
      children: [
        SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: size.height*0.7,
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height*0.3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'POPULARES',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'See all'
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (_, currentState) {
                    if(currentState is MoviesLoadingState) {
                      return CircularProgressIndicator();
                    }
                    else if (currentState is PopularesMoviesLoadedState )
                    return MovieHorizontal(peliculas: currentState.popularesMovies);
                    else {
                      return CircularProgressIndicator();
                    }
                  }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOP RATED',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'See all'
                    ),
                  ],
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (_, currentState){
                    if(currentState is MoviesLoadingState) {
                      return CircularProgressIndicator();
                    }
                    else if (currentState is TopRatedMoviesLoadedState )
                    return MovieHorizontal(peliculas: currentState.topRatedMovies);
                    else {
                      return CircularProgressIndicator();
                    }
                  }
                )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 23.0, left: 23.0, top: 80.0),
              child: Column(
                children: [              
                  Text(
                    'Hello, what do you \nwant to watch?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 32.0),
                        borderRadius: BorderRadius.circular(25.0)
                      ),
                    )
                  )
                ],
              ),
            )
          ],
        )
      )
    ],
    );
  }

}

