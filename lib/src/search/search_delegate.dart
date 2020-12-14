import 'package:app_peliculas/src/models/pelicula_models.dart';
import 'package:app_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  String seleccion = "";
  final peliculaProvider = new PeliculasProvider();
  final peliculas = [
    'pelicula1',
    'pelicula2',
    'pelicula3',
    'pelicula4',
    'pelicula5',
    'pelicula6',
    'pelicula7',
    'pelicula8',
  ];
  final peliculasResientes = [
    'pelicula7',
    'pelicula8',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // las acciones de nuestro App
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //  Iconos a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // crea ,os resultado que vamos a mostrar
    return Center(
        child: Container(
      height: 100.0,
      width: 100.0,
      color: Colors.black12,
      child: Text(seleccion),
    ));
  }

  /*  @override
  Widget buildSuggestions(BuildContext context) {
    // sujerencias que aparencen cuando la persona escribe
    final listaSugerida = (query.isEmpty)
        ? peliculasResientes
        : peliculas
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaSugerida.length,
      itemBuilder: (context, i) {
        return ListTile(
            leading: Icon(Icons.movie),
            title: Text(listaSugerida[i]),
            onTap: () {
              seleccion = listaSugerida[i];
              showResults(context);
            });
      },
    );
  } */

  Widget buildSuggestions(BuildContext context) {
    // sujerencias que aparencen cuando la persona escribe
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: peliculaProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-imagen.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: () {
                  close(context, null);
                  pelicula.uniqueId = '';
                  Navigator.pushNamed(context, "detalle", arguments: {});
                },
              );
            }).toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
