import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  // agregar argumento
  /*
    lista de tarjeta
  */
  final List<dynamic> peliculas;
  CardSwiper(
      {@required this.peliculas}); // el constructor debe ser igual que la clase
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 15.0),
      child: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "http://via.placeholder.com/350x150",
                fit: BoxFit.cover,
              )); // border redondeado
        },
        itemCount: peliculas.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
