import 'package:equatable/equatable.dart';


class ActorEntity extends Equatable {
  final int castId;
  final String character;
  final String creditId;
  final int gender;
  final int id;
  final String name;
  final int order;
  final String profilePath;

  ActorEntity({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  @override
  List<Object> get props => [
    castId,
    character,
    creditId,
    gender,
    id,
    name,
    order,
    profilePath,
  ];

}