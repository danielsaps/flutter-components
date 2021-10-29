import 'dart:math';

import 'package:componentes/src/widgets/fade_network_image.dart';
import 'package:flutter/material.dart';

class ListViewHorizontalPage extends StatelessWidget {
  static final String routeName = 'listview_horizontal';

  const ListViewHorizontalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> _listaNumeros = [];
    final random = new Random();
    for (var i = 0; i < 20; i++) {
      _listaNumeros.add(random.nextInt(80));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Horizontal'),
      ),
      body: Container(
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _listaNumeros.length,
            itemBuilder: (context, index) {
              final _imagen = _listaNumeros[index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 200,
                child: FadeNetworkImage(
                  image: 'https://picsum.photos/id/$_imagen/500/300',
                ),
              );
            },
          )),
    );
  }
}
