
import 'package:prueba_gbp/domain/entities/movie_entity.dart';
import 'package:meta/meta.dart';

class MovieModel extends MovieEntity {

  MovieModel({
    @required double  popularity,
    @required int  voteCount,
    @required bool  video,
    @required String  posterPath,
    @required int  id,
    @required bool  adult,
    @required String  backdropPath,
    @required String  originalLanguage,
    @required String  originalTitle,
    @required List<int> genreIds,
    @required String  title,
    @required double  voteAverage,
    @required String  overview,
    @required String  releaseDate,
  }) :  super(
          popularity        : popularity,
          voteCount         : voteCount, 
          video             : video,  
          posterPath        : posterPath, 
          id                : id,  
          adult             : adult,
          backdropPath      : backdropPath, 
          originalLanguage  : originalLanguage, 
          originalTitle     : originalTitle,  
          genreIds          : genreIds,  
          title             : title,  
          voteAverage       : voteAverage,  
          overview          : overview,  
          releaseDate       : releaseDate,
        );

  factory MovieModel.fromJsonMap(Map<String,dynamic> json){
    return MovieModel(
      popularity          : json['popularity'] / 1,
      voteCount           : json['vote_count'],
      video               : json['video'],
      posterPath          : json['poster_path'],
      id                  : json['id'],
      adult               : json['adult'],
      backdropPath        : json['backdrop_path'],
      originalLanguage    : json['original_language'],
      originalTitle       : json['original_title'],
      genreIds            : json['genre_ids'].cast<int>(),
      title               : json['title'],
      voteAverage         : json['vote_average']/1 ,
      overview            : json['overview'],
      releaseDate         : json['release_date'], 
    );
  }

  getPosterImg(){
    if (posterPath == null){
      return 'https://cdn-dom-p.azureedge.net/uk/en/-/media/DOM/PimDam/sorry-image-not-available.png?modified=20180213132206';
    } else{
    return 'https://image.tmdb.org/t/p/original//$posterPath';
  }}

  getBackgroundImg(){
    if (posterPath == null){
      return 'https://cdn-dom-p.azureedge.net/uk/en/-/media/DOM/PimDam/sorry-image-not-available.png?modified=20180213132206';
    } else{
    return 'https://image.tmdb.org/t/p/original//$backdropPath';
  }}

}