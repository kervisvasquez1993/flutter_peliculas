import 'dart:convert';
import 'package:app_peliculas/src/models/pelicula_models.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apikey = 'c0058caea033d69feda5322a10c45381';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';
  Future<List<Pelicula>> getEnCine() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apikey, 'language': _language});

    final respuesta = await http.get(url);
    final decodeData = json.decode(respuesta.body);
    final peliculas = new Peliculas.fromJsonList(decodeData['results']);
    //print('RESPUESTA');
    //print(peliculas.items[0].title);
    return peliculas.items;
  }
}
