import 'package:app_peliculas/src/models/pelicula_models.dart';
import 'package:app_peliculas/src/providers/peliculas_provider.dart';
import 'package:app_peliculas/src/widget/card_swiper_widget.dart';
import 'package:app_peliculas/src/widget/movie_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePages extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    peliculasProvider.getPopulares();
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Peliculas en Cartelera'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //showSearch(context: null, delegate: null)
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[_swipperTarjetas(), _footer(context)],
          ),
        ));
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // esta propiedad es para colunmas
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5.0),
            child: Text(
              'Populares',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder:
                (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
              if (snapshot.hasData) {
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  sigueinteaPagenida: peliculasProvider.getPopulares,
                );
              } else {
                return CircularProgressIndicator();
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}

Widget _swipperTarjetas() {
  final peliculasProvider = new PeliculasProvider();
// atajo para future builder fub
  return FutureBuilder(
    future: peliculasProvider.getEnCine(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if (snapshot.hasData) {
        return CardSwiper(peliculas: snapshot.data);
      } else {
        return Container(
          height: 400,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    },
  );
  //
  /*return CardSwiper(
    peliculas: [1, 2, 3, 4, 5, 6],
  );
  */
}
