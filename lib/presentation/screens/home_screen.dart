import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:prueba_gbp/data/models/movie_model.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:prueba_gbp/presentation/blocs/bloc/popular_movies_bloc.dart';
//import 'package:prueba_gbp/presentation/blocs/popular_movies_bloc/popular_movies_cubit.dart';
import 'package:prueba_gbp/presentation/blocs/top_rated_movies_bloc/top_rated_movies_cubit.dart';

import 'package:prueba_gbp/presentation/widgets/movie_horizontal.dart';




class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<MovieEntity> _movies =[];
  ScrollController _scrollController = ScrollController();
  PopularMoviesBloc _popularMoviesBloc;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    _popularMoviesBloc = BlocProvider.of<PopularMoviesBloc>(context);
    super.initState();
  }

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
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                width: double.infinity,
                margin: EdgeInsets.only(top: size.height*0.3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  )
                ),
                child: SingleChildScrollView(
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
                  BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                    builder: (_, currentState) {
                      if(currentState is PopularMoviesInitial) {
                        return Center (child: CircularProgressIndicator(),);
                      }
                      if(currentState is PopularMoviesErrorState) {
                        return Center(
                          child: Text('Failed')
                        );
                      }
                      if( currentState is PopularMoviesLoadedState) {
                        if(currentState.popularMovies.isEmpty) {
                          return Center(
                            child: Text('no posts'),
                          );
                        }
                        return MovieHorizontal(peliculas: currentState.popularMovies, siguientePagina: ()=> _popularMoviesBloc.add(PopularMoviesFetched()),);
                        // return  Container(height: 250,
                        //   child: ListView.builder(
                        //     scrollDirection: Axis.horizontal,
                        //     controller: _scrollController,
                        //     itemBuilder: ( BuildContext context, int index){
                        //       return index >= currentState.popularMovies.length 
                        //           ? SizedBox.shrink() 
                        //           : Tarjetas(pelicula: currentState.popularMovies[index],);
                        //     },
                        //     itemCount: currentState.hasReachedMax
                        //         ? currentState.popularMovies.length
                        //         : currentState.popularMovies.length +1,
                        //   ),
                        // );
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
                  SizedBox(height: 10),
                  BlocBuilder<TopRatedMoviesCubit, TopRatedMoviesState>(
                    builder: (_, currentState){
                      if(currentState is TopRatedMoviesLoadingState) {
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent ){
      _popularMoviesBloc.add(PopularMoviesFetched());
  }
  }
}

class Tarjetas extends StatelessWidget {
  final MovieModel pelicula;
  const Tarjetas({Key key, this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        timeDilation = 1.5;
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
      child: Container(
          margin: EdgeInsets.only(right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 160.0,
                  width: 150,
                ),
              ),
              SizedBox(height: 7.0),
              Text(pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 5.0),
              RatingBarIndicator(
                rating: 2.5 ,
                itemBuilder: (_, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20,
                direction: Axis.horizontal,
              )
            ],
          ),
        ),
    );
  }
}