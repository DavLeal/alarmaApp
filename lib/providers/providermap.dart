import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _ProviderMap {
  List<dynamic> getOption = [];
  _ProviderMenu() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final value = await rootBundle.loadString('data/coordenadas.json');
    Map datos = json.decode(value);
    getOption = datos['rutas'];

    return getOption;
  }
}

final mapProvider = new _ProviderMap();
