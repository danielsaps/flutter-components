import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    // rootBundle.loadString('data/menu_opts.json').then((data) {
    //   print('Cargando Datos');
    //   Map dataMap = json.decode(data);
    //   print(dataMap);
    //   opciones = dataMap['rutas'];
    // });

    final data = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(data);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
