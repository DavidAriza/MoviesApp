import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:prueba_gbp/data/data_source/movies_remote_data_source.dart';
import 'package:prueba_gbp/data/models/actor_model.dart';
import 'package:prueba_gbp/data/models/movie_model.dart';
import 'package:prueba_gbp/domain/entities/actor_entity.dart';
import 'package:prueba_gbp/domain/entities/movie_entity.dart';

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource  {
  
  final http.Client client;

  String _apikey    = '71d3194808b3b21a0fdd706e7f52fb89';
  String _url       = 'api.themoviedb.org';
  String _language  = 'en'; 

  int _popularesPage  = 0;
  bool _cargando      = false;

  MoviesRemoteDataSourceImpl({@required this.client});

  @override
  Future<List<ActorModel>> getCast(String peliId) async {
    final List<ActorModel> _cast = new List();
    final url = Uri.https(_url, '3/movie/$peliId/credits', {
      'api_key'   : _apikey,
      'language'  : _language
    });
    final resp = await client.get(url);
    final decodedData = json.decode(resp.body);
    var _actors = decodedData['cast'];
    for(var item in _actors) {
      _cast.add(ActorModel.fromJsonMap(item));
    }
    return _cast;
  }

  @override
  Future<List<MovieModel>> getPopularesMovies() async {
    final List<MovieModel>_pelis = new List();
    if (_cargando) return [];

    _cargando = true;
    _popularesPage++;
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key'   : _apikey,
      'language'  : _language,
      'page'      : _popularesPage.toString()
    });
    final resp = await client.get(url);
    final decodedData = json.decode(resp.body);
    var pelis = decodedData['results'];
    for(var item in pelis){
      _pelis.add(MovieModel.fromJsonMap(item));
    }
    _cargando = false;
    return _pelis;
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final List<MovieModel> _peliculas = new List();
    final url = Uri.https(_url, '3/movie/top_rated',{
      'api_key'   : _apikey,
      'language'  : _language,
    });
    final resp = await client.get(url);
    final decodedData = json.decode(resp.body);
    var pelis = decodedData['results'];
    for(var item in pelis){
      _peliculas.add(MovieModel.fromJsonMap(item));
    }
    return _peliculas;
  }

}