import 'package:app_peliculas/src/models/pelicula_models.dart';
import 'package:flutter/material.dart';

class PeliculaDetalle extends StatelessWidget {
/*   final Pelicula pelicula;
  PeliculaDetalle(this.pelicula); */
  @override
  Widget build(BuildContext context) {
    // recibir argumento desde el pushName
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[_crearAppbar(pelicula)],
      ),
    );
  }

  _crearAppbar(Pelicula pelicula) {
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          pelicula.title,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        background: FadeInImage(
          image: NetworkImage(pelicula.getBackgroundImg()),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
