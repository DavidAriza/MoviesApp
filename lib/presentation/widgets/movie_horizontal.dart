import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:prueba_gbp/data/models/movie_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieHorizontal extends StatelessWidget {

  final List<MovieModel> peliculas;
  final  siguientePagina;

  MovieHorizontal({@required this.peliculas,  this.siguientePagina});
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    _pageController.addListener((){
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent){
        siguientePagina();
      }
      if ( _pageController.position.pixels <= _pageController.position.minScrollExtent+80) {
         _pageController.position.animateTo(
          _screenSize.width * 0.3,
          duration: Duration(milliseconds: 600),
          curve: Curves.linearToEaseOut,
        );
      }
    });


    return Container(
      height: _screenSize.height*0.3,
      width: double.infinity,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i){
          return _tarjeta(context, peliculas[i] );
        },
        // children: _tarjetas(context)
      ) ,
    );
  }

  Widget _tarjeta (BuildContext context, MovieModel pelicula){

    //pelicula.uniqueID = '${pelicula.id}-poster';
    double rat = (pelicula.voteAverage*10) * 5/100;
    print(rat);
    return  GestureDetector(
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
                ),
              ),
              SizedBox(height: 7.0),
              Text(pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 5.0),
              RatingBarIndicator(
                rating: rat ,
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


