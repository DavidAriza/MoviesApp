

import 'package:prueba_gbp/data/models/actor_model.dart';
import 'package:prueba_gbp/domain/entities/cast_entity.dart';

class CastModel extends CastEntity {

  CastModel({
    List<ActorModel> cast
  }) : super(
        cast
      );


  factory CastModel.fromJsonList(List<dynamic> jsonList){
    List<ActorModel> actores = new List();
    
    if (jsonList == null ) return null;
    
    jsonList.forEach((item){
      final actor = ActorModel.fromJsonMap(item);
      actores.add(actor);
    });
    
    return CastModel(cast: actores);
  }

}