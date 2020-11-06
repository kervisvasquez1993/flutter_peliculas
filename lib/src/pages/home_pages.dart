import 'package:app_peliculas/src/providers/peliculas_provider.dart';
import 'package:app_peliculas/src/widget/card_swiper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePages extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Peliculas en Cartelera'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              _swipperTarjetas(),
            ],
          ),
        ));
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
            height: 400, child: Center(child: CircularProgressIndicator()));
      }
    },
  );
  //
  /*return CardSwiper(
    peliculas: [1, 2, 3, 4, 5, 6],
  );
  */
}
