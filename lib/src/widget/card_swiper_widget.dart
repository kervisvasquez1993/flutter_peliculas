import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:app_peliculas/src/models/pelicula_models.dart';

class CardSwiper extends StatelessWidget {
  // agregar argumento
  /*
    lista de tarjeta
  */
  final List<Pelicula> peliculas;
  CardSwiper(
      {@required this.peliculas}); // el constructor debe ser igual que la clase
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size; //
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            // para border redondeados
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              fit: BoxFit.cover,
            ),
          ); // border redondeado
        },
        // definir tamaño de la caja de switch
        itemCount: peliculas.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
