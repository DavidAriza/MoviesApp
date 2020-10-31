

import 'package:equatable/equatable.dart';
import 'package:prueba_gbp/domain/entities/actor_entity.dart';

class CastEntity extends Equatable {

  final List<ActorEntity> cast;

  CastEntity(this.cast);

  @override
  List<Object> get props => [
    cast
  ];



}