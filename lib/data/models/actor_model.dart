

import 'package:meta/meta.dart';


import 'package:prueba_gbp/domain/entities/actor_entity.dart';


class ActorModel extends ActorEntity{

  ActorModel({
    @required int castId,
    @required String character,
    @required String creditId,
    @required int gender,
    @required int id,
    @required String name,
    @required int order,
    @required String profilePath,
  })  : super(
          castId : castId,
          character : character,
          creditId : creditId,
          gender : gender,
          id : id,
          name : name,
          order : order,
          profilePath : profilePath,
        );

  factory ActorModel.fromJsonMap(Map<String,dynamic> json){
    return ActorModel( 
      castId        : json['cast_id'],
      character     : json['character'],
      creditId      : json['credit_id'],
      gender        : json['gender'],
      id            : json['id'],
      name          : json['name'],
      order         : json['order'],
      profilePath   : json['profile_path'],
    );
  }

  

  getFoto(){
    if (profilePath == null){
      return 'https://s3-us-west-2.amazonaws.com/snap-sale/20180324200210/no-avatar.png';
    } else{
    return 'https://image.tmdb.org/t/p/original//$profilePath';
  }} 

}

